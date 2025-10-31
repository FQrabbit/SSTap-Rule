#!/usr/bin/env bash
set -eu
regex="(^0|^127|^255|^10|^172\.(1[6-9]|2[0-9]|3[01])|^192\.168|^169\.254|^22[4-9]|^2[3-5][0-9])\."
logfile="removed_reserved_ips.log"
>"$logfile"
count_files=0
count_lines=0
while IFS= read -r -d '' file; do
  # skip files with Bypass in name
  if [[ "$(basename "$file")" == *Bypass* ]]; then
    continue
  fi
  # check if file has matches
  if grep -q -E "$regex" "$file"; then
    count_files=$((count_files+1))
    # save removed lines to log with filename header
    echo "---- $file ----" >>"$logfile"
    grep -n -E "$regex" "$file" >>"$logfile" || true
    # remove matching lines in-place (create .bak and move)
    sed -E "/$regex/d" "$file" >"$file.tmp" && mv "$file.tmp" "$file"
    # count removed lines
    n=$(grep -c -E "$regex" "$file" || true)
    # since we removed them, n should be 0; compute removed by counting in log
    removed_in_file=$(grep -c "^" <(grep -n -E "$regex" "$file" 2>/dev/null) || true)
    # instead, count from logfile section
    # approximate by counting lines under the last header
    # we'll compute total after loop
  fi
done < <(find rules -type f -print0)
# compute total removed lines from logfile
count_lines=$(grep -E -c "(^0|^127|^255|^10|^172\.(1[6-9]|2[0-9]|3[01])|^192\.168|^169\.254|^22[4-9]|^2[3-5][0-9])\." "$logfile" || true)

echo "modified_files=$count_files" >removed_summary.tmp
echo "removed_lines=$count_lines" >>removed_summary.tmp
cat removed_summary.tmp
rm -f removed_summary.tmp
