
######################################################################
#<
#
# Function: stream  = p6_github_api_repo_transfer(org_repo, new_owner)
#
#  Args:
#	org_repo -
#	new_owner -
#
#  Returns:
#	stream - 
#
#>
######################################################################
p6_github_api_repo_transfer() {
    local org_repo="$1"
    local new_owner="$2"

    local owner="${name%%/*}"
    local repo="${name##*/}"

    local payload="{\"new_owner\":\"$new_owner\"}"

    gh api \
        -H "Accept: application/vnd.github+json" \
        -H "X-GitHub-Api-Version: 2022-11-28" \
        --method POST \
        "repos/${owner}/${repo}/transfer" \
        --input <(p6_echo "$payload")

    p6_return_stream
}
