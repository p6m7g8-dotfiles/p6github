# shellcheck shell=bash

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

    p6_github_cli repo list "$owner" "$@"

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
# Function: stream  = p6_github_cli_repo_archive(name)
#
#  Args:
#	name -
#
#  Returns:
#	stream - 
#
#>
######################################################################
p6_github_cli_repo_archive() {
    local name="$1"

    p6_github_cli repo archive "$name" --yes

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
# Function: stream  = p6_github_cli_repo_rename(orig_org_repo, new_org_repo)
#
#  Args:
#	orig_org_repo -
#	new_org_repo -
#
#  Returns:
#	stream - 
#
#>
######################################################################
p6_github_cli_repo_rename() {
    local orig_org_repo="$1"
    local new_org_repo="$2"

    p6_github_cli repo rename -R $orig_org_reop $new_org_repo --yes

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

    p6_github_cli_repo_view_json "$org" "$repo" "repositoryTopics" '.repositoryTopics[].name'

    p6_return_stream
}

######################################################################
#<
#
# Function: p6_github_cli_repo_topic_add(repo, topic, repo, topic)
#
#  Args:
#	repo -
#	topic -
#	repo -
#	topic -
#
#>
######################################################################
p6_github_cli_repo_topic_add() {
    local repo="$1"
    local topic="$2"

    p6_github_cli repo edit "$repo" --add-topic "$topic"

    p6_return_void
}

######################################################################
#<
#
# Function: p6_github_cli_repo_topic_remove(repo, topic)
#
#  Args:
#	repo -
#	topic -
#
#>
######################################################################
p6_github_cli_repo_topic_remove() {
    local repo="$1"
    local topic="$2"

    p6_github_cli repo edit "$repo" --remove-topic "$topic"

    p6_return_void
}

######################################################################
#<
#
# Function: p6_github_cli_repo_visibility_set(repo, visibility)
#
#  Args:
#	repo -
#	visibility -
#
#>
######################################################################
p6_github_cli_repo_visibility_set() {
  local repo="$1"
  local visibility="$2"

   p6_github_cli repo edit "$repo" --visibility "$visibility" --accept-visibility-change-consequences

  p6_return_void
}

######################################################################
#<
#
# Function: p6_github_cli_repo_visibility_get(repo, visibility)
#
#  Args:
#	repo -
#	visibility -
#
#>
######################################################################
p6_github_cli_repo_visibility_get() {
  local repo="$1"
  local visibility="$2"

  local visibility=$(p6_github_cli_repo_view_json "$org" "$repo" "visibility" '.visibility')

  p6_return_void
}

######################################################################
#<
#
# Function: p6_github_cli_repo_wiki_set(repo, enabled)
#
#  Args:
#	repo -
#	enabled - true|false
#
#>
######################################################################
p6_github_cli_repo_wiki_set() {
  local repo="$1"
  local enabled="$2"

  if [[ "$enabled" == "true" ]]; then
    p6_github_cli repo edit "$repo" --enable-wiki
  else
    p6_github_cli repo edit "$repo" --disable-wiki
  fi

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

  local enabled=$(p6_github_cli_repo_view_json "$org" "$repo" "hasWikiEnabled" '.hasWikiEnabled')

  p6_return_str "$enabled"
}

######################################################################
#<
#
# Function: p6_github_cli_repo_issues_set(repo, enabled)
#
#  Args:
#	repo -
#	enabled - true|false
#
#>
######################################################################
p6_github_cli_repo_issues_set() {
  local repo="$1"
  local enabled="$2"

  if [[ "$enabled" == "true" ]]; then
    p6_github_cli repo edit "$repo" --enable-issues
  else
    p6_github_cli repo edit "$repo" --disable-issues
  fi

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

  local enabled=$(p6_github_cli_repo_view_json "$org" "$repo" "hasIssuesEnabled" '.hasIssuesEnabled')

  p6_return_str "$enabled"
}

######################################################################
#<
#
# Function: p6_github_cli_repo_projects_set(repo, enabled)
#
#  Args:
#	repo -
#	enabled - true|false
#
#>
######################################################################
p6_github_cli_repo_projects_set() {
  local repo="$1"
  local enabled="$2"

  if [[ "$enabled" == "true" ]]; then
    p6_github_cli repo edit "$repo" --enable-projects
  else
    p6_github_cli repo edit "$repo" --disable-projects
  fi

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

  local enabled=$(p6_github_cli_repo_view_json "$org" "$repo" "hasProjectsEnabled" '.hasProjectsEnabled')

  p6_return_str "$enabled"
}

######################################################################
#<
#
# Function: p6_github_cli_repo_description_set(repo, description)
#
#  Args:
#	repo -
#	description -
#
#>
######################################################################
p6_github_cli_repo_description_set() {
  local repo="$1"
  local description="$2"

  p6_github_cli repo edit "$repo" --description "$description"

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

    local desc=$(p6_github_cli_repo_view_json "$org" "$repo" "description" '.description')

    p6_return_str "$desc"
}

######################################################################
#<
#
# Function: p6_github_cli_repo_homepage_set(repo, homepage)
#
#  Args:
#	repo -
#	homepage -
#
#>
######################################################################
p6_github_cli_repo_homepage_set() {
  local repo="$1"
  local homepage="$2"

  p6_github_cli repo edit "$repo" --homepage "$homepage"

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

    local home=$(p6_github_cli_repo_view_json "$org" "$repo" "homepageUrl" '.homepageUrl')

    p6_return_str "$home"
}
