# P6's POSIX.2: p6df-helm

## Table of Contents

## Badges

[![License](https://img.shields.io/badge/License-Apache%202.0-yellowgreen.svg)](https://opensource.org/licenses/Apache-2.0)
[![Mergify](https://img.shields.io/endpoint.svg?url=https://gh.mergify.io/badges//p6df-helm/&style=flat)](https://mergify.io)
[![Gitpod ready-to-code](https://img.shields.io/badge/Gitpod-ready--to--code-blue?logo=gitpod)](<https://gitpod.io/#https://github.com//p6df-helm>)

## Summary

## Contributing

- [How to Contribute](<https://github.com//.github/blob/main/CONTRIBUTING.md>)

## Code of Conduct

- [Code of Conduct](<https://github.com//.github/blob/main/CODE_OF_CONDUCT.md>)

## Usage

### Aliases

### Functions

## p6df-helm

### p6df-helm/init.zsh

- p6df::modules::helm::deps()
- p6df::modules::helm::external::brew()
- p6df::modules::helm::init(_module, dir)
- p6df::modules::helm::langs()
- p6df::modules::helm::prompt::line()

## p6df-helm/lib

### p6df-helm/lib/external_dns.sh

- p6df::modules::helm::external-dns::chart::add(zone_id, role_arn)

### p6df-helm/lib/jenkins.sh

- p6df::modules::helm::jenkins::chart::add()
- str pass = p6df::modules::helm::jenkins::admin::password()

### p6df-helm/lib/kubernetes.sh

- p6df::modules::helm::kubernetes::dashboard::token()

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

Philip M . Gollucci <pgollucci@p6m7g8.com>
