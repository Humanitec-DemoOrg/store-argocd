FROM alpine:latest

ENV TERRAFORM_VERSION=1.0.11
ENV TERRAFORM_PROVIDER_GOOGLE=4.2.0
ENV TERRAFORM_PROVIDER_CLOUDFLARE=3.4.0

RUN apk fix && \
    apk add --update bash git git-lfs less openssh curl openssl && \
    git lfs install && \
    rm -rf /var/lib/apt/lists/* && \
    rm /var/cache/apk/*

ADD https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip ./

RUN unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip -d /usr/bin
RUN rm -f terraform_${TERRAFORM_VERSION}_linux_amd64.zip

RUN ["addgroup", "-S", "argocd"]
RUN ["adduser", "-S", "-D", "-h", "/home/argocd", "-G", "argocd", "argocd"]

ADD https://releases.hashicorp.com/terraform-provider-google/${TERRAFORM_PROVIDER_GOOGLE}/terraform-provider-google_${TERRAFORM_PROVIDER_GOOGLE}_linux_amd64.zip ./
RUN mkdir -p /home/argocd/terraform.d/plugins/registry.terraform.io/hashicorp/google/${TERRAFORM_PROVIDER_GOOGLE}/linux_amd64
RUN unzip terraform-provider-google_${TERRAFORM_PROVIDER_GOOGLE}_linux_amd64.zip -d /home/argocd/terraform.d/plugins/registry.terraform.io/hashicorp/google/${TERRAFORM_PROVIDER_GOOGLE}/linux_amd64
RUN rm -f terraform-provider-google_${TERRAFORM_PROVIDER_GOOGLE}_linux_amd64.zip

ADD https://releases.hashicorp.com/terraform-provider-cloudflare/${TERRAFORM_PROVIDER_CLOUDFLARE}/terraform-provider-cloudflare_${TERRAFORM_PROVIDER_CLOUDFLARE}_linux_amd64.zip ./
RUN mkdir -p /home/argocd/terraform.d/plugins/registry.terraform.io/hashicorp/cloudflare/${TERRAFORM_PROVIDER_CLOUDFLARE}/linux_amd64
RUN unzip terraform-provider-cloudflare_${TERRAFORM_PROVIDER_CLOUDFLARE}_linux_amd64.zip -d /home/argocd/terraform.d/plugins/registry.terraform.io/hashicorp/cloudflare/${TERRAFORM_PROVIDER_CLOUDFLARE}/linux_amd64
RUN rm -f terraform-provider-cloudflare_${TERRAFORM_PROVIDER_CLOUDFLARE}_linux_amd64.zip

RUN chown argocd:argocd -R /home/argocd
RUN chmod +x -R /home/argocd/terraform.d/plugins/
USER argocd
WORKDIR /home/argocd/
ENTRYPOINT ["/bin/sh","-c"]