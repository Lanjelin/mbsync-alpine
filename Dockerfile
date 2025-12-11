FROM alpine:3.23

ARG ISYNC_PKG_VERSION=""
ARG VERSION=""
ARG REVISION=""
ARG CREATED=""
ARG SOURCE=""

LABEL org.opencontainers.image.title="mbsync-alpine"
LABEL org.opencontainers.image.description="Lightweight Alpine-based mbsync container that auto-tracks Alpine's isync package."
LABEL org.opencontainers.image.source="${SOURCE}"
LABEL org.opencontainers.image.version="${VERSION}"
LABEL org.opencontainers.image.revision="${REVISION}"
LABEL org.opencontainers.image.created="${CREATED}"
LABEL org.opencontainers.image.licenses="GPL-3.0-or-later"

RUN set -e \
  && if [ -n "$ISYNC_PKG_VERSION" ]; then \
  echo "Installing isync version $ISYNC_PKG_VERSION from Alpine repo..."; \
  apk add --no-cache "isync=${ISYNC_PKG_VERSION}" ca-certificates; \
  else \
  apk add --no-cache isync ca-certificates; \
  fi

VOLUME ["/config", "/mail"]

ENTRYPOINT ["mbsync"]
CMD ["-c", "/config/mbsyncrc", "-a"]

