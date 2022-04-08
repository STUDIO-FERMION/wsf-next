@echo off
set UNAME=admin
set SYS=MSYS

for /f "usebackq delims=: tokens=1-5" %%i in (`%~d0%~p0usr\bin\mkpasswd -c`) do (echo %%i:%%j:%%k:%%l:%%m:/home/%UNAME%:/bin/bash > %~d0%~p0etc\passwd)
%~d0%~p0usr\bin\mkgroup -c > %~d0%~p0\etc\group

%~d0%~p0usr\bin\env PATH=%~d0%~p0usr\bin MSYSTEM=%SYS% HOME=/home/%UNAME% /bin/bash --login -i %*

exit /b
