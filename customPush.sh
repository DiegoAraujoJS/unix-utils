yes | cp ~/.bashrc .
yes | cp ~/.vimrc .
yes | cp ~/.xmodmap .
git add .
read -e -p "Enter Commit Message: " commit_message
git commit -m "$commit_message"
git push
