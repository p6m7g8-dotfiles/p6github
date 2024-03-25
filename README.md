# p6github

## Table of Contents


### p6github
- [p6github](#p6github)
  - [Badges](#badges)
  - [Distributions](#distributions)
  - [Summary](#summary)
  - [Contributing](#contributing)
  - [Code of Conduct](#code-of-conduct)
  - [Usage](#usage)
  - [Author](#author)

### Badges

[![License](https://img.shields.io/badge/License-Apache%202.0-yellowgreen.svg)](https://opensource.org/licenses/Apache-2.0)
[![Gitpod ready-to-code](https://img.shields.io/badge/Gitpod-ready--to--code-blue?logo=gitpod)](https://gitpod.io/#https://github.com/p6m7g8/p6github)
[![Mergify](https://img.shields.io/endpoint.svg?url=https://gh.mergify.io/badges/p6m7g8/p6github/&style=flat)](https://mergify.io)
[![codecov](https://codecov.io/gh/p6m7g8/p6github/branch/master/graph/badge.svg?token=14Yj1fZbew)](https://codecov.io/gh/p6m7g8/p6github)
[![Gihub repo dependents](https://badgen.net/github/dependents-repo/p6m7g8/p6github)](https://github.com/p6m7g8/p6github/network/dependents?dependent_type=REPOSITORY)
[![Gihub package dependents](https://badgen.net/github/dependents-pkg/p6m7g8/p6github)](https://github.com/p6m7g8/p6github/network/dependents?dependent_type=PACKAGE)

## Summary

## Contributing

- [How to Contribute](CONTRIBUTING.md)

## Code of Conduct

- [Code of Conduct](https://github.com/p6m7g8/.github/blob/master/CODE_OF_CONDUCT.md)

## Usage


### Aliases


### Functions

### p6github:

#### p6github/init.zsh:

- p6df::modules::p6github::deps()
- p6df::modules::p6github::init(_module, dir)


### p6github/lib:

#### p6github/lib/cli.sh:

- int pr_id = p6_github_cli_pr_last()
- p6_github_cli_clone(repo, dir)
- p6_github_cli_pr_list()

#### p6github/lib/util.sh:

- int pr_id = p6_github_util_pr_last()
- p6_github_util_pr_create(user, reviewer)
- p6_github_util_pr_merge_last()
- p6_github_util_pr_submit(editor, user, tmpl, [reviewer=], [cli_msg=], [pr_num=])



## Hier
```text
.
├── cli.sh
└── util.sh

1 directory, 2 files
```
## Author

Philip M . Gollucci <pgollucci@p6m7g8.com>
