# Project Setup

This project includes an automated setup script to configure the necessary environment, dependencies, and directory structure for development.

## Getting Started

### Windows
To set up the project on Windows, open a terminal (Command Prompt or PowerShell) in the project directory and run:
```sh
setup_env_windows.bat
```
This script will:
- Create a Python virtual environment.
- Install required dependencies (`PySide6`, `Pillow`, and `PyInstaller`).
- Save dependencies to `requirements.txt`.
- Create the necessary project directories.
- Initialize a Git repository and commit the initial files.
- Push the files to a remote repository (if configured).
- Delete itself and other setup files.

### Linux/macOS
For Linux and macOS, use the following commands:
```sh
chmod +x setup_env_linux.sh  # Grant execution permission
./setup_env_linux.sh         # Run the setup script
```
Or for macOS:
```sh
chmod +x setup_env_macos.sh  # Grant execution permission
./setup_env_macos.sh         # Run the setup script
```

## Project Structure
The setup script creates the following directory structure:
```
project_root/
│-- images/
│-- modules/
│-- interface/
│   ├── ui/
│   ├── py/
│-- notes/
│   ├── notes.txt
│-- tests/
│-- utils/
│   ├── utils.txt
│-- venv/  (Python virtual environment)
│-- requirements.txt
│-- README.md
```

## Dependencies
The project uses the following Python dependencies:
- `PySide6` (for GUI applications)
- `Pillow` (for image processing)
- `PyInstaller` (for packaging the application)

All dependencies are automatically installed by the setup script and listed in `requirements.txt`.

## Usage
After running the setup script:
1. Activate the virtual environment:
   - Windows:
     ```sh
     venv\Scripts\activate
     ```
   - Linux/macOS:
     ```sh
     source venv/bin/activate
     ```
2. Start coding!

## Contributing
Feel free to submit pull requests or open issues if you have suggestions for improvements.

## License
This project is licensed under the MIT License.

