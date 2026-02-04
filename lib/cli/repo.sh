# shellcheck shell=bash

#
# name - org/repo
# org_repo - org/repo
# org - org
# repo - repo
#

######################################################################
#<
#
# Function: stream  = p6_github_cli_repo_list(owner, ...)
#
#  Args:
#	owner -
#	... - 
#
#  Returns:
#	stream - 
#
#>
######################################################################
p6_github_cli_repo_list() {
    local owner="$1"
    shift 1

    p6_github_cli repo list -L 2000 "$owner" "$@" | p6_filter_column_pluck 1 | p6_filter_sort

    p6_return_stream
}

######################################################################
#<
#
# Function: stream  = p6_github_cli_clone(repo, dir)
#
#  Args:
#	repo -
#	dir -
#
#  Returns:
#	stream - 
#
#>
######################################################################
p6_github_cli_clone() {
    local repo="$1"
    local dir="$2"

    p6_github_cli repo clone "$repo" "$dir"

    p6_return_stream
}

######################################################################
#<
#
# Function: stream  = p6_github_cli_repo_archive(org, repo)
#
#  Args:
#	org -
#	repo -
#
#  Returns:
#	stream - 
#
#>
######################################################################
p6_github_cli_repo_archive() {
    local org="$1"
    local repo="$2"

    p6_github_cli repo archive "$org/$repo" --yes

    p6_return_stream
}

######################################################################
#<
#
# Function: stream  = p6_github_cli_repo_unarchive(name)
#
#  Args:
#	name -
#
#  Returns:
#	stream - 
#
#>
######################################################################
p6_github_cli_repo_unarchive() {
    local name="$1"

    p6_github_cli repo unarchive "$name" --yes

    p6_return_stream
}

######################################################################
#<
#
# Function: stream  = p6_github_cli_repo_rename(orig_org_repo, new_repo)
#
#  Args:
#	orig_org_repo -
#	new_repo -
#
#  Returns:
#	stream - 
#
#>
######################################################################
p6_github_cli_repo_rename() {
    local orig_org_repo="$1"
    local new_repo="$2"

    p6_github_cli repo rename -R $orig_org_repo $new_repo --yes

    p6_return_stream
}

######################################################################
#<
#
# Function: stream  = p6_github_cli_repo_view_json(org, repo, json, jq)
#
#  Args:
#	org -
#	repo -
#	json -
#	jq -
#
#  Returns:
#	stream - 
#
#>
######################################################################
p6_github_cli_repo_view_json() {
    local org="$1"
    local repo="$2"
    local json="$3"
    local jq="$4"

    p6_github_cli repo view "$org/$repo" --json "$json" -q "$jq"

    p6_return_stream
}

######################################################################
#<
#
# Function: stream  = p6_github_cli_repo_api_view_json(org, repo, jq)
#
#  Args:
#	org -
#	repo -
#	jq -
#
#  Returns:
#	stream - 
#
#>
######################################################################
p6_github_cli_repo_api_view_json() {
    local org="$1"
    local repo="$2"
    local jq="$3"

    p6_github_cli api "repos/$org/$repo" --jq "$jq"

    p6_return_stream
}

######################################################################
#<
#
# Function: stream  = p6_github_cli_repo_topics_list(org, repo)
#
#  Args:
#	org -
#	repo -
#
#  Returns:
#	stream - 
#
#>
######################################################################
p6_github_cli_repo_topics_list() {
    local org="$1"
    local repo="$2"

    p6_github_cli_repo_view_json "$org" "$repo" "repositoryTopics" '.repositoryTopics[].name' | p6_filter_sort

    p6_return_stream
}

######################################################################
#<
#
# Function: p6_github_cli_repo_topic_add(org, repo, topic)
#
#  Args:
#	org -
#	repo -
#	topic -
#
#>
######################################################################
p6_github_cli_repo_topic_add() {
    local org="$1"
    local repo="$2"
    local topic="$3"

    p6_github_cli repo edit "$org/$repo" --add-topic "$topic"

    p6_return_void
}

