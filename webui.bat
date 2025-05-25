@echo off

if defined GIT (set "GIT_PYTHON_GIT_EXECUTABLE=%GIT%")

set SD_WEBUI_RESTART=tmp/restart
set ERROR_REPORTING=FALSE

if %PYTHON_CHECK% == false goto :check_pip
title Stable-Diffusion-WebUI - python�̊m�F
python -c "" >tmp/stdout.txt 2>tmp/stderr.txt
if %ERRORLEVEL% == 0 goto :check_pip
echo python���C���X�g�[������Ă��܂���B
goto :show_stdout_stderr

:check_pip
title Stable-Diffusion-WebUI - pip�̊m�F
python -m pip --help >tmp/stdout.txt 2>tmp/stderr.txt
if %ERRORLEVEL% == 0 goto :upgrade_pip
title Stable-Diffusion-WebUI - pip�̃C���X�g�[��
if "%PIP_INSTALLER_LOCATION%" == "" goto :show_stdout_stderr
python "%PIP_INSTALLER_LOCATION%" >tmp/stdout.txt 2>tmp/stderr.txt
if %ERRORLEVEL% == 0 goto :accelerate_launch
echo pip���C���X�g�[���ł��܂���ł����B
goto :show_stdout_stderr

:upgrade_pip
title Stable-Diffusion-WebUI - pip�̃A�b�v�O���[�h
python -m pip install --upgrade pip
if %ERRORLEVEL% == 0 goto :accelerate_launch
echo �x��:PIP�o�[�W�������A�b�v�O���[�h�ł��܂���ł����B

:accelerate_launch
title Stable-Diffusion-WebUI - accelerate�ł̋N��
accerelate launch --num_cpu_threads_per_process=6 launch.py >tmp/stdout.txt 2>tmp/stderr.txt
if not %ERRORLEVEL% == 0 goto :launch
if EXIST tmp/restart goto :accelerate_launch
pause
exit /b

:launch
title Stable-Diffusion-WebUI - �N��
python launch.py %*
if EXIST tmp/restart goto :accelerate_launch
pause
exit /b

:show_stdout_stderr

echo.
echo �I���R�[�h: %errorlevel%

for /f %%i in ("tmp\stdout.txt") do set size=%%~zi
if %size% equ 0 goto :show_stderr
echo.
echo �W���o��:
type tmp\stdout.txt

:show_stderr
for /f %%i in ("tmp\stderr.txt") do set size=%%~zi
if %size% equ 0 goto :show_stderr
echo.
echo �W���G���[�o��:
type tmp\stderr.txt

:endofscript
title Stable-Diffusion-WebUI - �I��

echo.
echo �N���Ɏ��s���܂����B�I�����܂��B
pause
