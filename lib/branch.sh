######################################################################
#<
#
# Function: p6_github_branch_submit(branch, msg)
#
#  Args:
#	branch -
#	msg -
#
#  Depends:	 p6_string
#>
######################################################################
p6_github_branch_submit() {
    local branch="$1"
    local msg="$2"

    p6_git_branch_create "$branch"
    if p6_string_blank "$msg"; then
        git commit -v
    else
        p6_git_p6_commit "$msg"
    fi
    p6_git_p6_push

    p6_return_void
}
