### Git Basics

## Configure User
git config --global user.name "Name"
git config --global user.email "name@example.com"

## Initialize repo
git init
git add .
git commit -m "Initial commit"

## Connect to github
git remote add origin git@github.com:username/linux_scripts.git
git push -u origin main


### Setup SSH key for github (Remember to go create SSH-key on Github)

ssh-keygen -t ed25519 -C "email@example.com"

## Add key to SSH
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519

## Add key to github, copy the output and go to github
cat ~/.ssh/id_ed25519.pub

## Test connection
ssh -T git@github.com