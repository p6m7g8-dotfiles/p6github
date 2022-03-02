######################################################################
#<
#
# Function: p6_github_gh_pr_submit(msg)
#
#  Args:
#	msg -
#
#  Depends:	 p6_string
#  Environment:	 USER
#>
######################################################################
p6_github_gh_pr_submit() {
    local msg="$1"

    local base
    base=$(p6_git_branch_base_get)

    local myb
    myb=$(p6_git_branch_name_gen "branch-")

    p6_git_p6_branch_create "$myb"
    if p6_string_blank "$msg"; then
        git commit -v
    else
        p6_git_p6_commit "$msg"
    fi
    p6_github_gh_pr_create "$USER"
    p6_git_p6_checkout "$base"
    p6_git_p6_branch "-D" "$myb"

    p6_return_void
}

######################################################################
#<
#
# Function: str name = p6_git_branch_name_gen([prefix=branch])
#
#  Args:
#	OPTIONAL prefix - [branch]
#
#  Returns:
#	str - name
#
#>
######################################################################
p6_git_branch_name_gen() {
    local prefix="${1:-branch}"

    local token
    token=$(p6_token_random "4")

    local name
    name="$prefix$token"

    p6_return_str "$name"
}
