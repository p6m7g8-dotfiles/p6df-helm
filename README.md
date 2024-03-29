# p6df-helm

## Table of Contents


### p6df-helm
- [p6df-helm](#p6df-helm)
  - [Badges](#badges)
  - [Distributions](#distributions)
  - [Summary](#summary)
  - [Contributing](#contributing)
  - [Code of Conduct](#code-of-conduct)
  - [Usage](#usage)
  - [Author](#author)

### Badges

[![License](https://img.shields.io/badge/License-Apache%202.0-yellowgreen.svg)](https://opensource.org/licenses/Apache-2.0)
[![Gitpod ready-to-code](https://img.shields.io/badge/Gitpod-ready--to--code-blue?logo=gitpod)](https://gitpod.io/#https://github.com/p6m7g8/p6df-helm)
[![Mergify](https://img.shields.io/endpoint.svg?url=https://gh.mergify.io/badges/p6m7g8/p6df-helm/&style=flat)](https://mergify.io)
[![codecov](https://codecov.io/gh/p6m7g8/p6df-helm/branch/master/graph/badge.svg?token=14Yj1fZbew)](https://codecov.io/gh/p6m7g8/p6df-helm)
[![Gihub repo dependents](https://badgen.net/github/dependents-repo/p6m7g8/p6df-helm)](https://github.com/p6m7g8/p6df-helm/network/dependents?dependent_type=REPOSITORY)
[![Gihub package dependents](https://badgen.net/github/dependents-pkg/p6m7g8/p6df-helm)](https://github.com/p6m7g8/p6df-helm/network/dependents?dependent_type=PACKAGE)

## Summary

## Contributing

- [How to Contribute](CONTRIBUTING.md)

## Code of Conduct

- [Code of Conduct](https://github.com/p6m7g8/.github/blob/master/CODE_OF_CONDUCT.md)

## Usage


### Aliases


### Functions

### p6df-helm:

#### p6df-helm/init.zsh:

- p6df::modules::helm::deps()
- p6df::modules::helm::external::brew()
- p6df::modules::helm::init(_module, dir)
- p6df::modules::helm::langs()
- p6df::modules::helm::prompt::line()


### p6df-helm/lib:

#### p6df-helm/lib/external_dns.sh:

- p6df::modules::helm::external-dns::chart::add(zone_id, role_arn)

#### p6df-helm/lib/jenkins.sh:

- p6df::modules::helm::jenkins::chart::add()
- str pass = p6df::modules::helm::jenkins::admin::password()

#### p6df-helm/lib/kubernetes.sh:

- p6df::modules::helm::kubernetes::dashboard::token()



## Hier
```text
.
├── external_dns.sh
├── jenkins.sh
└── kubernetes.sh

1 directory, 3 files
```
## Author

Philip M . Gollucci <pgollucci@p6m7g8.com>
