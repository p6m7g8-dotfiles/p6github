# shellcheck shell=bash
# REST API: /repos/{owner}/{repo}/rulesets/{ruleset_id}/history

######################################################################
#<
#
# Function: p6_github_api_ruleset_history_list(owner, repo, ruleset_id, ...)
#
#  Args:
#	owner -
#	repo -
#	ruleset_id -
#	... -
#
# GET /repos/{owner}/{repo}/rulesets/{ruleset_id}/history
#>
######################################################################
p6_github_api_ruleset_history_list() {
    local owner="$1"
    local repo="$2"
    local ruleset_id="$3"
    shift 3

    p6_github_cli_api "/repos/$owner/$repo/rulesets/$ruleset_id/history" "$@"

    p6_return_void
}

######################################################################
#<
#
# Function: p6_github_api_ruleset_history_get(owner, repo, ruleset_id, version_id, ...)
#
#  Args:
#	owner -
#	repo -
#	ruleset_id -
#	version_id -
#	... -
#
# GET /repos/{owner}/{repo}/rulesets/{ruleset_id}/history/{version_id}
#>
######################################################################
p6_github_api_ruleset_history_get() {
    local owner="$1"
    local repo="$2"
    local ruleset_id="$3"
    local version_id="$4"
    shift 4

    p6_github_cli_api "/repos/$owner/$repo/rulesets/$ruleset_id/history/$version_id" "$@"

    p6_return_void
}
