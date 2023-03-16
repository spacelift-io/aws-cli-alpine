# AWS CLI v2 built on Alpine

[![Publish 🚀](https://github.com/spacelift-io/aws-cli-alpine/actions/workflows/publish.yml/badge.svg)](https://github.com/spacelift-io/aws-cli-alpine/actions/workflows/publish.yml)

---

This repository contains the [Dockerfile](./Dockerfile) for building an [AWS CLI](https://github.com/aws/aws-cli) v2 image based on [Alpine](https://hub.docker.com/_/alpine).

As of December 2022, this process is extremely slow (building on ARM architecture takes around an hour), that's why we separated this process into its own repository.

Other Alpine-based images can now simply pull pre-built the binaries like so:

```dockerfile
COPY --from=ghcr.io/spacelift-io/aws-cli-alpine /usr/local/aws-cli/ /usr/local/aws-cli/
COPY --from=ghcr.io/spacelift-io/aws-cli-alpine /aws-cli-bin/ /usr/local/bin/
```

The newest releases can be found in the [Releases](https://github.com/spacelift-io/aws-cli-alpine/releases) section.

## Schedule & builds 📅

We check for the latest AWS CLI version in `publish.yml` workflow periodically.
If a new version is found, we create a tag, then build and publish it to GitHub Container Registry.
