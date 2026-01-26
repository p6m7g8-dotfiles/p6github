# shellcheck shell=bash
# Repository management API functions
# Wraps gh-repo-mgmt extension and direct API calls

######################################################################
#<
#
# Function: p6_github_api_repo_show([name=])
#
#  Args:
#	OPTIONAL name - owner/repo []
#
#>
######################################################################
p6_github_api_repo_show() {
    local name="${1:-}"

    gh repo-mgmt show "$name"

    p6_return_void
}

######################################################################
#<
#
# Function: p6_github_api_repo_list(owner, ...)
#
#  Args:
#	owner -
#	... -
#
#>
######################################################################
p6_github_api_repo_list() {
    local owner="$1"
    shift 1

    gh repo-mgmt list "$owner" "$@"

    p6_return_void
}

######################################################################
#<
#
# Function: p6_github_api_repo_update(name, ...)
#
#  Args:
#	name -
#	... - key=value pairs
#
#>
######################################################################
p6_github_api_repo_update() {
    local name="$1"
    shift 1

    gh repo-mgmt update "$name" "$@"

    p6_return_void
}

######################################################################
#<
#
# Function: p6_github_api_repo_topics_update(name, ...)
#
#  Args:
#	name -
#	... - topics
#
#>
######################################################################
p6_github_api_repo_topics_update() {
    local name="$1"
    shift 1

    gh repo-mgmt update-topics "$name" "$@"

    p6_return_void
}

######################################################################
#<
#
# Function: p6_github_api_repo_topic_add(name, ...)
#
#  Args:
#	name -
#	... - topics
#
#>
######################################################################
p6_github_api_repo_topic_add() {
    local name="$1"
    shift 1

    gh repo-mgmt add-topic "$name" "$@"

    p6_return_void
}

######################################################################
#<
#
# Function: p6_github_api_repo_topic_delete(name, ...)
#
#  Args:
#	name -
#	... - topics
#
#>
######################################################################
p6_github_api_repo_topic_delete() {
    local name="$1"
    shift 1

    gh repo-mgmt delete-topic "$name" "$@"

    p6_return_void
}

######################################################################
#<
#
# Function: p6_github_api_repo_visibility(name, visibility)
#
#  Args:
#	name -
#	visibility - public|private
#
#>
######################################################################
p6_github_api_repo_visibility() {
    local name="$1"
    local visibility="$2"

    gh repo-mgmt visibility "$name" "$visibility"

    p6_return_void
}

######################################################################
#<
#
# Function: p6_github_api_repo_archive(name)
#
#  Args:
#	name -
#
#>
######################################################################
p6_github_api_repo_archive() {
    local name="$1"

    gh repo-mgmt archive "$name"

    p6_return_void
}

######################################################################
#<
#
# Function: p6_github_api_repo_unarchive(name)
#
#  Args:
#	name -
#
#>
######################################################################
p6_github_api_repo_unarchive() {
    local name="$1"

    gh repo-mgmt unarchive "$name"

    p6_return_void
}

######################################################################
#<
#
# Function: p6_github_api_repo_settings_clone(source, target)
#
#  Args:
#	source -
#	target -
#
#>
######################################################################
p6_github_api_repo_settings_clone() {
    local source="$1"
    local target="$2"

    gh repo-mgmt clone-settings "$source" "$target"

    p6_return_void
}

######################################################################
#<
#
# Function: p6_github_api_repo_rename(orig_org_repo, new_org_repo)
#
#  Args:
#	orig_org_repo -
#	new_org_repo -
#
#>
######################################################################
p6_github_api_repo_rename() {
    local orig_org_repo="$1"
    local new_org_repo="$2"

    p6_github_cli_api --method PATCH -H "Accept: application/vnd.github+json" /repos/"$orig_org_repo" -f name="${new_org_repo#*/}"

    p6_return_void
}

######################################################################
#<
#
# Function: p6_github_api_repo_rename_strip_leading_underscores(orig_org_repo)
#
#  Args:
#	orig_org_repo -
#
#>
######################################################################
p6_github_api_repo_rename_strip_leading_underscores() {
    local orig_org_repo="$1"

    local org="${orig_org_repo%%/*}"
    local repo="${orig_org_repo#*/}"
    local new_repo

    new_repo="$(echo "$repo" | p6_filter_leading_underscores_strip)"

    if p6_string_ne "$repo" "$new_repo"; then
        local new_org_repo="${org}/${new_repo}"
        p6_github_api_repo_rename "$orig_org_repo" "$new_org_repo"
    fi

    p6_return_void
}

######################################################################
#<
#
# Function: p6_github_api_repo_workflow_upgrade_main_run()
#
#>
######################################################################
p6_github_api_repo_workflow_upgrade_main_run() {

    p6_github_cli_workflow_run upgrade-main

    p6_return_void
}
