yes | cp ~/.bashrc .
yes | cp ~/.Xmodmap .
yes | cp ~/.vimrc .
git add .
read -e -p "Enter Commit Message: " commit_message
git commit -m "$commit_message"
git push
