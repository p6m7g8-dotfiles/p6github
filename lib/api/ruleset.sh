# shellcheck shell=bash
# REST API: /repos/{owner}/{repo}/rulesets

######################################################################
#<
#
# Function: p6_github_api_ruleset_list(owner, repo, ...)
#
#  Args:
#	owner -
#	repo -
#	... -
#
# GET /repos/{owner}/{repo}/rulesets
#>
######################################################################
p6_github_api_ruleset_list() {
    local owner="$1"
    local repo="$2"
    shift 2

    p6_github_cli_api "/repos/$owner/$repo/rulesets" "$@"

    p6_return_void
}

######################################################################
#<
#
# Function: p6_github_api_ruleset_create(owner, repo, data)
#
#  Args:
#	owner -
#	repo -
#	data -
#
# POST /repos/{owner}/{repo}/rulesets
#>
######################################################################
p6_github_api_ruleset_create() {
    local owner="$1"
    local repo="$2"
    local data="$3"

    p6_github_cli_api --method POST "/repos/$owner/$repo/rulesets" --input - <<< "$data"

    p6_return_void
}

######################################################################
#<
#
# Function: p6_github_api_ruleset_get(owner, repo, ruleset_id, ...)
#
#  Args:
#	owner -
#	repo -
#	ruleset_id -
#	... -
#
# GET /repos/{owner}/{repo}/rulesets/{ruleset_id}
#>
######################################################################
p6_github_api_ruleset_get() {
    local owner="$1"
    local repo="$2"
    local ruleset_id="$3"
    shift 3

    p6_github_cli_api "/repos/$owner/$repo/rulesets/$ruleset_id" "$@"

    p6_return_void
}

######################################################################
#<
#
# Function: p6_github_api_ruleset_update(owner, repo, ruleset_id, data)
#
#  Args:
#	owner -
#	repo -
#	ruleset_id -
#	data -
#
# PUT /repos/{owner}/{repo}/rulesets/{ruleset_id}
#>
######################################################################
p6_github_api_ruleset_update() {
    local owner="$1"
    local repo="$2"
    local ruleset_id="$3"
    local data="$4"

    p6_github_cli_api --method PUT "/repos/$owner/$repo/rulesets/$ruleset_id" --input - <<< "$data"

    p6_return_void
}

######################################################################
#<
#
# Function: p6_github_api_ruleset_delete(owner, repo, ruleset_id)
#
#  Args:
#	owner -
#	repo -
#	ruleset_id -
#
# DELETE /repos/{owner}/{repo}/rulesets/{ruleset_id}
#>
######################################################################
p6_github_api_ruleset_delete() {
    local owner="$1"
    local repo="$2"
    local ruleset_id="$3"

    p6_github_cli_api --method DELETE "/repos/$owner/$repo/rulesets/$ruleset_id"

    p6_return_void
}
