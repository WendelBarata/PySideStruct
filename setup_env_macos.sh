# IF YOU ARE USING MACOS, USE THE FOLLOWING COMMANDS TO RUN THIS SCRIPT:
# EXECUTE PERMISSION:     chmod +x setup_env_macos.sh
# RUN:                    ./setup_env_macos.sh


#!/bin/bash
echo "This will configure all the files and folders needed for the project and overwrite the README file."

# Confirmation prompt
while true; do
    read -p "Type 'y' to continue or 'n' to cancel: " confirm
    case "$confirm" in
        [Yy]* ) 
            echo "Proceeding with setup..."
            break
            ;;
        [Nn]* )
            echo "Setup cancelled."
            exit 0
            ;;
        * )
            echo "Invalid input. Please type 'y' or 'n'."
            ;;
    esac
done

echo "CREATING VIRTUAL ENVIRONMENT FOR PYTHON PROJECT..."
python3 -m venv venv
if [ $? -ne 0 ]; then
    echo "ERROR WHILE CREATING VIRTUAL ENVIRONMENT!"
    exit 1
fi
echo "VIRTUAL ENVIRONMENT CREATED SUCCESSFULLY!"

echo "ACTIVATING VIRTUAL ENVIRONMENT..."
source venv/bin/activate
if [ $? -ne 0 ]; then
    echo "ERROR WHILE ACTIVATING VIRTUAL ENVIRONMENT!"
    exit 1
fi
echo "VIRTUAL ENVIRONMENT ACTIVATED SUCCESSFULLY!"

echo "INSTALLING DEPENDENCIES..."
pip install PySide6 Pillow PyInstaller
if [ $? -ne 0 ]; then
    echo "ERROR WHILE INSTALLING DEPENDENCIES!"
    exit 1
fi
echo "DEPENDENCIES INSTALLED SUCCESSFULLY!"

echo "SAVING DEPENDENCIES TO requirements.txt..."
pip freeze > requirements.txt
if [ $? -ne 0 ]; then
    echo "ERROR WHILE SAVING DEPENDENCIES TO requirements.txt!"
    exit 1
fi
echo "DEPENDENCIES SAVED SUCCESSFULLY!"

echo "CREATING PROJECT STRUCTURE..."
mkdir -p images modules interface/ui interface/py notes tests utils
if [ $? -ne 0 ]; then
    echo "ERROR WHILE CREATING PROJECT STRUCTURE!"
    exit 1
fi
echo "PROJECT STRUCTURE CREATED SUCCESSFULLY!"

echo "CREATING USEFUL FILES..."
touch notes/notes.txt utils/utils.txt README.md
if [ $? -ne 0 ]; then
    echo "ERROR WHILE CREATING USEFUL FILES!"
    exit 1
fi
echo "USEFUL FILES CREATED SUCCESSFULLY!"

echo "ADDING FILES TO GIT..."
git add .
if [ $? -ne 0 ]; then
    echo "ERROR WHILE ADDING FILES TO GIT!"
    exit 1
fi
echo "FILES ADDED TO GIT SUCCESSFULLY!"

echo "COMMITTING FILES TO GIT..."
git commit -a -m "The entire framework configuration is set."
if [ $? -ne 0 ]; then
    echo "ERROR WHILE COMMITTING FILES TO GIT!"
    exit 1
fi
echo "FILES COMMITTED TO GIT SUCCESSFULLY!"

echo "PUSHING FILES TO GIT..."
git push
if [ $? -ne 0 ]; then
    echo "ERROR WHILE PUSHING FILES TO GIT!"
    exit 1
fi
echo "FILES PUSHED TO GIT SUCCESSFULLY!"

echo "DELETING CONFIGURATION FILES..."
rm -f setup_env_windows.bat setup_env_linux.sh setup_env_macos.sh
if [ $? -ne 0 ]; then
    echo "ERROR WHILE DELETING CONFIGURATION FILES!"
    exit 1
fi
echo "CONFIGURATION FILES DELETED SUCCESSFULLY!"

echo "PROJECT SETUP COMPLETED SUCCESSFULLY!"
echo "YOU CAN NOW START WORKING ON YOUR PROJECT!"
read -p "PRESS ENTER TO EXIT..."