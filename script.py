import os

# Define the folder structure
folders = [
    ".github/workflows",
    "scripts"
]

# Define the files to be created
files = [
    ".github/workflows/release.yml",
    "scripts/release.sh",
    "scripts/finalize.sh",
    "requirements.txt",
    "VERSION.txt",
    "main.py",
    "README.md"
]

def create_structure():
    # Create the folders
    for folder in folders:
        os.makedirs(folder, exist_ok=True)
        print(f"Created folder: {folder}")

    # Create the files
    for file in files:
        with open(file, 'w') as f:
            pass  # Create an empty file
        print(f"Created file: {file}")

if __name__ == "__main__":
    create_structure()
