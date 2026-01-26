# shellcheck shell=bash
# Branch ruleset management API functions
# Wraps gh-ruleset-branch extension
# REST API: /repos/{owner}/{repo}/rules/branches/{branch}

######################################################################
#<
#
# Function: p6_github_api_ruleset_branch_list(...)
#
#  Args:
#	... -
#
#>
######################################################################
p6_github_api_ruleset_branch_list() {
    shift 0

    gh ruleset-branch list "$@"

    p6_return_void
}

######################################################################
#<
#
# Function: p6_github_api_ruleset_branch_show(name)
#
#  Args:
#	name -
#
#>
######################################################################
p6_github_api_ruleset_branch_show() {
    local name="$1"

    gh ruleset-branch show "$name"

    p6_return_void
}

######################################################################
#<
#
# Function: p6_github_api_ruleset_branch_create(name)
#
#  Args:
#	name -
#
#>
######################################################################
p6_github_api_ruleset_branch_create() {
    local name="$1"

    gh ruleset-branch create "$name"

    p6_return_void
}

######################################################################
#<
#
# Function: p6_github_api_ruleset_branch_delete(name)
#
#  Args:
#	name -
#
#>
######################################################################
p6_github_api_ruleset_branch_delete() {
    local name="$1"

    gh ruleset-branch delete "$name"

    p6_return_void
}

######################################################################
#<
#
# Function: p6_github_api_ruleset_branch_activate(name)
#
#  Args:
#	name -
#
#>
######################################################################
p6_github_api_ruleset_branch_activate() {
    local name="$1"

    gh ruleset-branch activate "$name"

    p6_return_void
}

######################################################################
#<
#
# Function: p6_github_api_ruleset_branch_deactivate(name)
#
#  Args:
#	name -
#
#>
######################################################################
p6_github_api_ruleset_branch_deactivate() {
    local name="$1"

    gh ruleset-branch deactivate "$name"

    p6_return_void
}

######################################################################
#<
#
# Function: p6_github_api_ruleset_branch_update(name, ...)
#
#  Args:
#	name -
#	... - key=value pairs
#
#>
######################################################################
p6_github_api_ruleset_branch_update() {
    local name="$1"
    shift 1

    gh ruleset-branch update "$name" "$@"

    p6_return_void
}

######################################################################
#<
#
# Function: p6_github_api_ruleset_branch_export(name)
#
#  Args:
#	name -
#
#>
######################################################################
p6_github_api_ruleset_branch_export() {
    local name="$1"

    gh ruleset-branch export "$name"

    p6_return_void
}

######################################################################
#<
#
# Function: p6_github_api_ruleset_branch_import()
#
# Reads JSON from stdin
#
#>
######################################################################
p6_github_api_ruleset_branch_import() {

    gh ruleset-branch import

    p6_return_void
}
