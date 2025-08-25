alias cpwd='pwd | xclip -selection clipboard'
fzmux() {
    # Check if an argument (session name) is provided
    if [ -z "$1" ]; then
        echo "Usage: fzfcd <session_name>"
        return 1
    fi

    # Select a file with fzf
    file=$(fzf) || return 1  

    # Ensure it's a valid file
    [ -f "$file" ] || return 1  

    # Start a new tmux session in the file's directory
    tmux new -s "$1" -c "$(dirname "$file")"
}

git-add-espocia-remote() {
  if [ -z "$1" ]; then
    echo "Usage: git-add-espocia-remote <repo-name>"
    return 1
  fi
  git remote add origin "git@github.com-espocia:espocia/$1.git"
}

alias gitout="$HOME/.config/zsh/git-checkout.sh"

