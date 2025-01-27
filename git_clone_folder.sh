#!/bin/bash

# Assign the script name as a variable
SCRIPT_NAME=${1:-"git_clone_folder.sh"}  # If no argument is passed, it defaults to "git_clone_folder.sh"

echo "# ================================================================================= "
echo "# 🐻  Cool Git Folder Clone 🐻"
echo "# ================================================================================= "
echo "# Date        : $(date +"%Y-%m-%d")"
echo "# Script Name : $SCRIPT_NAME"
echo "# Owner       : Vitali M."
echo "# Description : This script clones a specific folder from a Git repository branch."
echo "# ================================================================================= "

cat << "EOF"
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⣤⣄⣀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡴⠚⠉⠀⠀⠀⠀⠉⠳⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⠤⠔⡲⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠢⣀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡴⠚⠁⠀⣠⢊⣀⡀⠀⠀⠀⢀⣀⠤⠤⠤⠤⣀⠤⠚⠉⠉⠉⢷⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⡾⠋⠀⠀⠀⠀⡟⠉⠀⠉⠙⠒⠲⠁⠀⠀⠀⠀⠀⠀⡴⠚⠉⠉⠂⢸⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⢀⡴⠁⠀⠀⠀⠀⡜⠀⡇⢏⠓⠦⠤⡴⠃⠀⠀⠀⡆⠀⠀⠀⠙⠲⠤⣀⠀⠘⠿⣆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⢀⡞⠀⠀⡴⠀⠀⡸⠁⠀⠸⡌⠁⣠⠞⠀⠀⠀⠀⠀⡇⠀⠀⠀⠀⠀⠀⠀⠑⢄⠀⢻⣧⡀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⡾⠀⠀⢰⠁⠀⠠⠇⠀⠀⠀⣧⠈⠁⠀⠀⠀⠀⠀⠀⣇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⡇⠱⡄⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⢸⠃⠀⠀⡜⠀⠀⠀⠀⠀⠀⠀⢿⠀⠀⠀⠀⠀⠀⠀⠀⠿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡇⠀⠹⡄⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⡿⠀⠀⢠⡇⠀⠀⠀⠀⠀⠀⠀⠘⠤⡀⠀⠀⠀⣠⣀⠀⠀⠀⢀⣤⣤⠀⠀⠀⠀⠘⠀⡜⠁⠀⠀⢳⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⢰⠇⠀⠀⠘⣇⠀⠀⢀⠀⠀⠀⠀⠀⠀⠱⡄⠀⠀⠙⠛⠁⠀⠀⠀⢩⠁⠀⠀⠀⢠⣮⠎⠀⠀⠀⠀⢸⡆⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⡾⠀⠀⠀⠀⢻⡄⠀⠸⡇⠀⠀⠀⠀⠀⠀⠹⣄⠀⠀⢿⠀⠀⠀⠀⠘⡄⠀⠀⡰⠋⠁⠀⠀⠀⠀⠀⠈⡇⠀⠀⠀⠀⠀
⠀⠀⠀⠀⢠⠇⠀⠀⠀⠀⠀⢳⡀⠀⣇⠀⠀⠀⠀⠀⠀⠀⠈⠑⢾⡞⠀⣀⣄⣀⡀⢹⢃⠜⠀⠀⠀⠀⠀⠀⠀⠀⠀⣷⠀⠀⠀⠀⠀
⠀⠀⠀⠀⣼⠀⠀⠀⠀⠀⠀⠀⠳⡄⢸⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢻⣯⣠⣤⣤⢃⡾⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢹⡄⠀⠀⠀⠀
⠀⠀⠀⢠⡇⠀⠀⠀⠀⠀⠀⠀⠀⠙⢌⣇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠻⠷⠶⠟⠋⠀⣠⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠻⣄⠀⠀⠀
⠀⠀⠀⢸⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠻⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡠⠤⠐⠁⣇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠹⣆⠀⠀
⠀⠀⠀⣼⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢻⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢰⠀⠀⠀⢠⠛⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢻⠀⠀
⠀⠀⠀⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡼⢧⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⠀⠀⠀⡎⠀⠙⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⡇⠀
⠀⠀⢰⠇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⠏⠀⢸⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⠀⠀⠀⢳⠀⠀⠈⠳⣄⡰⠀⠀⠀⠀⠀⠀⠀⢀⠇⠀
⠀⠀⢸⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⠞⠁⠀⠀⠀⣧⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⠇⠀⠀⠈⡆⠀⠀⢠⡞⠁⠀⠀⠀⠀⠀⠀⠀⡼⠀⠀
⠀⠀⣸⠀⠀⠀⠀⠀⠀⠀⠀⣠⠏⠀⠀⠀⠀⠀⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢧⠀⠀⢰⠃⠀⣤⣏⠀⠀⠀⠀⠀⠀⠀⣠⡞⠁⠀⠀
⠀⠀⡿⠀⠀⠀⠀⠀⠀⢀⡴⠃⠀⠀⠀⠀⠀⠀⢸⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⠇⠀⡇⠀⠀⢻⡿⣦⡀⠀⠀⠀⣠⠾⠋⠀⠀⠀⠀
⠀⢰⡇⠀⠀⠀⠀⠀⠀⡜⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⣧⠀⠀⠀⠀⠀⠀⠀⠀⠸⠀⢸⠁⠀⠀⠀⠉⠉⠙⠓⠚⠋⠁⠀⠀⠀⠀⠀⠀
⠠⠼⠥⠤⠤⠤⠤⠤⠤⠧⠤⠤⠤⠀⠀⠀⠀⠀⠀⠀⠘⣧⠀⠀⠀⠀⠀⠀⠀⠀⣇⣸⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠉⠉⠉⠉⠉⠉⠒⠒⠒⠒⠛⠛⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀

