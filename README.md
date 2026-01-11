# P6's POSIX.2: p6github

## Table of Contents

## Badges

[![License](https://img.shields.io/badge/License-Apache%202.0-yellowgreen.svg)](https://opensource.org/licenses/Apache-2.0)

## Summary

## Contributing

- [How to Contribute](<https://github.com//.github/blob/main/CONTRIBUTING.md>)

## Code of Conduct

- [Code of Conduct](<https://github.com//.github/blob/main/CODE_OF_CONDUCT.md>)

## Usage

### Aliases

### Functions

## p6github

### p6github/init.zsh

- p6df::modules::p6github::deps()
- p6df::modules::p6github::init(_module, dir)

## p6github/lib

### p6github/lib/act.sh

- stream  = p6_github_cli_act()
- stream  = p6_github_cli_act_build()
- stream  = p6_github_cli_act_release()

### p6github/lib/cli.sh

- int pr_id = p6_github_cli_pr_last()
- p6_github_cli_clone(repo, dir)
- p6_github_cli_pr_list()
- p6_github_cli_pr_view_web(pr)

### p6github/lib/util.sh

- int pr_id = p6_github_util_pr_last()
- p6_github_util_pr_create(user, reviewer)
- p6_github_util_pr_merge_last()
- p6_github_util_pr_submit(editor, user, tmpl, [reviewer=], [cli_msg=], [pr_num=])
- p6_github_util_repo_archive()
- p6_github_util_repo_patch(state)
- p6_github_util_repo_rename(orig_org_repo, new_org_repo)
- p6_github_util_repo_rename_strip_leading_underscores(orig_org_repo)
- p6_github_util_repo_unarchive()
- p6_github_util_repo_workflow_upgrade_main_run()
- p6_github_util_ruleset_branch_activate([ruleset_name=default])
- p6_github_util_ruleset_branch_create([ruleset_name=default])
- p6_github_util_ruleset_branch_deactivate([ruleset_name=default])
- p6_github_util_ruleset_branch_delete([ruleset_name=default])
- p6_github_util_ruleset_branch_update(...)
- str version = p6_github_util_action_version_latest(action)

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

Philip M . Gollucci <pgollucci@p6m7g8.com>
