FROM golang:1.20-bullseye

WORKDIR /workspace

RUN apt-get update && apt-get -y install jq neovim \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN go install golang.org/x/tools/cmd/goimports@latest \
    && go install -v golang.org/x/tools/gopls@latest