🐻 DevOps Bear 🐻 - **Automation Is Everything**

EOF

# =====================
# Function to show help
show_help() {
    echo "Usage: $0 [options]"
    echo ""
    echo "Options:"
    echo "  -r, --repository   Git repository URL (required)"
    echo "  -b, --branch       Branch name to clone from (required)"
    echo "  -f, --folder       Folder name to clone (required)"
    echo "  -h, --help         Show this help message"
    echo ""
}

# =====================
# Parse command-line options
while [[ "$1" != "" ]]; do
    case $1 in
        -r | --repository ) shift
                            REPO_URL=$1
                            ;;
        -b | --branch )     shift
                            BRANCH=$1
                            ;;
        -f | --folder )     shift
                            FOLDER=$1
                            ;;
        -h | --help )       show_help
                            exit
                            ;;
        * )                 show_help
                            exit 1
    esac
    shift
done

# =====================
# Request user input if not provided via arguments
if [ -z "$REPO_URL" ]; then
    read -p "Enter the Git repository URL: " REPO_URL
fi

if [ -z "$BRANCH" ]; then
    read -p "Enter the branch name: " BRANCH
fi

if [ -z "$FOLDER" ]; then
    read -p "Enter the folder name to clone: " FOLDER
fi

# =====================
# Main functionality: Cloning specific folder from the repo

echo "Checking if branch '$BRANCH' exists in repository '$REPO_URL'..."
git ls-remote --exit-code --heads "$REPO_URL" "$BRANCH" > /dev/null
if [ $? -ne 0 ]; then
    echo "Error: Branch '$BRANCH' does not exist in the repository."
    exit 1
fi

echo "Checking if folder '$FOLDER' exists in branch '$BRANCH' of repository '$REPO_URL'..."

# Clone the repository without initializing a new repository in PASV folder
git clone --branch "$BRANCH" --single-branch "$REPO_URL" temp_repo

# Check if the folder exists in the cloned repository
if [ ! -d "temp_repo/$FOLDER" ]; then
    echo "Error: Folder '$FOLDER' does not exist in branch '$BRANCH'."
    rm -rf temp_repo
    exit 1
fi

# =====================
# Copy the folder to the current directory
echo "Copying the folder '$FOLDER'..."
cp -r temp_repo/"$FOLDER" .

# =====================
# Clean up: Remove temporary repository
echo "Cleaning up temporary files..."
rm -rf temp_repo

# =====================
# Print a message and guide user to change directory manually
echo "Done! The folder '$FOLDER' has been copied to the current directory."
echo "Use the following command to change into the '$FOLDER' directory:"
echo "cd $FOLDER"