######################################################################
#<
#
# Function: p6_github_cli_repo_topic_remove(org, repo, topic)
#
#  Args:
#	org -
#	repo -
#	topic -
#
#>
######################################################################
p6_github_cli_repo_topic_remove() {
    local org="$1"
    local repo="$2"
    local topic="$3"

    p6_github_cli repo edit "$org/$repo" --remove-topic "$topic"

    p6_return_void
}

######################################################################
#<
#
# Function: p6_github_cli_repo_allow_forking_set(repo, enable)
#
#  Args:
#	repo -
#	enable -
#
#>
######################################################################
p6_github_cli_repo_allow_forking_set() {
  local repo="$1"
  local enable="$2"

  p6_github_cli repo edit "$repo" --allow-forking="$enable"

  p6_return_void
}

######################################################################
#<
#
# Function: str enabled = p6_github_cli_repo_allow_forking_get(org, repo)
#
#  Args:
#	org -
#	repo -
#
#  Returns:
#	str - enabled
#
#>
######################################################################
p6_github_cli_repo_allow_forking_get() {
  local org="$1"
  local repo="$2"

  local enabled
  enabled=$(p6_github_cli_repo_api_view_json "$org" "$repo" '.allow_forking')

  p6_return_str "$enabled"
}

######################################################################
#<
#
# Function: str enabled = p6_github_cli_repo_is_fork_get(org, repo)
#
#  Args:
#	org -
#	repo -
#
#  Returns:
#	str - enabled
#
#>
######################################################################
p6_github_cli_repo_is_fork_get() {
  local org="$1"
  local repo="$2"

  local enabled
  enabled=$(p6_github_cli_repo_view_json "$org" "$repo" "isFork" '.isFork')

  p6_return_str "$enabled"
}

######################################################################
#<
#
# Function: str enabled = p6_github_cli_repo_is_archived_get(org, repo)
#
#  Args:
#	org -
#	repo -
#
#  Returns:
#	str - enabled
#
#>
######################################################################
p6_github_cli_repo_is_archived_get() {
  local org="$1"
  local repo="$2"

  local enabled
  enabled=$(p6_github_cli_repo_view_json "$org" "$repo" "isArchived" '.isArchived')

  p6_return_str "$enabled"
}

######################################################################
#<
#
# Function: p6_github_cli_repo_allow_update_branch_set(repo, enable)
#
#  Args:
#	repo -
#	enable -
#
#>
######################################################################
p6_github_cli_repo_allow_update_branch_set() {
  local repo="$1"
  local enable="$2"

  p6_github_cli repo edit "$repo" --allow-update-branch="$enable"

  p6_return_void
}

######################################################################
#<
#
# Function: str enabled = p6_github_cli_repo_allow_update_branch_get(org, repo)
#
#  Args:
#	org -
#	repo -
#
#  Returns:
#	str - enabled
#
#>
######################################################################
p6_github_cli_repo_allow_update_branch_get() {
  local org="$1"
  local repo="$2"

  local enabled
  enabled=$(p6_github_cli_repo_api_view_json "$org" "$repo" '.allow_update_branch')

  p6_return_str "$enabled"
}

######################################################################
#<
#
# Function: p6_github_cli_repo_default_branch_set(repo, branch)
#
#  Args:
#	repo -
#	branch -
#
#>
######################################################################
p6_github_cli_repo_default_branch_set() {
  local repo="$1"
  local branch="$2"

  p6_github_cli repo edit "$repo" --default-branch "$branch"

  p6_return_void
}

