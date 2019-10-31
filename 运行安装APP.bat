@echo off
SET /A count=1
SET /A success_count=0
SET /A fail_count=0
SET app_name=Camera2.apk

echo "Install app name: %app_name%"
echo "--------------------------------------------"
echo "--------------------------------------------" >> log.txt
:loop

call mycolor.exe 07
echo ���д���: %count%
@adb shell "cat /proc/cpuinfo|grep Serial"
cls
echo "--------------------------------------------"
echo "--------------------------------------------" >> log.txt
adb shell "cat /proc/cpuinfo|grep Serial"
adb shell "cat /proc/cpuinfo|grep Serial" >> log.txt
for /f %%i in ('adb install -r %cd%\%app_name%') do set install_ret=%%i

echo %install_ret%|findstr "^Success" >nul
if %errorlevel% equ 0 (
goto install_ok
) else (
goto install_ng
)

:loop2
call mycolor.exe 07
echo �ܴ���%count%,�ɹ�����%success_count%��ʧ�ܴ���%fail_count%
echo "�ܴ���%count%,�ɹ�����%success_count%��ʧ�ܴ���%fail_count%" >> log.txt
set /a count+=1
echo "--------------------------------------------"
echo "--------------------------------------------" >> log.txt

choice /t 15 /d y /n >nul

goto loop


:install_ok
adb shell "sync"
call mycolor.exe 02
echo ">>>>>>>>>>>>>>"   ���:PASS,��װ�ɹ�...
echo "���:PASS,��װ�ɹ�..." >> log.txt
set /a success_count+=1
goto loop2


:install_ng
call mycolor.exe 04
echo ">>>>>>>>>>>>>>"   ���:FAIL,��װʧ��!!!!
echo "���:FAIL,��װʧ��!!!!" >> log.txt
set /a fail_count+=1
goto loop2
