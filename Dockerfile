FROM alpine:latest

ARG TARGETARCH
ARG YQ_VERSION="v4.24.5"
ARG KUSTOMIZE_VERSION="4.5.4"
ARG KUBECONFORM_VERSION="0.4.13"

RUN apk add curl tar gzip

RUN curl -sL https://github.com/mikefarah/yq/releases/download/${YQ_VERSION}/yq_linux_${TARGETARCH} -o /usr/local/bin/yq && \
    chmod +x /usr/local/bin/yq

RUN curl -sL https://github.com/kubernetes-sigs/kustomize/releases/download/kustomize%2Fv${KUSTOMIZE_VERSION}/kustomize_v${KUSTOMIZE_VERSION}_linux_${TARGETARCH}.tar.gz | \
    tar xz -C /usr/local/bin &&  chmod +x /usr/local/bin/kustomize

RUN curl -sL https://github.com/yannh/kubeconform/releases/download/v${KUBECONFORM_VERSION}/kubeconform-linux-${TARGETARCH}.tar.gz | \
    tar xz -C /usr/local/bin && chmod +x /usr/local/bin/kubeconform
