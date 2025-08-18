### Build Software from Source

Example, build seqtk from GitHub repo

# Remember to read documentation. Seqtk requires the following software to run.
sudo apt install build-essential zlib1g-dev git -y

# Clone repo
git clone https://github.com/lh3/seqtk.git
cd seqtk

# Compile
make

# Move binary to PATH (The /usr/local/bin/ folder is shared across the system, therefore when the given tool is copied to that folder it will be available from cmd line in any folder)
sudo cp seqtk /usr/local/bin/

# Verify it is working
seqtk -version 