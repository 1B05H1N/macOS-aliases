# This file should be located in modules/core_aliases.sh as per the recommended structure.
# core_aliases.sh - Core/general aliases for macOS
# DISCLAIMER: Use at your own risk. No guarantees. Review before use, especially if you don't know what you're doing.

# Alias listing and search helpers
alias aliaslist='alias | less' # List all active aliases
alias aliasgrep='alias | grep' # Search aliases
if command -v fzf &>/dev/null; then
  alias afind='alias | fzf'    # Fuzzy alias search
fi

# ---- System Monitoring ----
alias psg='ps aux | grep -v grep | grep' # Search for processes by keyword
alias cpuuse='top -o cpu' # Show top processes by CPU usage
alias memuse='top -o rsize' # Show top processes by memory usage
alias diskuse='df -h | grep -v tmpfs' # Show disk usage (excluding tmpfs)
alias inodeuse='df -i' # Show inode usage (rarely needed on APFS)
alias uptime='uptime -p' # Pretty uptime
# journalctl is not available on macOS by default
# alias journal='journalctl -xe'
alias syslog='tail -f /var/log/system.log' # View macOS system log

# ---- Security & Forensics ----
alias checkports='sudo lsof -i -n -P | grep LISTEN' # Show listening ports (requires sudo)
alias whoamiwho='whoami; id; groups' # Show user info
# lastb and /var/log/auth.log are Linux-only
# alias failedlogins='lastb -n 10'
# alias authlog='tail -f /var/log/auth.log'
alias fw='sudo pfctl -sr' # Show pf firewall rules (macOS)
alias hashes='shasum -a 256' # SHA256 hash of a file
alias virustotal='open https://www.virustotal.com/gui/home/upload' # Open VirusTotal in browser

# ---- Networking ----
alias pingg='ping -c 4 8.8.8.8' # Ping Google DNS 4 times
alias tracer='traceroute google.com' # Trace route to Google
alias netconns='netstat -an | grep ESTABLISHED' # Show established network connections
alias ifip='ifconfig | grep "inet " | grep -v 127.0.0.1' # Show local IP addresses
# brew install bind
# alias digg='dig +short' # Short DNS lookup
alias dnsflush='sudo dscacheutil -flushcache; sudo killall -HUP mDNSResponder' # Flush DNS cache (macOS)

# ---- File & Audit ----
alias bigfiles='find . -type f -exec du -h {} + | sort -rh | head -n 20' # Show 20 largest files
alias recent='ls -lt | head -n 10' # Show 10 most recent files
# namei is not available on macOS by default
# alias permcheck='namei -l'
alias whouses='lsof | grep' # Find which process is using a file
# brew install unrar
# brew install p7zip
# brew install ncompress
# brew install bzip2
# The extract function below uses these tools if available

# ---- Cleanup ----
alias cleanpyc='find . -name "*.pyc" -delete' # Delete Python bytecode files
alias cleanlogs='find . -name "*.log" -size +5M -delete' # Delete large log files
alias clearcache='rm -rf ~/Library/Caches/*' # Clear user cache (DANGEROUS)

# ---- Convenience ----
alias ..='cd ..' # Up one directory
alias ...='cd ../..' # Up two directories
alias c='clear' # Clear terminal
alias home='cd ~' # Go to home directory
alias desk='cd ~/Desktop' # Go to Desktop
alias myip='curl ifconfig.me' # Show public IP
# mkdircd as a function (macOS compatible)
mkdircd() { mkdir -p "$1" && cd "$1"; } # Make and cd into directory

# ---- Remote Shortcuts ----
alias prod='echo "🟥 PROD ENV — THINK TWICE"; ssh user@prod-server.com' # Warn and SSH to prod
alias staging='ssh user@staging-server.com' # SSH to staging

# ---- Custom Commands ----
alias reset_launchpad='sudo find /private/var/folders/ -type d -name com.apple.dock.launchpad -exec rm -rf {} + 2>/dev/null; killall Dock' # Reset Launchpad (macOS)

# ---- Optional Fun & Info ----
# brew install figlet
# alias figlet='figlet -f slant "Hello!"' # Print ASCII art

# ---- Alias Reference ----
alias aliases='cat ~/aliases_reference.txt' # Show alias reference

# ---- Extra Safety & Convenience (macOS tailored) ----
alias safegrh='echo "This will hard reset your git repo! Use with caution." && git status && read -p "Proceed? (y/N): " yn && [ "$yn" = "y" ] && git reset --hard HEAD' # Safer git reset
alias reloadaliases='source ~/aliases.sh' # Reload this aliases file
alias findport='lsof -iTCP -sTCP:LISTEN -n -P | grep' # Find process using a port
alias myuser='echo $USER; echo $SHELL' # Show current user and shell
alias lsd='ls -lhFG' # Detailed list (macOS: -G for color)
alias histg='history | grep' # Search shell history
alias path='echo $PATH | tr ":" "\n"' # Print $PATH line by line

