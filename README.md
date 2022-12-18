# AWS CLI v2 built on Alpine

This repository contains the Dockerfile for building an AWS CLI v2 image based on Alpine.
Unfortunately this process is very slow, so we we separated this into its own repository. Other Alpine-based images can now simply pull in this binaries like so:

```dockerfile
COPY --from=ghcr.io/spacelift-io/awscliv2:2.9.8 /usr/local/aws-cli/ /usr/local/aws-cli/
COPY --from=ghcr.io/spacelift-io/awscliv2:2.9.8 /aws-cli-bin/ /usr/local/bin/
```

To bump the version, simply update the `AWS_CLI_VERSION` in `build.yml` and `publish.yml`.
