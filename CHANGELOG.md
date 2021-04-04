# Changelog

All notable changes to this project will be documented in this file. See [standard-version](https://github.com/conventional-changelog/standard-version) for commit guidelines.

### [2.1.2](https://github.com/p6m7g8/p6github/compare/v2.1.1...v2.1.2) (2021-04-04)


### Features

* **api:** `+p6_github_gh_pr_create`, `+p6_github_gh_pr_submit` ([#38](https://github.com/p6m7g8/p6github/issues/38)) ([548c1d0](https://github.com/p6m7g8/p6github/commit/548c1d016fc7e03d6e714f68cd56547e4c136b9f))
* **api:** +`p6_github_gh_action_status`, +`p6_github_gh_action_status_json` ([#35](https://github.com/p6m7g8/p6github/issues/35)) ([aedaf63](https://github.com/p6m7g8/p6github/commit/aedaf63b95335d257a263aae3ca763a75c989e57))
* **api:** +`p6_github_gh_action_view_do` ([#37](https://github.com/p6m7g8/p6github/issues/37)) ([8d31af8](https://github.com/p6m7g8/p6github/commit/8d31af899dd1f69a1c0100118ad744a3cedfc5a6))


### Bug Fixes

* **cli:** push branch before making pr to gaurantee no prompt ([#42](https://github.com/p6m7g8/p6github/issues/42)) ([1624184](https://github.com/p6m7g8/p6github/commit/162418483c8df37c1ce22f36d1ce53546d7a0f9e))


* adds cdk8-team to tracked orgs ([#44](https://github.com/p6m7g8/p6github/issues/44)) ([9a2f05e](https://github.com/p6m7g8/p6github/commit/9a2f05e83d69523bcb6ca875d8dc1f62c5876b2c))
* track github repo renames ([#43](https://github.com/p6m7g8/p6github/issues/43)) ([acaa394](https://github.com/p6m7g8/p6github/commit/acaa394bd2b8093453226eaad2c4cbaa9952d1a4))
* **api:** p6_git_branch_name_gen ([#39](https://github.com/p6m7g8/p6github/issues/39)) ([9f02944](https://github.com/p6m7g8/p6github/commit/9f02944d2e89f9296f4ef67ca53ac6f71aded274))
* **api:** split into files, renames, returns, +action(s) ([#36](https://github.com/p6m7g8/p6github/issues/36)) ([41059a3](https://github.com/p6m7g8/p6github/commit/41059a303a01318bc447b43fcfa6d448a017be2e))
* **README:** updates generator ([#40](https://github.com/p6m7g8/p6github/issues/40)) ([99f7531](https://github.com/p6m7g8/p6github/commit/99f75315b820baa61ab1b61a43f80d6170e19410))
* Coc -> .github ([b8010ab](https://github.com/p6m7g8/p6github/commit/b8010ab997740347050ca86503370bb98d50a317))
* the great vscode indent of 2021 ([#41](https://github.com/p6m7g8/p6github/issues/41)) ([99a84bb](https://github.com/p6m7g8/p6github/commit/99a84bb4bfe7a7b697073770c94db0508f8c59e0))

### [2.1.1](https://github.com/p6m7g8/p6github/compare/v2.1.0...v2.1.1) (2020-12-06)


### Features

* **api:** +`p6_github_gh_action_log`, +`p6_github_gh_action_view`, +`p6_github_gh_actions_list`, +`p6_github_gh_actions_last` ([#34](https://github.com/p6m7g8/p6github/issues/34)) ([eae76b1](https://github.com/p6m7g8/p6github/commit/eae76b15fb6c160a36defa7dfe442912af13d546))

## [2.1.0](https://github.com/p6m7g8/p6github/compare/v2.0.0...v2.1.0) (2020-12-06)


### Features

* **api:** +`p6_github_cli_branch`, +`p6_github_gh_pr_checkout`, +`p6_github_gh_pr_view` ([#24](https://github.com/p6m7g8/p6github/issues/24)) ([11a1055](https://github.com/p6m7g8/p6github/commit/11a1055e5296d96ba8a065565d25a425941d3631))
* **api:** +`p6_github_gh_pr_comment` ([#32](https://github.com/p6m7g8/p6github/issues/32)) ([91d426d](https://github.com/p6m7g8/p6github/commit/91d426de85ae6c5029a0dceaeb54c9c7e7c6d730))
* **api:** +`p6_github_gh_pr_merge` ([#33](https://github.com/p6m7g8/p6github/issues/33)) ([1028d26](https://github.com/p6m7g8/p6github/commit/1028d26bfc3f0d4be39424002695e1d9877b343f))
* **api:** centralize ::version() ([8a80a93](https://github.com/p6m7g8/p6github/commit/8a80a930bb74eda3cfc0877b6c72fa89a996b395))
* **community:** adds CODE_OF_CONDUCT ([b4c7345](https://github.com/p6m7g8/p6github/commit/b4c734531afa2867308c75f55c5a458333f1ab77))
* **github:** adds ISSUE_TEMPLATEs ([2330985](https://github.com/p6m7g8/p6github/commit/23309854a9d11c99237ec26556be9ca468368ed3))


### Bug Fixes

* **p6_github_cli_submit:** typo ([#22](https://github.com/p6m7g8/p6github/issues/22)) ([dcfc329](https://github.com/p6m7g8/p6github/commit/dcfc3293ca945506aacb879a11b0e2f462828a4d))


* **community:** rely on the .github/ in the org ([#30](https://github.com/p6m7g8/p6github/issues/30)) ([3b05130](https://github.com/p6m7g8/p6github/commit/3b05130cb01c965b0fe1c928a16acd11d02d74a9))
* **conf:** cleans up ([6156268](https://github.com/p6m7g8/p6github/commit/61562682e63a143fb19491b39e8913d41220ec4e))
* **docs:** fixes whitespace ([64b111e](https://github.com/p6m7g8/p6github/commit/64b111ec979f72bfeceafdd6ec4ccab85b272faa))
* **README:** fixes module expansion, adds CodeCov and Synk badges ([#31](https://github.com/p6m7g8/p6github/issues/31)) ([db7c5cb](https://github.com/p6m7g8/p6github/commit/db7c5cbecf9c3c9a5a6edbaa87a2d0adcd3b477b))
* **README:** updates to template v2.0 ([a543dac](https://github.com/p6m7g8/p6github/commit/a543dac841ded4d5d6e8a66e69280f2e49c280bb))
* **semantic:** no longer needed, defaults are fine ([ac8bca4](https://github.com/p6m7g8/p6github/commit/ac8bca46cc3faca59f8ebbd25bfbcf918347d44e))

## [2.0.0](https://github.com/p6m7g8/p6github/compare/v1.0.4...v2.0.0) (2020-10-11)


### Bug Fixes

* **deps:** depends on `p6m7g8/p6common` ([#21](https://github.com/p6m7g8/p6github/issues/21)) ([58e0281](https://github.com/p6m7g8/p6github/commit/58e0281ec208968a94f60f271db576e88bd521ec))

### [1.0.4](https://github.com/p6m7g8/p6github/compare/v1.0.3...v1.0.4) (2020-09-20)


### Features

* **gh:** api -> gh api ([#17](https://github.com/p6m7g8/p6github/issues/17)) ([2b3d076](https://github.com/p6m7g8/p6github/commit/2b3d0764d918bca213149d9c6ebc66cd63be3a25))


### Bug Fixes

* **api/p6_github_api_org_repos_list:** stop unintentionally excluding `.github` ([#19](https://github.com/p6m7g8/p6github/issues/19)) ([002e334](https://github.com/p6m7g8/p6github/commit/002e334ca4ca79267e18019b403cdbffca162435))
* **cli:** fix commit to prompt for a message ([#15](https://github.com/p6m7g8/p6github/issues/15)) ([21c10bf](https://github.com/p6m7g8/p6github/commit/21c10bfffe9dc1b1c38bd34d36989a07ee6aa2f9))
* **cli:** removes git add ([2e86193](https://github.com/p6m7g8/p6github/commit/2e861935b7a2256682f3711f2e94aa5ab5c62b58))
* **orgs:** reduce active repos to those I use the most right now for space reasons ([#18](https://github.com/p6m7g8/p6github/issues/18)) ([6d1d2dc](https://github.com/p6m7g8/p6github/commit/6d1d2dc02448a077f9812ab49a1f367f8a6e3c02))


* **doc:** regens ([#16](https://github.com/p6m7g8/p6github/issues/16)) ([1afd7ae](https://github.com/p6m7g8/p6github/commit/1afd7aeef5f99823a31b5cd69e983be9fcfb6b2a))
* **doc:** regens docs ([#20](https://github.com/p6m7g8/p6github/issues/20)) ([c1e250a](https://github.com/p6m7g8/p6github/commit/c1e250a37291356fbc64ff62c730d91641bc4d54))

### [1.0.3](https://github.com/p6m7g8/p6github/compare/v1.0.2...v1.0.3) (2020-06-05)


### Features

* **cli:** +p6_github_gh_pr_list ([#12](https://github.com/p6m7g8/p6github/issues/12)) ([6f67731](https://github.com/p6m7g8/p6github/commit/6f67731de9d15eda6ef0a8b6af7541c9c7e11be6))
* **orgs:** adds ALL AWS github OSS orgs ([#14](https://github.com/p6m7g8/p6github/issues/14)) ([22a6855](https://github.com/p6m7g8/p6github/commit/22a6855981a1050b642d2213c33602e26b11fba3))
* **util:** uses p6_git_cmd() ([#11](https://github.com/p6m7g8/p6github/issues/11)) ([7706288](https://github.com/p6m7g8/p6github/commit/77062889d749e4c1389d0e76b5d26937ff2ad7cb))


* **api:** p6ify" ([#9](https://github.com/p6m7g8/p6github/issues/9)) ([6f42a26](https://github.com/p6m7g8/p6github/commit/6f42a26f2387293736665728af34cc16a77cefec))
* **release:** 1.0.2 ([404ef18](https://github.com/p6m7g8/p6github/commit/404ef187c00053fcf76ef56959d8cba523bc5adf))

### [1.0.2](https://github.com/p6m7g8/p6github/compare/v1.0.1...v1.0.2) (2020-06-04)


### Features

* **api:** removes unused and insecure pass arg ([#7](https://github.com/p6m7g8/p6github/issues/7)) ([46eab98](https://github.com/p6m7g8/p6github/commit/46eab98f2c33bf7421f8f3aa595bb22b8e67aac5))
* **cli:** +p6_github_gh_pr_list ([#12](https://github.com/p6m7g8/p6github/issues/12)) ([6f67731](https://github.com/p6m7g8/p6github/commit/6f67731de9d15eda6ef0a8b6af7541c9c7e11be6))
* **util:** uses p6_git_cmd() ([#11](https://github.com/p6m7g8/p6github/issues/11)) ([7706288](https://github.com/p6m7g8/p6github/commit/77062889d749e4c1389d0e76b5d26937ff2ad7cb))


* **api:** p6ify" ([#9](https://github.com/p6m7g8/p6github/issues/9)) ([6f42a26](https://github.com/p6m7g8/p6github/commit/6f42a26f2387293736665728af34cc16a77cefec))
* **release:** 1.0.2 ([0b4ae53](https://github.com/p6m7g8/p6github/commit/0b4ae530c70bcc8efffa57488bdb2a9b2c1138f8))

### [1.0.2](https://github.com/p6m7g8/p6github/compare/v1.0.1...v1.0.2) (2020-05-29)


### Features

* **api:** removes unused and insecure pass arg ([#7](https://github.com/p6m7g8/p6github/issues/7)) ([46eab98](https://github.com/p6m7g8/p6github/commit/46eab98f2c33bf7421f8f3aa595bb22b8e67aac5))

### 1.0.1 (2020-05-29)


### Features

* **cicd:** setups Makefile and standard-version ([#6](https://github.com/p6m7g8/p6github/issues/6)) ([9fe5951](https://github.com/p6m7g8/p6github/commit/9fe5951d312b3aad57a4bf822773e86d699664b7))


* **docs:** regen ([#4](https://github.com/p6m7g8/p6github/issues/4)) ([cdf5d4e](https://github.com/p6m7g8/p6github/commit/cdf5d4ece970a2fafb14bf0ee84a282e37b3d6a7))
* **mergify:** adds config ([c4eb057](https://github.com/p6m7g8/p6github/commit/c4eb057b84279a491b5adf63a67a13ce75f91f86))
* **orgs:** split into two files for time/disk reasons ([87a230f](https://github.com/p6m7g8/p6github/commit/87a230f6717131d88654f79500b742da53bd9a12))
* **readme:** regen ([#5](https://github.com/p6m7g8/p6github/issues/5)) ([9d02765](https://github.com/p6m7g8/p6github/commit/9d027651ce2a5b620a43a8f25229155c1efabf59))
* **semqntic:** adds semantic.yml ([#1](https://github.com/p6m7g8/p6github/issues/1)) ([92fefbe](https://github.com/p6m7g8/p6github/commit/92fefbea544bccadab13f34bc029e90de1623796))
