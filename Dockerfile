ARG ALPINE_VERSION

FROM python:3.11-alpine${ALPINE_VERSION} AS builder

ARG AWS_CLI_VERSION

RUN apk add --no-cache git \
        unzip \
        groff \
        build-base \
        libffi-dev \
        cmake

RUN mkdir /aws && \
    git clone --single-branch --depth 1 -b ${AWS_CLI_VERSION} https://github.com/aws/aws-cli.git /aws && \
    cd /aws && \
    python -m venv venv && \
    . venv/bin/activate && \
    pip install setuptools && \
    ./scripts/installers/make-exe

RUN unzip /aws/dist/awscli-exe.zip && \
    ./aws/install --bin-dir /aws-cli-bin

# Reduce image size: remove autocomplete and examples
RUN rm -rf \
    /usr/local/aws-cli/v2/current/dist/aws_completer \
    /usr/local/aws-cli/v2/current/dist/awscli/data/ac.index \
    /usr/local/aws-cli/v2/current/dist/awscli/examples && \
    find /usr/local/aws-cli/v2/current/dist/awscli/data -name completions-1*.json -delete && \
    find /usr/local/aws-cli/v2/current/dist/awscli/botocore/data -name examples-1.json -delete

FROM alpine:${ALPINE_VERSION}

COPY --from=builder /usr/local/aws-cli /usr/local/aws-cli
COPY --from=builder /aws-cli-bin /aws-cli-bin

RUN /aws-cli-bin/aws --version

CMD ["/bin/sh"]