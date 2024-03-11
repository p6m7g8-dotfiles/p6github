# shellcheck shell=bash
######################################################################
#<
#
# Function: p6_github_org_clone(login, dir)
#
#  Args:
#	login -
#	dir -
#
#>
######################################################################
p6_github_org_clone() {
    local login="$1"
    local dir="$2"

    gh parallel clone "$login" "$dir"
}
