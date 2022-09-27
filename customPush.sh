yes | cp ~/.bashrc .
yes | cp ~/.xinitrc .
yes | cp ~/.vimrc .
git add .
read -e -p "Enter Commit Message: " commit_message
git commit -m "$commit_message"
git push
