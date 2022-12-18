# AWS CLI v2 built on Alpine

This repository contains the Dockerfile for building an AWS CLI v2 image based on Alpine.
Unfortunately this process is very slow, so we we separated this into its own repository. Other Alpine-based images can now simply pull in this binaries like so:

```dockerfile
COPY --from=ghcr.io/spacelift-io/awscliv2:2.9.8 /usr/local/aws-cli/ /usr/local/aws-cli/
COPY --from=ghcr.io/spacelift-io/awscliv2:2.9.8 /aws-cli-bin/ /usr/local/bin/
```

The newest releases can be found in the [Releases](https://github.com/spacelift-io/aws-cli-alpine/releases) section.

## Schedule & builds

The release process is automated and the image is published to GitHub Container Registry.

We check for the latest AWS CLI version in `tag_latest_version.yml` workflow periodically.
If a new version is found, we create a tag and `publish.yml` picks it up, builds it and published it to GitHub Container Registry.
