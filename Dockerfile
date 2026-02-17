FROM debian:stable-slim

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        texlive-full \
        latexmk \
        fonts-dejavu \
        ghostscript \
        make \
        ca-certificates && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

WORKDIR /data

CMD ["latexmk", "-pdf", "-interaction=nonstopmode", "-halt-on-error", "cv.tex"]
