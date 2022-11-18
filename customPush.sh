yes | cp ~/.bashrc .
yes | cp ~/.xmodmap .
yes | cp -a ~/.config/nvim/. nvim
git add .
read -e -p "Enter Commit Message: " commit_message
git commit -m "$commit_message"
git push