######################################################################
#<
#
# Function: str branch = p6_github_cli_repo_default_branch_get(org, repo)
#
#  Args:
#	org -
#	repo -
#
#  Returns:
#	str - branch
#
#>
######################################################################
p6_github_cli_repo_default_branch_get() {
  local org="$1"
  local repo="$2"

  local branch
  branch=$(p6_github_cli_repo_view_json "$org" "$repo" "defaultBranchRef" '.defaultBranchRef.name')

  p6_return_str "$branch"
}

######################################################################
#<
#
# Function: p6_github_cli_repo_delete_branch_on_merge_set(repo, enable)
#
#  Args:
#	repo -
#	enable -
#
#>
######################################################################
p6_github_cli_repo_delete_branch_on_merge_set() {
  local repo="$1"
  local enable="$2"

  p6_github_cli repo edit "$repo" --delete-branch-on-merge="$enable"

  p6_return_void
}

######################################################################
#<
#
# Function: str enabled = p6_github_cli_repo_delete_branch_on_merge_get(org, repo)
#
#  Args:
#	org -
#	repo -
#
#  Returns:
#	str - enabled
#
#>
######################################################################
p6_github_cli_repo_delete_branch_on_merge_get() {
  local org="$1"
  local repo="$2"

  local enabled
  enabled=$(p6_github_cli_repo_view_json "$org" "$repo" "deleteBranchOnMerge" '.deleteBranchOnMerge')

  p6_return_str "$enabled"
}

######################################################################
#<
#
# Function: p6_github_cli_repo_advanced_security_set(repo, enable)
#
#  Args:
#	repo -
#	enable -
#
#>
######################################################################
p6_github_cli_repo_advanced_security_set() {
  local repo="$1"
  local enable="$2"
  local org="${repo%%/*}"
  local repo_name="${repo##*/}"
  local visibility
  local should_run=$P6_TRUE

  visibility=$(p6_github_cli_repo_visibility_get "$org" "$repo_name")
  if p6_string_eq "$visibility" "public"; then
    should_run=$P6_FALSE
  fi

  if p6_string_eq_1 "$should_run"; then
    p6_github_cli repo edit "$repo" --enable-advanced-security="$enable"
  fi

  p6_return_void
}

######################################################################
#<
#
# Function: str status_value = p6_github_cli_repo_advanced_security_get(org, repo)
#
#  Args:
#	org -
#	repo -
#
#  Returns:
#	str - status_value
#
#>
######################################################################
p6_github_cli_repo_advanced_security_get() {
  local org="$1"
  local repo="$2"

  local status_value
  status_value=$(p6_github_cli_repo_api_view_json "$org" "$repo" '.security_and_analysis.advanced_security.status')

  case "$status_value" in
    null)     status_value="disabled" ;;
    enabled)  status_value="enabled" ;;
    disabled) status_value="disabled" ;;
  esac

  p6_return_str "$status_value"
}

######################################################################
#<
#
# Function: p6_github_cli_repo_auto_merge_set(repo, enable)
#
#  Args:
#	repo -
#	enable -
#
#>
######################################################################
p6_github_cli_repo_auto_merge_set() {
  local repo="$1"
  local enable="$2"

  p6_github_cli repo edit "$repo" --enable-auto-merge="$enable"

  p6_return_void
}

######################################################################
#<
#
# Function: str enabled = p6_github_cli_repo_auto_merge_get(org, repo)
#
#  Args:
#	org -
#	repo -
#
#  Returns:
#	str - enabled
#
#>
######################################################################
p6_github_cli_repo_auto_merge_get() {
  local org="$1"
  local repo="$2"

  local enabled
  enabled=$(p6_github_cli_repo_api_view_json "$org" "$repo" '.allow_auto_merge')

  p6_return_str "$enabled"
}

######################################################################
#<
#
# Function: p6_github_cli_repo_discussions_set(repo, enable)
#
#  Args:
#	repo -
#	enable -
#
#>
######################################################################
p6_github_cli_repo_discussions_set() {
  local repo="$1"
  local enable="$2"

  p6_github_cli repo edit "$repo" --enable-discussions="$enable"

  p6_return_void
}

