# P6's POSIX.2: p6github

## Table of Contents

- [Badges](#badges)
- [Summary](#summary)
- [Contributing](#contributing)
- [Code of Conduct](#code-of-conduct)
- [Usage](#usage)
  - [Hooks](#hooks)
  - [Functions](#functions)
- [Hierarchy](#hierarchy)
- [Author](#author)

## Badges

[![License](https://img.shields.io/badge/License-Apache%202.0-yellowgreen.svg)](https://opensource.org/licenses/Apache-2.0)

## Summary

TODO: Add a short summary of this module.

## Contributing

- [How to Contribute](<https://github.com/p6m7g8-dotfiles/.github/blob/main/CONTRIBUTING.md>)

## Code of Conduct

- [Code of Conduct](<https://github.com/p6m7g8-dotfiles/.github/blob/main/CODE_OF_CONDUCT.md>)

## Usage

### Hooks

- `deps` -> `p6df::modules::p6github::deps()`
- `init` -> `p6df::modules::p6github::init(_module, dir)`

### Functions

#### api

##### p6github/lib/api/repo.sh

- `stream  = p6_github_api_repo_transfer(org_repo, new_owner)`
  - Args:
    - org_repo - 
    - new_owner - 

##### p6github/lib/api/team.sh

- `stream  = p6_github_api_org_teams_list(org)`
  - Args:
    - org - 

##### p6github/lib/api/user.sh

- `str login = p6_github_api_user_login_get(user)`
  - Args:
    - user - 

#### cli

##### p6github/lib/cli/act.sh

- `stream  = p6_github_cli_act_build()`
- `stream  = p6_github_cli_act_release()`

##### p6github/lib/cli/org.sh

- `stream  = p6_github_cli_org_list(...)`
  - Args:
    - ... - 
- `stream  = p6_github_cli_org_teams_list(org)`
  - Args:
    - org - 

##### p6github/lib/cli/parallel.sh

- `stream  = p6_github_cli_parallel_clone(login, dest_dir, ...)`
  - Args:
    - login - 
    - dest_dir - 
    - ... - 
- `stream  = p6_github_cli_parallel_config([key=], [value=])`
  - Args:
    - OPTIONAL key - []
    - OPTIONAL value - []
- `stream  = p6_github_cli_parallel_list(login, ...)`
  - Args:
    - login - 
    - ... - 
- `stream  = p6_github_cli_parallel_status(dest_dir)`
  - Args:
    - dest_dir - 
- `stream  = p6_github_cli_parallel_sync(dest_dir)`
  - Args:
    - dest_dir - 

##### p6github/lib/cli/pr.sh

- `stream  = p6_github_cli_pr_checkout(...)`
  - Args:
    - ... - 
- `stream  = p6_github_cli_pr_create(...)`
  - Args:
    - ... - 
- `stream  = p6_github_cli_pr_list(...)`
  - Args:
    - ... - 
- `stream  = p6_github_cli_pr_merge_squash_delete(pr, ...)`
  - Args:
    - pr - 
    - ... - 
- `stream  = p6_github_cli_pr_view(pr, ...)`
  - Args:
    - pr - 
    - ... - 
- `stream  = p6_github_cli_pr_view_web(pr, ...)`
  - Args:
    - pr - 
    - ... - 

##### p6github/lib/cli/repo.sh

- `p6_github_cli_repo_advanced_security_set(repo, enable)`
  - Args:
    - repo - 
    - enable - 
- `p6_github_cli_repo_allow_forking_set(repo, enable)`
  - Args:
    - repo - 
    - enable - 
- `p6_github_cli_repo_allow_update_branch_set(repo, enable)`
  - Args:
    - repo - 
    - enable - 
- `p6_github_cli_repo_auto_merge_set(repo, enable)`
  - Args:
    - repo - 
    - enable - 
- `p6_github_cli_repo_default_branch_set(repo, branch)`
  - Args:
    - repo - 
    - branch - 
- `p6_github_cli_repo_delete_branch_on_merge_set(repo, enable)`
  - Args:
    - repo - 
    - enable - 
- `p6_github_cli_repo_description_set(org, repo, description)`
  - Args:
    - org - 
    - repo - 
    - description - 
- `p6_github_cli_repo_discussions_set(repo, enable)`
  - Args:
    - repo - 
    - enable - 
- `p6_github_cli_repo_homepage_set(org, repo, homepage)`
  - Args:
    - org - 
    - repo - 
    - homepage - 
- `p6_github_cli_repo_issues_set(repo, enable)`
  - Args:
    - repo - 
    - enable - 
- `p6_github_cli_repo_merge_commit_set(repo, enable)`
  - Args:
    - repo - 
    - enable - 
- `p6_github_cli_repo_projects_set(repo, enable)`
  - Args:
    - repo - 
    - enable - 
- `p6_github_cli_repo_rebase_merge_set(repo, enable)`
  - Args:
    - repo - 
    - enable - 
- `p6_github_cli_repo_secret_scanning_push_protection_set(repo, enable)`
  - Args:
    - repo - 
    - enable - 
- `p6_github_cli_repo_secret_scanning_set(repo, enable)`
  - Args:
    - repo - 
    - enable - 
- `p6_github_cli_repo_squash_merge_set(repo, enable)`
  - Args:
    - repo - 
    - enable - 
- `p6_github_cli_repo_template_set(repo, enable)`
  - Args:
    - repo - 
    - enable - 
- `p6_github_cli_repo_topic_add(org, repo, topic)`
  - Args:
    - org - 
    - repo - 
    - topic - 
- `p6_github_cli_repo_topic_remove(org, repo, topic)`
  - Args:
    - org - 
    - repo - 
    - topic - 
- `p6_github_cli_repo_visibility_set(org, repo, visibility)`
  - Args:
    - org - 
    - repo - 
    - visibility - 
- `p6_github_cli_repo_wiki_set(repo, enable)`
  - Args:
    - repo - 
    - enable - 
- `str branch = p6_github_cli_repo_default_branch_get(org, repo)`
  - Args:
    - org - 
    - repo - 
- `str desc = p6_github_cli_repo_description_get(org, repo)`
  - Args:
    - org - 
    - repo - 
- `str enabled = p6_github_cli_repo_allow_forking_get(org, repo)`
  - Args:
    - org - 
    - repo - 
- `str enabled = p6_github_cli_repo_allow_update_branch_get(org, repo)`
  - Args:
    - org - 
    - repo - 
- `str enabled = p6_github_cli_repo_auto_merge_get(org, repo)`
  - Args:
    - org - 
    - repo - 
- `str enabled = p6_github_cli_repo_delete_branch_on_merge_get(org, repo)`
  - Args:
    - org - 
    - repo - 
- `str enabled = p6_github_cli_repo_discussions_get(org, repo)`
  - Args:
    - org - 
    - repo - 
- `str enabled = p6_github_cli_repo_is_archived_get(org, repo)`
  - Args:
    - org - 
    - repo - 
- `str enabled = p6_github_cli_repo_is_fork_get(org, repo)`
  - Args:
    - org - 
    - repo - 
- `str enabled = p6_github_cli_repo_issues_get(org, repo)`
  - Args:
    - org - 
    - repo - 
- `str enabled = p6_github_cli_repo_merge_commit_get(org, repo)`
  - Args:
    - org - 
    - repo - 
- `str enabled = p6_github_cli_repo_projects_get(org, repo)`
  - Args:
    - org - 
    - repo - 
- `str enabled = p6_github_cli_repo_rebase_merge_get(org, repo)`
  - Args:
    - org - 
    - repo - 
- `str enabled = p6_github_cli_repo_squash_merge_get(org, repo)`
  - Args:
    - org - 
    - repo - 
- `str enabled = p6_github_cli_repo_template_get(org, repo)`
  - Args:
    - org - 
    - repo - 
- `str enabled = p6_github_cli_repo_wiki_get(org, repo)`
  - Args:
    - org - 
    - repo - 
- `str home = p6_github_cli_repo_homepage_get(org, repo)`
  - Args:
    - org - 
    - repo - 
- `str status_value = p6_github_cli_repo_advanced_security_get(org, repo)`
  - Args:
    - org - 
    - repo - 
- `str status_value = p6_github_cli_repo_secret_scanning_get(org, repo)`
  - Args:
    - org - 
    - repo - 
- `str status_value = p6_github_cli_repo_secret_scanning_push_protection_get(org, repo)`
  - Args:
    - org - 
    - repo - 
- `str visibility = p6_github_cli_repo_visibility_get(org, repo)`
  - Args:
    - org - 
    - repo - 
- `stream  = p6_github_cli_clone(repo, dir)`
  - Args:
    - repo - 
    - dir - 
- `stream  = p6_github_cli_repo_api_view_json(org, repo, jq)`
  - Args:
    - org - 
    - repo - 
    - jq - 
- `stream  = p6_github_cli_repo_archive(org, repo)`
  - Args:
    - org - 
    - repo - 
- `stream  = p6_github_cli_repo_list(owner, ...)`
  - Args:
    - owner - 
    - ... - 
- `stream  = p6_github_cli_repo_rename(orig_org_repo, new_repo)`
  - Args:
    - orig_org_repo - 
    - new_repo - 
- `stream  = p6_github_cli_repo_topics_list(org, repo)`
  - Args:
    - org - 
    - repo - 
- `stream  = p6_github_cli_repo_unarchive(name)`
  - Args:
    - name - 
- `stream  = p6_github_cli_repo_view_json(org, repo, json, jq)`
  - Args:
    - org - 
    - repo - 
    - json - 
    - jq - 

##### p6github/lib/cli/ruleset_branch.sh

- `stream  = p6_github_cli_ruleset_branch_activate([ruleset_name=default])`
  - Args:
    - OPTIONAL ruleset_name - [default]
- `stream  = p6_github_cli_ruleset_branch_create([ruleset_name=default])`
  - Args:
    - OPTIONAL ruleset_name - [default]
- `stream  = p6_github_cli_ruleset_branch_deactivate([ruleset_name=default])`
  - Args:
    - OPTIONAL ruleset_name - [default]
- `stream  = p6_github_cli_ruleset_branch_delete([ruleset_name=default])`
  - Args:
    - OPTIONAL ruleset_name - [default]
- `stream  = p6_github_cli_ruleset_branch_update(...)`
  - Args:
    - ... - 

##### p6github/lib/cli/workflow.sh

- `stream  = p6_github_cli_workflow_run(workflow, ...)`
  - Args:
    - workflow - 
    - ... - 
- `stream  = p6_github_cli_workflow_upgrade_main_run()`

#### p6github

##### p6github/init.zsh

- `p6df::modules::p6github::deps()`
- `p6df::modules::p6github::init(_module, dir)`
  - Args:
    - _module - 
    - dir - 

#### p6github/lib

##### p6github/lib/act.sh

- `stream  = p6_github_cli_act(...)`
  - Args:
    - ... - 

##### p6github/lib/cli.sh

- `p6_github_cli(...)`
  - Args:
    - ... - 

##### p6github/lib/util.sh

- `int pr_id = p6_github_util_pr_last()`
- `int pr_id = p6_github_util_pr_oldest()`
- `p6_github_util_pr_create(user, reviewer)`
  - Args:
    - user - 
    - reviewer - 
- `p6_github_util_pr_merge_last()`
- `p6_github_util_pr_merge_oldest()`
- `p6_github_util_pr_poll_while_open([pr_id=], [delay=1])`
  - Args:
    - OPTIONAL pr_id - []
    - OPTIONAL delay - [1]
- `p6_github_util_pr_submit(editor, user, tmpl, [reviewer=], [cli_msg=], [pr_num=])`
  - Args:
    - editor - 
    - user - 
    - tmpl - 
    - OPTIONAL reviewer - []
    - OPTIONAL cli_msg - []
    - OPTIONAL pr_num - []
- `p6_github_util_repo_rename_strip_leading_underscores(orig_org_repo)`
  - Args:
    - orig_org_repo - 
- `str state = p6_github_util_pr_state_get(pr_id)`
  - Args:
    - pr_id - 
- `str version = p6_github_util_action_version_latest(action)`
  - Args:
    - action - 

## Hierarchy

```text
.
├── conf
│   └── all
├── init.zsh
├── lib
│   ├── act.sh
│   ├── api
│   │   ├── repo.sh
│   │   ├── team.sh
│   │   └── user.sh
│   ├── cli
│   │   ├── act.sh
│   │   ├── org.sh
│   │   ├── parallel.sh
│   │   ├── pr.sh
│   │   ├── repo.sh
│   │   ├── ruleset_branch.sh
│   │   └── workflow.sh
│   ├── cli.sh
│   └── util.sh
└── README.md

5 directories, 16 files
```

## Author

Philip M. Gollucci <pgollucci@p6m7g8.com>
