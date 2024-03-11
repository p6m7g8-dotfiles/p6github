# shellcheck shell=bash

######################################################################
#<
#
# Function: p6_github_gh_pr_list()
#
#>
######################################################################
p6_github_gh_pr_list() {

    gh pr list

    p6_return_void
}

######################################################################
#<
#
# Function: p6_github_gh_tidy()
#
#>
######################################################################
p6_github_gh_tidy() {

    p6_run_code "gh tidy"

    p6_return_void
}

######################################################################
#<
#
# Function: int pr_id = p6_github_gh_pr_last()
#
#  Returns:
#	int - pr_id
#	int - pr_id
#
#  Environment:	 OPEN
#>
######################################################################
p6_github_gh_pr_last() {

    # Prior PR
    local pr_id
    pr_id=$(gh pr list | awk '/OPEN/ {print $1}' | head -1)

    p6_return_int "$pr_id"
}