######################################################################
#<
#
# Function: str enabled = p6_github_cli_repo_discussions_get(org, repo)
#
#  Args:
#	org -
#	repo -
#
#  Returns:
#	str - enabled
#
#>
######################################################################
p6_github_cli_repo_discussions_get() {
  local org="$1"
  local repo="$2"

  local enabled
  enabled=$(p6_github_cli_repo_view_json "$org" "$repo" "hasDiscussionsEnabled" '.hasDiscussionsEnabled')

  p6_return_str "$enabled"
}

######################################################################
#<
#
# Function: p6_github_cli_repo_merge_commit_set(repo, enable)
#
#  Args:
#	repo -
#	enable -
#
#>
######################################################################
p6_github_cli_repo_merge_commit_set() {
  local repo="$1"
  local enable="$2"

  p6_github_cli repo edit "$repo" --enable-merge-commit="$enable"

  p6_return_void
}

######################################################################
#<
#
# Function: str enabled = p6_github_cli_repo_merge_commit_get(org, repo)
#
#  Args:
#	org -
#	repo -
#
#  Returns:
#	str - enabled
#
#>
######################################################################
p6_github_cli_repo_merge_commit_get() {
  local org="$1"
  local repo="$2"

  local enabled
  enabled=$(p6_github_cli_repo_view_json "$org" "$repo" "mergeCommitAllowed" '.mergeCommitAllowed')

  p6_return_str "$enabled"
}

######################################################################
#<
#
# Function: p6_github_cli_repo_rebase_merge_set(repo, enable)
#
#  Args:
#	repo -
#	enable -
#
#>
######################################################################
p6_github_cli_repo_rebase_merge_set() {
  local repo="$1"
  local enable="$2"

  p6_github_cli repo edit "$repo" --enable-rebase-merge="$enable"

  p6_return_void
}

######################################################################
#<
#
# Function: str enabled = p6_github_cli_repo_rebase_merge_get(org, repo)
#
#  Args:
#	org -
#	repo -
#
#  Returns:
#	str - enabled
#
#>
######################################################################
p6_github_cli_repo_rebase_merge_get() {
  local org="$1"
  local repo="$2"

  local enabled
  enabled=$(p6_github_cli_repo_view_json "$org" "$repo" "rebaseMergeAllowed" '.rebaseMergeAllowed')

  p6_return_str "$enabled"
}

######################################################################
#<
#
# Function: p6_github_cli_repo_secret_scanning_set(repo, enable)
#
#  Args:
#	repo -
#	enable -
#
#>
######################################################################
p6_github_cli_repo_secret_scanning_set() {
  local repo="$1"
  local enable="$2"

  p6_github_cli repo edit "$repo" --enable-secret-scanning="$enable"

  p6_return_void
}

######################################################################
#<
#
# Function: str status_value = p6_github_cli_repo_secret_scanning_get(org, repo)
#
#  Args:
#	org -
#	repo -
#
#  Returns:
#	str - status_value
#
#>
######################################################################
p6_github_cli_repo_secret_scanning_get() {
  local org="$1"
  local repo="$2"

  local status_value
  status_value=$(p6_github_cli_repo_api_view_json "$org" "$repo" '.security_and_analysis.secret_scanning.status')

  case "$status_value" in
    null)     status_value="disabled" ;;
    enabled)  status_value="enabled" ;;
    disabled) status_value="disabled" ;;
  esac

  p6_return_str "$status_value"
}

######################################################################
#<
#
# Function: p6_github_cli_repo_secret_scanning_push_protection_set(repo, enable)
#
#  Args:
#	repo -
#	enable -
#
#>
######################################################################
p6_github_cli_repo_secret_scanning_push_protection_set() {
  local repo="$1"
  local enable="$2"

  p6_github_cli repo edit "$repo" --enable-secret-scanning-push-protection="$enable"

  p6_return_void
}

