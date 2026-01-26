# shellcheck shell=bash

######################################################################
#<
#
# Function: str version = p6_github_api_action_version_latest(action)
#
#  Args:
#	action -
#
#  Returns:
#	str - version
#
#>
######################################################################
p6_github_api_action_version_latest() {
    local action="$1"

    local version
    version=$(curl -s "https://api.github.com/repos/$action/releases/latest" | jq -r '.tag_name')

    p6_return_str "$version"
}
