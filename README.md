# p6github

## Table of Contents


### p6github
- [p6github](#p6github)
  - [Badges](#badges)
  - [Distributions](#distributions)
  - [Summary](#summary)
  - [Contributing](#contributing)
  - [Code of Conduct](#code-of-conduct)
  - [Changes](#changes)
    - [Usage](#usage)
  - [Author](#author)

### Badges

[![License](https://img.shields.io/badge/License-Apache%202.0-yellowgreen.svg)](https://opensource.org/licenses/Apache-2.0)
[![Gitpod ready-to-code](https://img.shields.io/badge/Gitpod-ready--to--code-blue?logo=gitpod)](https://gitpod.io/#https://github.com/p6m7g8/p6github)
[![Mergify](https://img.shields.io/endpoint.svg?url=https://gh.mergify.io/badges/p6m7g8/p6github/&style=flat)](https://mergify.io)
[![codecov](https://codecov.io/gh/p6m7g8/p6github/branch/master/graph/badge.svg?token=14Yj1fZbew)](https://codecov.io/gh/p6m7g8/p6github)
[![Known Vulnerabilities](https://snyk.io/test/github/p6m7g8/p6github/badge.svg?targetFile=package.json)](https://snyk.io/test/github/p6m7g8/p6github?targetFile=package.json)
[![Gihub repo dependents](https://badgen.net/github/dependents-repo/p6m7g8/p6github)](https://github.com/p6m7g8/p6github/network/dependents?dependent_type=REPOSITORY)
[![Gihub package dependents](https://badgen.net/github/dependents-pkg/p6m7g8/p6github)](https://github.com/p6m7g8/p6github/network/dependents?dependent_type=PACKAGE)

## Summary

## Contributing

- [How to Contribute](CONTRIBUTING.md)

## Code of Conduct

- [Code of Conduct](https://github.com/p6m7g8/.github/blob/master/CODE_OF_CONDUCT.md)

## Changes

- [Change Log](CHANGELOG.md)

## Usage

### p6github:

#### p6github/init.zsh:

- p6df::modules::p6github::deps()
- p6df::modules::p6github::init()

### ../p6github/lib:

#### ../p6github/lib/action.sh:

- bool rc = p6_github_gh_action_status_stop_when_completed(_status)
- p6_github_gh_action_view(action_id)
- p6_github_gh_action_view_do(action_id)
- str _status = p6_github_gh_action_status(action_id)
- str json = p6_github_gh_action_status_json(action_id)
#### ../p6github/lib/actions.sh:

- str action_id = p6_github_gh_actions_last()
#### ../p6github/lib/api.sh:

- str list = p6_github_api_actions_list([name=Build], [owner=:owner], [repo=:repo])
- str list = p6_github_api_org_repos_list([org=:org])
- str list = p6_github_api_user_repos_list([user=:user])
- str log = p6_github_api_action_log(action_id, [owner=:owner], [repo=:repo])
#### ../p6github/lib/branch.sh:

- p6_github_branch_submit(branch, msg)
#### ../p6github/lib/cli.sh:

- code rc = p6_github_gh_cmd(cmd, ...)
- p6_github_gh_pr_checkout(pr, ...)
- p6_github_gh_pr_comment(pr, ...)
- p6_github_gh_pr_create([user=${USER:-pgollucci])
- p6_github_gh_pr_list()
- p6_github_gh_pr_merge(pr, ...)
- p6_github_gh_pr_view(pr, ...)
#### ../p6github/lib/oauth.sh:

- p6_github_oauth_token_clear()
- p6_github_oauth_token_del(gh_api, user, pass, id)
- p6_github_oauth_token_get(gh_api, user, pass, note)
#### ../p6github/lib/pr.sh:

- p6_github_gh_pr_submit(msg)
- str name = p6_git_branch_name_gen([prefix=branch])
#### ../p6github/lib/util.sh:

- p6_github_util_org_repos_clone(org, dir, [parallel=8])
- p6_github_util_repo_clone_or_pull(ou, dir, repo)
- p6_github_util_thing_clear()
- p6_github_util_thing_parse(thing)
- p6_github_util_user_repos_clone(user, dir, [parallel=8])


## Author

Philip M . Gollucci <pgollucci@p6m7g8.com>
