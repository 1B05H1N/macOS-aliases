# DISCLAIMER: Use at your own risk. No guarantees. Review before use, especially if you don't know what you're doing.
# See README.md for directory structure and file reference.

# Robust shell-agnostic sourcing for sub-files in modules/
ALIAS_DIR="$(cd "$(dirname "${BASH_SOURCE[0]:-${(%):-%N}}")" && pwd)"
source "$ALIAS_DIR/modules/core_aliases.sh"
source "$ALIAS_DIR/modules/git_aliases.sh"
source "$ALIAS_DIR/modules/docker_aliases.sh"
source "$ALIAS_DIR/modules/pentest_aliases.sh"

# ---- Template/Custom Aliases ----
# alias myalias='your command here' # Description 