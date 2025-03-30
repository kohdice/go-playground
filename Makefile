BIN := ./bin/playground
ifeq ($(OS),Windows_NT)
BIN := $(BIN).exe
endif
CURRENT_REVISION := $(shell git rev-parse --short HEAD)
BUILD_LDFLAGS := "-s -w -X main.revision=$(CURRENT_REVISION)"

.PHONY: all
all: clean tidy build

.PHONY: build
build:
	go build -trimpath -ldflags=$(BUILD_LDFLAGS) -o $(BIN) .

.PHONY: install
install:
	go install -ldflags=$(BUILD_LDFLAGS) .

.PHONY: clean
clean:
	go clean

.PHONY: fmt
fmt:
	golangci-lint fmt

.PHONY: lint
lint:
	golangci-lint run

.PHONY: test
test:
	go test -v -cover ./...

.PHONY: coverage
coverage:
	go test -v -coverprofile=coverage.out -covermode=atomic ./...
	go tool cover -html=coverage.out -o coverage.html

.PHONY: tidy
tidy:
	go mod tidy
