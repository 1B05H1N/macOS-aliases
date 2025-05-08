# This file should be located in modules/git_aliases.sh as per the recommended structure.
# git_aliases.sh - Git aliases

# ---- Git Shortcuts ----
alias gs='git status' # Git status
alias ga='git add .' # Git add all
alias gc='git commit -m' # Git commit with message
alias gp='git push' # Git push
alias gl='git log --oneline --graph --decorate' # Pretty git log
alias gco='git checkout' # Git checkout
alias gb='git branch' # Git branch
alias grh='git reset --hard HEAD' # Hard reset (DANGEROUS)

# Git enhancements
alias gd='git diff'
alias gds='git diff --staged'
alias gbd='git branch --merged | grep -v "\*" | xargs -n 1 git branch -d' 