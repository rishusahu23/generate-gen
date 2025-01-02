# Variables
GOPATH ?= $(shell go env GOPATH)
GO_PROTO_OUTPUT_ROOT ?= ${GOPATH}/src
PROTO_PATH = proto
GO_OUT_DIR = $(GO_PROTO_OUTPUT_ROOT)/

# Tools
PROTOC = protoc

# Commands
.PHONY: all generate clean

# Default target
all: generate

# Generate files dynamically with input
generate:
	$(PROTOC) -I=$(PROTO_PATH) \
		--go_out=$(GO_OUT_DIR) --go_opt=M$(PROTO_FILES)=gen/ \
		--go-grpc_out=$(GO_OUT_DIR) --go-grpc_opt=M$(PROTO_FILES)=gen/ \
		$(PROTO_FILES)

clean:
	rm -rf $(GO_OUT_DIR)
