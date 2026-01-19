# P6's POSIX.2: p6df-helm

## Table of Contents

- [Badges](#badges)
- [Summary](#summary)
- [Contributing](#contributing)
- [Code of Conduct](#code-of-conduct)
- [Usage](#usage)
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

### Functions

#### p6df-helm

##### p6df-helm/init.zsh

- `p6df::modules::helm::deps()`
- `p6df::modules::helm::external::brew()`
- `p6df::modules::helm::init(_module, dir)`
- `p6df::modules::helm::langs()`
- `p6df::modules::helm::prompt::mod()`

#### p6df-helm/lib

##### p6df-helm/lib/jenkins.sh

- `p6df::modules::helm::jenkins::chart::add()`
- `str pass = p6df::modules::helm::jenkins::admin::password()`

##### p6df-helm/lib/kubernetes.sh

- `p6df::modules::helm::kubernetes::dashboard::token()`

## Hierarchy

```text
.
├── init.zsh
├── lib
│   ├── external_dns.sh
│   ├── jenkins.sh
│   └── kubernetes.sh
├── README.md
└── share
    ├── eks-admin-service-account.yaml
    └── jenkins-chart-values.yaml

3 directories, 7 files
```

## Author

Philip M. Gollucci <pgollucci@p6m7g8.com>
