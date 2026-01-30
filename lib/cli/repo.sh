# shellcheck shell=bash

######################################################################
#<
#
# Function: stream  = p6_github_cli_repo_list(owner, ...)
#
#  Args:
#	owner -
#	... - 
#
#  Returns:
#	stream - 
#
#>
######################################################################
p6_github_cli_repo_list() {
    local owner="$1"
    shift 1

    p6_github_cli repo list "$owner" "$@"

    p6_return_stream
}

######################################################################
#<
#
# Function: stream  = p6_github_cli_clone(repo, dir)
#
#  Args:
#	repo -
#	dir -
#
#  Returns:
#	stream - 
#
#>
######################################################################
p6_github_cli_clone() {
    local repo="$1"
    local dir="$2"

    p6_github_cli repo clone "$repo" "$dir"

    p6_return_stream
}

######################################################################
#<
#
# Function: stream  = p6_github_cli_repo_archive(name)
#
#  Args:
#	name -
#
#  Returns:
#	stream - 
#
#>
######################################################################
p6_github_cli_repo_archive() {
    local name="$1"

    p6_github_cli repo archive "$name" --yes

    p6_return_stream
}

######################################################################
#<
#
# Function: stream  = p6_github_cli_repo_unarchive(name)
#
#  Args:
#	name -
#
#  Returns:
#	stream - 
#
#>
######################################################################
p6_github_cli_repo_unarchive() {
    local name="$1"

    p6_github_cli repo unarchive "$name" --yes

    p6_return_stream
}

######################################################################
#<
#
# Function: stream  = p6_github_cli_repo_rename(orig_org_repo, new_org_repo)
#
#  Args:
#	orig_org_repo -
#	new_org_repo -
#
#  Returns:
#	stream - 
#
#>
######################################################################
p6_github_cli_repo_rename() {
    local orig_org_repo="$1"
    local new_org_repo="$2"

    p6_github_cli repo rename -R $orig_org_reop $new_org_repo --yes

    p6_return_stream
}

