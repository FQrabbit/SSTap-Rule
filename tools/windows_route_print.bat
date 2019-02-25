@echo off
set "time_code=%date:~0,4%_%date:~5,2%_%date:~8,2%_%time:~0,2%_%time:~3,2%_%time:~6,2%"

cd /d %~dp0

echo.
echo 选择功能：
echo 1.将把路由信息输出到
echo   本批处理文件所在文件夹下
echo   文件名为当前时间
echo 2.生成新的规则文件头部
echo   (注意会覆盖当前文件夹下的同名文件)
echo   之后执行功能1
echo.
echo 所有文件格式均为UTF-8编码/CRLF行尾
echo 建议手动转换为UTF-8编码/LF行尾
echo 注意如果使用git提交时
echo git默认会帮你把文件行尾的CRLF转换为LF
echo 参考: github.com/cssmagic/blog/issues/22
echo.
echo 直接回车为功能1
echo 输入其他字符再回车为功能2
set /p is_cplx=
if defined is_cplx goto :CPLX
goto :SMPL

:CPLX
echo.
echo 输入规则文件名
echo 建议使用纯英文字符
set /p rules_name=
echo.
echo 输入规则文件头部信息
echo.
echo 输入规则英文名
set /p rules_en=
echo.
echo 输入规则中文名
set /p rules_cn=
echo.
echo 选择规则代理类型
echo 直接回车为代理
echo 输入其他字符再回车为直连
set /p is_drc=
if defined is_drc (
    set is_drc=1
) else (set is_drc=0)
echo.
echo 输入贡献者名称
echo 直接回车为FQrabbit
echo 否则使用你输入的字符
echo 本文件将贡献者部分统一格式为
echo By-XXX(XXX为你输入的贡献者名称)
echo 也就是说你不需要输入"By-"这部分
set /p contributor=
if not defined contributor set "contributor=FQrabbit"
echo.

:SMPL
chcp 65001
if defined is_cplx (
    echo #%rules_en%,%rules_cn%,%is_drc%,%is_drc%,1,0,1,0,By-%contributor%> "%~dp0%rules_name%.rules"
)
route print -4> "%time_code%.txt"
chcp 936
echo.
echo 请查看当前目录
echo "%~dp0"
echo 中是否有以下文件生成
echo %time_code%.txt
if defined is_cplx (
    echo %rules_name%.rules
)
echo.
echo 请Ctrl-A全选"%time_code%.txt"中的内容
echo 并复制到该网站进行转换
echo tool.ssrshare.us/tool/routeToRules
echo 然后参考以下方法创建规则文件
echo github.com/FQrabbit/SSTap-Rule/wiki/创建规则教程-之-提取加速器规则（超详细）
echo.
echo 如果转换结果为空
echo 请将网易UU加速模式只选为模式三
echo 或者将模式一二三全选
echo 再重新加速并重复以上步骤
echo.
echo 如果文件未能生成
echo 请检查当前文件夹写入权限
echo 或者打开命令行
echo 在普通用户权限可写入文件的文件夹内
echo 运行以下指令
echo route print -4^> xxx.txt
echo.
call cmd