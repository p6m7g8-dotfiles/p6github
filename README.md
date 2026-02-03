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
- `stream  = p6_github_cli_act_build()`
- `stream  = p6_github_cli_act_release()`

##### p6github/lib/cli.sh

- `p6_github_cli(...)`
  - Args:
    - ... - 
- `p6_github_cli_clone(repo, dir)`
  - Args:
    - repo - 
    - dir - 
- `p6_github_cli_pr_checkout(...)`
  - Args:
    - ... - 
- `p6_github_cli_pr_create(...)`
  - Args:
    - ... - 
- `p6_github_cli_pr_list(...)`
  - Args:
    - ... - 
- `p6_github_cli_pr_merge_squash_delete(pr)`
  - Args:
    - pr - 
- `p6_github_cli_pr_view(pr, ...)`
  - Args:
    - pr - 
    - ... - 
- `p6_github_cli_pr_view_web(pr)`
  - Args:
    - pr - 
- `p6_github_cli_ruleset_branch_activate([ruleset_name=default])`
  - Args:
    - OPTIONAL ruleset_name - [default]
- `p6_github_cli_ruleset_branch_create([ruleset_name=default])`
  - Args:
    - OPTIONAL ruleset_name - [default]
- `p6_github_cli_ruleset_branch_deactivate([ruleset_name=default])`
  - Args:
    - OPTIONAL ruleset_name - [default]
- `p6_github_cli_ruleset_branch_delete([ruleset_name=default])`
  - Args:
    - OPTIONAL ruleset_name - [default]
- `p6_github_cli_ruleset_branch_update(...)`
  - Args:
    - ... - 
- `p6_github_cli_workflow_run(workflow, ...)`
  - Args:
    - workflow - 
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
│   ├── all
│   └── current
├── init.zsh
├── lib
│   ├── act.sh
│   ├── cli.sh
│   └── util.sh
└── README.md

3 directories, 7 files
```

## Author

Philip M. Gollucci <pgollucci@p6m7g8.com>
