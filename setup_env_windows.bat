@REM IF YOU ARE USING WINDOWS RUN: .\setup_env_windows.bat

@echo off
echo This will configure all the files and folders needed for the project and overwrite the README file.
:confirm
set /p confirm="Type 'y' to continue or 'n' to cancel: "
if /i "%confirm%"=="y" (
    echo Proceeding with setup...
) else if /i "%confirm%"=="n" (
    echo Setup cancelled.
    exit /b
) else (
    echo Invalid input. Please type 'y' or 'n'.
    goto confirm
)

echo CREATING VIRTUAL ENVIRONMENT FOR PYTHON PROJECT...
python -m venv venv
if %errorlevel% neq 0 (
    echo ERROR WHILE CREATING VIRTUAL ENVIRONMENT!
    exit /b %errorlevel%
)
echo VIRTUAL ENVIRONMENT CREATED SUCCESSFULLY!

echo ACTIVATING VIRTUAL ENVIRONMENT...
call "%~dp0venv\Scripts\activate"
if %errorlevel% neq 0 (
    echo ERROR WHILE ACTIVATING VIRTUAL ENVIRONMENT!
    exit /b %errorlevel%
)
echo VIRTUAL ENVIRONMENT ACTIVATED SUCCESSFULLY!

echo INSTALLING DEPENDENCIES...
pip install PySide6 Pillow PyInstaller
if %errorlevel% neq 0 (
    echo ERROR WHILE INSTALLING DEPENDENCIES!
    exit /b %errorlevel%
)
echo DEPENDENCIES INSTALLED SUCCESSFULLY!

echo SAVING DEPENDENCIES TO requirements.txt...
pip freeze > requirements.txt
if %errorlevel% neq 0 (
    echo ERROR WHILE SAVING DEPENDENCIES TO requirements.txt!
    exit /b %errorlevel%
)
echo DEPENDENCIES SAVED SUCCESSFULLY!

echo CREATING PROJECT STRUCTURE...
mkdir images
mkdir modules
mkdir interface\ui
mkdir interface\py
mkdir notes
mkdir tests
mkdir utils

echo CREATING USEFULL FILES...
echo. > notes\notes.txt
echo. > utils\utils.txt
del README.md
echo. > README.md

echo PROJECT STRUCTURE CREATED SUCCESSFULLY!

echo ADDING FILES TO GIT...
git add .
git rm --cached setup_env_windows.bat setup_env_linux.sh setup_env_macos.sh
if %errorlevel% neq 0 (
    echo ERROR WHILE ADDING FILES TO GIT!
    exit /b %errorlevel%
)
echo FILES ADDED TO GIT SUCCESSFULLY!

echo COMMITTING FILES TO GIT...
git commit -a -m "The entire framework configuration is set."
if %errorlevel% neq 0 (
    echo ERROR WHILE COMMITTING FILES TO GIT!
    exit /b %errorlevel%
)
echo FILES COMMITTED TO GIT SUCCESSFULLY!

echo PUSHING FILES TO GIT...
git push
if %errorlevel% neq 0 (
    echo ERROR WHILE PUSHING FILES TO GIT!
    exit /b %errorlevel%
)
echo FILES PUSHED TO GIT SUCCESSFULLY!

echo DELETING CONFIGURATION FILES...
echo PROJECT SETUP COMPLETED SUCCESSFULLY!
echo YOU CAN NOW START WORKING ON YOUR PROJECT!

del setup_env_linux.sh
del setup_env_macos.sh
pause
cmd /c del "%~f0"