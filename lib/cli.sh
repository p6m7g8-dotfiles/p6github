# shellcheck shell=bash

######################################################################
#<
#
# Function: p6_github_cli_pr_checkout(...)
#
#  Args:
#	... - 
#
#>
######################################################################
p6_github_cli_pr_checkout() {
    shift 0

    gh pr checkout "$@"

    p6_return_void
}

######################################################################
#<
#
# Function: p6_github_cli_pr_list(...)
#
#  Args:
#	... - 
#
#>
######################################################################
p6_github_cli_pr_list() {
    shift 0

    gh pr list "$@"

    p6_return_void
}

######################################################################
#<
#
# Function: p6_github_cli_pr_view(pr, ...)
#
#  Args:
#	pr -
#	... - 
#
#>
######################################################################
p6_github_cli_pr_view() {
    local pr="$1"
    shift 1

    gh pr view "$pr" "$@"

    p6_return_void
}

######################################################################
#<
#
# Function: p6_github_cli_pr_view_web(pr)
#
#  Args:
#	pr -
#
#>
######################################################################
p6_github_cli_pr_view_web() {
    local pr="$1"

    p6_github_cli_pr_view "$pr" -w

    p6_return_void
}

######################################################################
#<
#
# Function: p6_github_cli_pr_create(...)
#
#  Args:
#	... - 
#
#>
######################################################################
p6_github_cli_pr_create() {
    shift 0

    gh pr create "$@"

    p6_return_void
}

######################################################################
#<
#
# Function: p6_github_cli_pr_merge_squash_delete(pr)
#
#  Args:
#	pr -
#
#>
######################################################################
p6_github_cli_pr_merge_squash_delete() {
    local pr="$1"

    gh pr merge -d -s "$pr"

    p6_return_void
}

######################################################################
#<
#
# Function: p6_github_cli_repo_list(owner, ...)
#
#  Args:
#	owner -
#	... -
#
#>
######################################################################
p6_github_cli_repo_list() {
    local owner="$1"
    shift 1

    gh repo list "$owner" "$@" 2>/dev/null

    p6_return_void
}

######################################################################
#<
#
# Function: p6_github_cli_clone(repo, dir)
#
#  Args:
#	repo -
#	dir -
#
#>
######################################################################
p6_github_cli_clone() {
    local repo="$1"
    local dir="$2"

    gh repo clone "$repo" "$dir"

    p6_return_void
}

######################################################################
#<
#
# Function: p6_github_cli_api(...)
#
#  Args:
#	... - 
#
#>
######################################################################
p6_github_cli_api() {
    shift 0

    gh api "$@"

    p6_return_void
}

######################################################################
#<
#
# Function: p6_github_cli_workflow_run(workflow, ...)
#
#  Args:
#	workflow -
#	... - 
#
#>
######################################################################
p6_github_cli_workflow_run() {
    local workflow="$1"
    shift 1

    gh workflow run "$workflow" "$@"

    p6_return_void
}

######################################################################
#<
#
# Function: p6_github_cli_ruleset_branch_activate([ruleset_name=default])
#
#  Args:
#	OPTIONAL ruleset_name - [default]
#
#>
######################################################################
p6_github_cli_ruleset_branch_activate() {
    local ruleset_name="${1:-default}"

    gh ruleset-branch activate "$ruleset_name"

    p6_return_void
}

######################################################################
#<
#
# Function: p6_github_cli_ruleset_branch_deactivate([ruleset_name=default])
#
#  Args:
#	OPTIONAL ruleset_name - [default]
#
#>
######################################################################
p6_github_cli_ruleset_branch_deactivate() {
    local ruleset_name="${1:-default}"

    gh ruleset-branch deactivate "$ruleset_name"

    p6_return_void
}

######################################################################
#<
#
# Function: p6_github_cli_ruleset_branch_create([ruleset_name=default])
#
#  Args:
#	OPTIONAL ruleset_name - [default]
#
#>
######################################################################
p6_github_cli_ruleset_branch_create() {
    local ruleset_name="${1:-default}"

    gh ruleset-branch create "$ruleset_name"

    p6_return_void
}

######################################################################
#<
#
# Function: p6_github_cli_ruleset_branch_delete([ruleset_name=default])
#
#  Args:
#	OPTIONAL ruleset_name - [default]
#
#>
######################################################################
p6_github_cli_ruleset_branch_delete() {
    local ruleset_name="${1:-default}"

    gh ruleset-branch delete "$ruleset_name"

    p6_return_void
}

######################################################################
#<
#
# Function: p6_github_cli_ruleset_branch_update(...)
#
#  Args:
#	... - 
#
#>
######################################################################
p6_github_cli_ruleset_branch_update() {
    shift 0

    gh ruleset-branch update "$@"

    p6_return_void
}
