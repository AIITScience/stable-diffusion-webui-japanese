@echo off

if defined GIT (set "GIT_PYTHON_GIT_EXECUTABLE=%GIT%")

set SD_WEBUI_RESTART=tmp/restart
set ERROR_REPORTING=FALSE

if %PYTHON_CHECK% == false goto :check_pip
title Stable-Diffusion-WebUI - pythonの確認
python -c "" >tmp/stdout.txt 2>tmp/stderr.txt
if %ERRORLEVEL% == 0 goto :check_pip
echo pythonがインストールされていません。
goto :show_stdout_stderr

:check_pip
title Stable-Diffusion-WebUI - pipの確認
python -m pip --help >tmp/stdout.txt 2>tmp/stderr.txt
if %ERRORLEVEL% == 0 goto :upgrade_pip
title Stable-Diffusion-WebUI - pipのインストール
if "%PIP_INSTALLER_LOCATION%" == "" goto :show_stdout_stderr
python "%PIP_INSTALLER_LOCATION%" >tmp/stdout.txt 2>tmp/stderr.txt
if %ERRORLEVEL% == 0 goto :accelerate_launch
echo pipをインストールできませんでした。
goto :show_stdout_stderr

:upgrade_pip
title Stable-Diffusion-WebUI - pipのアップグレード
python -m pip install --upgrade pip
if %ERRORLEVEL% == 0 goto :accelerate_launch
echo 警告:PIPバージョンをアップグレードできませんでした。

:accelerate_launch
title Stable-Diffusion-WebUI - accelerateでの起動
accerelate launch --num_cpu_threads_per_process=6 launch.py >tmp/stdout.txt 2>tmp/stderr.txt
if not %ERRORLEVEL% == 0 goto :launch
if EXIST tmp/restart goto :accelerate_launch
pause
exit /b

:launch
title Stable-Diffusion-WebUI - 起動
python launch.py %*
if EXIST tmp/restart goto :accelerate_launch
pause
exit /b

:show_stdout_stderr

echo.
echo 終了コード: %errorlevel%

for /f %%i in ("tmp\stdout.txt") do set size=%%~zi
if %size% equ 0 goto :show_stderr
echo.
echo 標準出力:
type tmp\stdout.txt

:show_stderr
for /f %%i in ("tmp\stderr.txt") do set size=%%~zi
if %size% equ 0 goto :show_stderr
echo.
echo 標準エラー出力:
type tmp\stderr.txt

:endofscript
title Stable-Diffusion-WebUI - 終了

echo.
echo 起動に失敗しました。終了します。
pause
