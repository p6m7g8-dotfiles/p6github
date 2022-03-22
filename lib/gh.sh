# shellcheck shell=bash

######################################################################
#<
#
# Function: p6_gh()
#
#  Depends:	 p6_run
#>
######################################################################
p6_gh() {

    p6_run_code "gh $@"
}

######################################################################
#<
#
# Function: p6_github_gh_pr_list()
#
#  Depends:	 p6_gh
#>
######################################################################
p6_github_gh_pr_list() {

    p6_gh pr list

    p6_return_void
}

######################################################################
#<
#
# Function: p6_github_gh_tidy()
#
#  Depends:	 p6_run
#>
######################################################################
p6_github_gh_tidy() {

    p6_run_code "p6_gh tidy"

    p6_return_void
}

######################################################################
#<
#
# Function: int pr_id = p6_github_gh_pr_last()
#
#  Returns:
#	int - pr_id
#
#  Environment:	 OPEN
#>
######################################################################
p6_github_gh_pr_last() {

    # Prior PR
    local pr_id
    pr_id=$(p6_gh pr list | awk '/OPEN/ {print $1}' | head -1)

    p6_return_int "$pr_id"
}

######################################################################
#<
#
# Function: p6_github_gh_pr_merge_last()
#
#  Depends:	 p6_gh
#>
######################################################################
p6_github_gh_pr_merge_last() {

    # Prior PR
    local pr_id
    pr_id=$(p6_github_gh_pr_last)

    # Merge, Squash, Delete Branch
    p6_gh pr merge -d -s "$pr_id"

    # Pull (already on main)
    p6_git_p6_pull

    p6_return_void
}

######################################################################
#<
#
# Function: p6_github_gh_submit(msg)
#
#  Args:
#	msg -
#
#  Depends:	 p6_gh
#  Environment:	 USER
#>
######################################################################
p6_github_gh_submit() {
    local msg="$*"

    # Step 1: Show current state
    p6_git_p6_status

    # Step 2: Show diff
    p6_git_p6_diff

    # Step 3: Checkout a branch
    local branch
    branch=$(p6_github_branch_transliterate "$msg")
    p6_git_p6_branch_create "$branch"

    # Step 4: Add
    p6_git_p6_add_all

    # Step 5: Commit
    p6_git_p6_commit "$msg"

    # Step 6: Push
    p6_git_p6_push

    # Step 7a: Create PR
    p6_gh pr create -a "$USER" -f -r p6m7g8-automation

    # Step 7b: Make sure we are checked out to the PR
    p6_gh pr checkout "$(p6_github_gh_pr_last)" # XXX race

    # Step 7b: Make sure we are checked out to the PR
    (sudo su - p6m7g8-archive gh pr review --approve)

    # Step 8: Back to default
    p6_git_p6_checkout_default

    p6_return_void
}
