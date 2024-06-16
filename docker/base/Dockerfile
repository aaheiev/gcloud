ARG GCLOUD_CLI_VERSION=480.0.0-slim

FROM gcr.io/google.com/cloudsdktool/google-cloud-cli:${GCLOUD_CLI_VERSION}

LABEL org.opencontainers.image.description="Google CLoud IaC container image"

ARG TERRAFORM_VERSION=1.8.0

ENV OS="linux"
ENV ARCH="amd64"

# Install terraform
RUN apt update \
    && apt install -y git-core wget unzip

# Download the required version of Terraform from the official website
RUN wget https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip \
    && unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip \
    && mv terraform /usr/local/bin/ \
    && terraform version