# Extract various archive types (macOS compatible, requires Homebrew for some tools)
extract() {
  if [ -f "$1" ]; then
    case "$1" in
      *.tar.bz2)   tar xjf "$1"   ;;
      *.tar.gz)    tar xzf "$1"   ;;
      *.bz2)       bunzip2 "$1"   ;; # brew install bzip2
      *.rar)       unrar x "$1"   ;; # brew install unrar
      *.gz)        gunzip "$1"    ;;
      *.tar)       tar xf "$1"    ;;
      *.tbz2)      tar xjf "$1"   ;;
      *.tgz)       tar xzf "$1"   ;;
      *.zip)       unzip "$1"     ;; # built-in
      *.Z)         uncompress "$1";; # brew install ncompress
      *.7z)        7z x "$1"      ;; # brew install p7zip
      *)           echo "Cannot extract '$1'" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

# ---- Extra macOS Productivity ----
# System & Hardware
alias spinfo='system_profiler SPHardwareDataType'         # Show Mac hardware info
alias osver='sw_vers'                                     # Show macOS version
alias updates='softwareupdate -l'                         # List available macOS updates
alias brewup='brew update && brew upgrade && brew cleanup' # Update all Homebrew packages

# Finder & GUI
alias finder='open .'                                     # Open current dir in Finder
alias showhidden='defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder'  # Show hidden files in Finder
alias hidehidden='defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder' # Hide hidden files in Finder

# Networking
alias wifiinfo='/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport -I' # Wi-Fi info

# Process & App Management
alias psgrep='ps aux | grep -i'                          # Case-insensitive process search
alias killport='f(){ lsof -ti :$1 | xargs kill -9; }; f'  # Kill process on port: killport 8080
alias topcpu='ps -A -o %cpu,comm | sort -nr | head -n 10' # Top CPU processes

# Clipboard
alias pbcopyf='pbcopy <'                                  # Copy file contents to clipboard: pbcopyf file.txt
alias pbpastef='pbpaste >'                                # Paste clipboard to file: pbpastef file.txt

# Quick Web/Docs
alias manp='man -t'                                       # Print man page as PDF (use with Preview)
alias openman='man -t $1 | open -f -a Preview'            # Open man page in Preview as PDF

# Terminal Navigation
alias ..2='cd ../..'
alias ..3='cd ../../..'
alias ..4='cd ../../../..'

# Miscellaneous
alias uuid='uuidgen'                                      # Generate a UUID
alias iplocal='ipconfig getifaddr en0'                    # Get local IP (Wi-Fi)
alias ipall='ifconfig | grep inet'                        # List all IPs

# Security/Forensics/IT
alias gatekeeper='spctl --status'                         # Check Gatekeeper status
alias xprotect='defaults read /System/Library/CoreServices/XProtect.bundle/Contents/Resources/XProtect.meta.plist' # View XProtect info

# General Productivity
alias please='sudo $(fc -ln -1)'                          # Repeat last command with sudo
alias hist10='history | tail -10'                         # Show last 10 commands

# Homebrew Shortcuts
alias brews='brew list'                                   # List installed Homebrew packages
alias brewscask='brew list --cask'                        # List installed casks

# ---- Classic Bash Productivity Aliases (macOS tailored) ----

# ls enhancements (macOS: use -G for color)
alias ll='ls -laG'                       # Long listing with color
alias l.='ls -d .??*'                    # Show hidden files (macOS: no --color)
# alias ls='ls --color=auto'             # Not supported on macOS, use 'ls -G'

# cd enhancements
alias cd..='cd ..'                       # Fix common typo
alias ....='cd ../../../../'
alias .....='cd ../../../../../'
alias .4='cd ../../../../'
alias .5='cd ../../../../../'

# grep enhancements (macOS: use -G for color)
alias grep='grep --color=auto'           # Colorize grep output (may need GNU grep: brew install grep)
alias egrep='egrep --color=auto'         # Colorize egrep output (may need GNU grep)
alias fgrep='fgrep --color=auto'         # Colorize fgrep output (may need GNU grep)

# Calculator
alias bc='bc -l'                         # Start calculator with math support

# Generate sha1 digest
alias sha1='openssl sha1'                # Generate SHA1 hash (requires openssl, built-in)

# mkdir with parents and verbose
alias mkdir='mkdir -pv'                  # Create parent directories as needed

# diff with color (requires colordiff)
# brew install colordiff
# alias diff='colordiff'

# Handy shortcuts
alias h='history'                        # Show command history
alias j='jobs -l'                        # List jobs

# Show PATH line by line
alias path='echo $PATH | tr ":" "\n"'

# Date/time
alias now='date +"%T"'                   # Show current time
alias nowdate='date +"%d-%m-%Y"'          # Show current date

# Set vim as default editor (if installed)
# brew install vim
# alias vi=vim
# alias svi='sudo vi'
# alias vis='vim "+set si"'
# alias edit='vim'

# Ping enhancements
alias ping='ping -c 5'                   # Ping 5 times by default

# Show open ports (macOS: use lsof)
alias ports='lsof -i -P -n | grep LISTEN' # Show open ports

# Show web server headers
alias header='curl -I'                   # Get web server headers
alias headerc='curl -I --compress'       # Check for gzip support

# Safety nets
alias rm='rm -I'                         # Prompt before every removal
alias mv='mv -i'                         # Prompt before overwrite
alias cp='cp -i'                         # Prompt before overwrite
alias ln='ln -i'                         # Prompt before overwrite

# Show disk usage and free space
alias df='df -H'                         # Human-readable disk free
alias du='du -ch'                        # Human-readable disk usage 