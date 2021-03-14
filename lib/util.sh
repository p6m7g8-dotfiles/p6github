######################################################################
#<
#
# Function: p6_github_util_thing_parse(thing)
#
#  Args:
#	thing -
#
#>
######################################################################
p6_github_util_thing_parse() {
    local thing="$1"

    if [[ ${thing} = /* ]]; then
        GH_REPO=
        GH=
        GH_VER=
    else
        local org_proj=${thing%%%*}
        # shellcheck disable=SC2034  # Unused variables left for readability
        GH_REPO=${org_proj}
        # shellcheck disable=SC2034  # Unused variables left for readability
        GH="${GITHUB_URL}${org_proj}"

        if [[ ${thing} = *%* ]]; then
            GH_VER=${thing##*%}
        else
            # shellcheck disable=SC2034  # Unused variables left for readability
            GH_VER=master # XXX: ugg, master->main completely breaks peg revisions
        fi
    fi

    p6_return_void
}

######################################################################
#<
#
# Function: p6_github_util_thing_clear()
#
#>
######################################################################
p6_github_util_thing_clear() {

    unset GH
    unset GH_REPO
    unset GH_VER

    p6_return_void
}

######################################################################
#<
#
# Function: p6_github_util_org_repos_clone(org, dir, [parallel=8])
#
#  Args:
#	org -
#	dir -
#	OPTIONAL parallel - [8]
#
#>
######################################################################
p6_github_util_org_repos_clone() {
    local org="$1"
    local dir="$2"
    local parallel="${3:-8}"

    local repos
    repos=$(p6_github_api_org_repos_list "$org")
    p6_run_parallel "0" "$parallel" "$repos" "p6_github_util_repo_clone_or_pull" "$org" "$dir"

    p6_return_void
}

######################################################################
#<
#
# Function: p6_github_util_user_repos_clone(user, dir, [parallel=8])
#
#  Args:
#	user -
#	dir -
#	OPTIONAL parallel - [8]
#
#>
######################################################################
p6_github_util_user_repos_clone() {
    local user="$1"
    local dir="$2"
    local parallel="${3:-8}"

    local repos
    repos=$(p6_github_api_user_repos_list "$user")

    p6_run_parallel "0" "8" "$repos" "p6_github_util_repo_clone_or_pull" "$user" "$dir"

    p6_return_void
}

######################################################################
#<
#
# Function: p6_github_util_repo_clone_or_pull(ou, dir, repo)
#
#  Args:
#	ou -
#	dir -
#	repo -
#
#>
######################################################################
p6_github_util_repo_clone_or_pull() {
    local ou="$1"
    local dir="$2"
    local repo="$3"

    if p6_dir_exists "$dir/$ou/$repo"; then
        p6_h1 "$repo [pull]"
        (
            p6_dir_cd "$dir/$ou/$repo"
            p6_git_cmd pull -q
        )
    else
        p6_h1 "$repo [clone]"
        p6_dir_mk "$dir/$ou/$repo"
        (
            p6_dir_cd "$dir/$ou"
            gh repo clone "${ou}"/"${repo}" -- -q --depth 1 >/dev/null
        )
    fi
}