######################################################################
#<
#
# Function: str status_value = p6_github_cli_repo_secret_scanning_push_protection_get(org, repo)
#
#  Args:
#	org -
#	repo -
#
#  Returns:
#	str - status_value
#
#>
######################################################################
p6_github_cli_repo_secret_scanning_push_protection_get() {
  local org="$1"
  local repo="$2"

  local status_value
  status_value=$(p6_github_cli_repo_api_view_json "$org" "$repo" '.security_and_analysis.secret_scanning_push_protection.status')

  case "$status_value" in
    null)     status_value="disabled" ;;
    enabled)  status_value="enabled" ;;
    disabled) status_value="disabled" ;;
  esac

  p6_return_str "$status_value"
}

######################################################################
#<
#
# Function: p6_github_cli_repo_squash_merge_set(repo, enable)
#
#  Args:
#	repo -
#	enable -
#
#>
######################################################################
p6_github_cli_repo_squash_merge_set() {
  local repo="$1"
  local enable="$2"

  p6_github_cli repo edit "$repo" --enable-squash-merge="$enable"

  p6_return_void
}

######################################################################
#<
#
# Function: str enabled = p6_github_cli_repo_squash_merge_get(org, repo)
#
#  Args:
#	org -
#	repo -
#
#  Returns:
#	str - enabled
#
#>
######################################################################
p6_github_cli_repo_squash_merge_get() {
  local org="$1"
  local repo="$2"

  local enabled
  enabled=$(p6_github_cli_repo_view_json "$org" "$repo" "squashMergeAllowed" '.squashMergeAllowed')

  p6_return_str "$enabled"
}

######################################################################
#<
#
# Function: p6_github_cli_repo_template_set(repo, enable)
#
#  Args:
#	repo -
#	enable -
#
#>
######################################################################
p6_github_cli_repo_template_set() {
  local repo="$1"
  local enable="$2"

  p6_github_cli repo edit "$repo" --template="$enable"

  p6_return_void
}

######################################################################
#<
#
# Function: str enabled = p6_github_cli_repo_template_get(org, repo)
#
#  Args:
#	org -
#	repo -
#
#  Returns:
#	str - enabled
#
#>
######################################################################
p6_github_cli_repo_template_get() {
  local org="$1"
  local repo="$2"

  local enabled
  enabled=$(p6_github_cli_repo_view_json "$org" "$repo" "isTemplate" '.isTemplate')

  p6_return_str "$enabled"
}

######################################################################
#<
#
# Function: p6_github_cli_repo_visibility_set(org, repo, visibility)
#
#  Args:
#	org -
#	repo -
#	visibility -
#
#>
######################################################################
p6_github_cli_repo_visibility_set() {
  local org="$1"
  local repo="$2"
  local visibility="$3"

   p6_github_cli repo edit "$org/$repo" --visibility "$visibility" --accept-visibility-change-consequences

  p6_return_void
}

######################################################################
#<
#
# Function: str visibility = p6_github_cli_repo_visibility_get(org, repo)
#
#  Args:
#	org -
#	repo -
#
#  Returns:
#	str - visibility
#
#>
######################################################################
p6_github_cli_repo_visibility_get() {
  local org="$1"
  local repo="$2"

  local visibility
  visibility=$(p6_github_cli_repo_view_json "$org" "$repo" "visibility" '.visibility')

  p6_return_str "$visibility"
}

######################################################################
#<
#
# Function: p6_github_cli_repo_wiki_set(repo, enable)
#
#  Args:
#	repo -
#	enable -
#
#>
######################################################################
p6_github_cli_repo_wiki_set() {
  local repo="$1"
  local enable="$2"

  p6_github_cli repo edit "$repo" --enable-wiki="$enable"

  p6_return_void
}

