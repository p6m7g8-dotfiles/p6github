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
- p6df::modules::p6github::init(_module, dir)


### p6github/lib:

#### p6github/lib/branch.sh:

- str branch = p6_github_branch_transliterate(msg)

#### p6github/lib/gh.sh:

- int pr_id = p6_github_gh_pr_last()
- p6_gh()
- p6_github_gh_pr_list()
- p6_github_gh_pr_merge_last()
- p6_github_gh_submit(msg)
- p6_github_gh_tidy()

#### p6github/lib/login.sh:

- p6_github_login_clone(login, dir)



## Hier
```text
.
????????? branch.sh
????????? gh.sh
????????? login.sh

0 directories, 3 files
```
## Author

Philip M . Gollucci <pgollucci@p6m7g8.com>
