ARG IMAGE_NAME="gnome-atomic"
ARG SOURCE_IMAGE="silverblue"
ARG SOURCE_SUFFIX="-main"
ARG SOURCE_TAG="latest"
ARG BASE_MAGE="ghcr.io/ublue-os/${SOURCE_IMAGE}${SOURCE_SUFFIX}:${SOURCE_TAG}"

FROM ghcr.io/ublue-os/${SOURCE_IMAGE}${SOURCE_SUFFIX}:${SOURCE_TAG} as ${IMAGE_NAME}
ARG IMAGE_NAME="${IMAGE_NAME}"
ARG FEDORA_MAJOR_VERSION="${FEDORA_MAJOR_VERSION:-latest}"


COPY build.sh \
    packages.sh \
    packages.json \
        /tmp/

RUN mkdir -p /var/lib/alternatives && \
    /tmp/build.sh && \
    ostree container commit
