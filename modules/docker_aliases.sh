# This file should be located in modules/docker_aliases.sh as per the recommended structure.
# docker_aliases.sh - Docker and Virtualization aliases

# ---- Docker / Virtualization ----
alias dps='docker ps' # List Docker containers
alias dclean='docker system prune -f' # Remove unused Docker data (DANGEROUS)
alias dstopall='docker stop $(docker ps -q)' # Stop all Docker containers (DANGEROUS)
alias dlogs='docker logs -f' # Follow logs for a Docker container (add container name)
alias vboxlist='VBoxManage list vms' # List VirtualBox VMs (brew install --cask virtualbox)

# Docker Compose shortcuts
alias dcup='docker-compose up -d'
alias dcdown='docker-compose down'
alias dclogs='docker-compose logs -f' 