######################################################################
#<
#
# Function: str enabled = p6_github_cli_repo_wiki_get(org, repo)
#
#  Args:
#	org -
#	repo -
#
#  Returns:
#	str - enabled
#
#>
######################################################################
p6_github_cli_repo_wiki_get() {
  local org="$1"
  local repo="$2"

  local enabled
  enabled=$(p6_github_cli_repo_view_json "$org" "$repo" "hasWikiEnabled" '.hasWikiEnabled')

  p6_return_str "$enabled"
}

######################################################################
#<
#
# Function: p6_github_cli_repo_issues_set(repo, enable)
#
#  Args:
#	repo -
#	enable -
#
#>
######################################################################
p6_github_cli_repo_issues_set() {
  local repo="$1"
  local enable="$2"

  p6_github_cli repo edit "$repo" --enable-issues="$enable"

  p6_return_void
}

######################################################################
#<
#
# Function: str enabled = p6_github_cli_repo_issues_get(org, repo)
#
#  Args:
#	org -
#	repo -
#
#  Returns:
#	str - enabled
#
#>
######################################################################
p6_github_cli_repo_issues_get() {
  local org="$1"
  local repo="$2"

  local enabled
  enabled=$(p6_github_cli_repo_view_json "$org" "$repo" "hasIssuesEnabled" '.hasIssuesEnabled')

  p6_return_str "$enabled"
}

######################################################################
#<
#
# Function: p6_github_cli_repo_projects_set(repo, enable)
#
#  Args:
#	repo -
#	enable -
#
#>
######################################################################
p6_github_cli_repo_projects_set() {
  local repo="$1"
  local enable="$2"

  p6_github_cli repo edit "$repo" --enable-projects="$enable"

  p6_return_void
}

######################################################################
#<
#
# Function: str enabled = p6_github_cli_repo_projects_get(org, repo)
#
#  Args:
#	org -
#	repo -
#
#  Returns:
#	str - enabled
#
#>
######################################################################
p6_github_cli_repo_projects_get() {
  local org="$1"
  local repo="$2"

  local enabled
  enabled=$(p6_github_cli_repo_view_json "$org" "$repo" "hasProjectsEnabled" '.hasProjectsEnabled')

  p6_return_str "$enabled"
}

######################################################################
#<
#
# Function: p6_github_cli_repo_description_set(org, repo, description)
#
#  Args:
#	org -
#	repo -
#	description -
#
#>
######################################################################
p6_github_cli_repo_description_set() {
  local org="$1"
  local repo="$2"
  local description="$3"

  p6_github_cli repo edit "$org/$repo" --description "$description"

  p6_return_void
}

######################################################################
#<
#
# Function: str desc = p6_github_cli_repo_description_get(org, repo)
#
#  Args:
#	org -
#	repo -
#
#  Returns:
#	str - desc
#
#>
######################################################################
p6_github_cli_repo_description_get() {
    local org="$1"
    local repo="$2"

    local desc
    desc=$(p6_github_cli_repo_view_json "$org" "$repo" "description" '.description')

    p6_return_str "$desc"
}

######################################################################
#<
#
# Function: p6_github_cli_repo_homepage_set(org, repo, homepage)
#
#  Args:
#	org -
#	repo -
#	homepage -
#
#>
######################################################################
p6_github_cli_repo_homepage_set() {
  local org="$1"
  local repo="$2"
  local homepage="$3"

  p6_github_cli repo edit "$org/$repo" --homepage "$homepage"

  p6_return_void
}

######################################################################
#<
#
# Function: str home = p6_github_cli_repo_homepage_get(org, repo)
#
#  Args:
#	org -
#	repo -
#
#  Returns:
#	str - home
#
#>
######################################################################
p6_github_cli_repo_homepage_get() {
    local org="$1"
    local repo="$2"

    local home
    home=$(p6_github_cli_repo_view_json "$org" "$repo" "homepageUrl" '.homepageUrl')

    p6_return_str "$home"
}
