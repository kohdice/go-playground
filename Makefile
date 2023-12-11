BIN := go-playground
.DEFAULT_GOAL:=all

.PHONY: all
all: fmt golangci-lint go.mod test build

.PHONY: fmt
fmt:
	@ go fmt ./...

# .PHONY: lint
# lint: fmt
# 	@ staticcheck
#
# .PHONY: vet
# vet: fmt
# 	@ go vet ./...

.PHONY: golangci-lint
golangci-lint:
	@ golangci-lint run ./...

.PHONY: go.mod
go.mod:
	@ go mod tidy
	@ go mod verify


.PHONY: test
test:
	@ go test -v ./...

.PHONY: build
build:
	@ go build -trimpath -o $(BIN)
