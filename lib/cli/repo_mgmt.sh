# shellcheck shell=bash

######################################################################
#<
#
# Function: stream  = p6_github_cli_repo_mgmt_transfer(name, new_owner)
#
#  Args:
#	name -
#	new_owner -
#
#  Returns:
#	stream - 
#
#>
######################################################################
p6_github_cli_repo_mgmt_transfer() {
    local name="$1"
    local new_owner="$2"

    gh repo-mgmt transfer "$name" "$new_owner"

    p6_return_stream
}

######################################################################
#<
#
# Function: stream  = p6_github_cli_repo_mgmt_ensure(name, ...)
#
#  Args:
#	name -
#	... - 
#
#  Returns:
#	stream - 
#
#>
######################################################################
p6_github_cli_repo_mgmt_ensure() {
    local name="$1"
    shift 1

    p6_github_cli repo-mgmt ensure "$name" "$@"

    p6_return_stream
}

######################################################################
#<
#
# Function: stream  = p6_github_cli_repo_mgmt_topics_update(name, ...)
#
#  Args:
#	name -
#	... - 
#
#  Returns:
#	stream - 
#
#>
######################################################################
p6_github_cli_repo_mgmt_topics_update() {
    local name="$1"
    shift 1

    p6_github_cli repo-mgmt topics-update "$name" "$@"

    p6_return_stream
}

######################################################################
#<
#
# Function: stream  = p6_github_cli_repo_mgmt_topic_add(name, ...)
#
#  Args:
#	name -
#	... - 
#
#  Returns:
#	stream - 
#
#>
######################################################################
p6_github_cli_repo_mgmt_topic_add() {
    local name="$1"
    shift 1

    p6_github_cli repo-mgmt topic-add "$name" "$@"

    p6_return_stream
}

######################################################################
#<
#
# Function: stream  = p6_github_cli_repo_mgmt_topic_delete(name, ...)
#
#  Args:
#	name -
#	... - 
#
#  Returns:
#	stream - 
#
#>
######################################################################
p6_github_cli_repo_mgmt_topic_delete() {
    local name="$1"
    shift 1

    p6_github_cli repo-mgmt topic-delete "$name" "$@"

    p6_return_stream
}

######################################################################
#<
#
# Function: stream  = p6_github_cli_repo_mgmt_visibility(name, visibility)
#
#  Args:
#	name -
#	visibility -
#
#  Returns:
#	stream - 
#
#>
######################################################################
p6_github_cli_repo_mgmt_visibility() {
    local name="$1"
    local visibility="$2"

    p6_github_cli repo-mgmt visibility "$name" "$visibility"

    p6_return_stream
}
