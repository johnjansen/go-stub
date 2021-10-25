# configure directories
mkdir cmd internal pkg vendor api web configs init build deployments test docs tools examples third_party githooks assets website

# prep the go project
go mod init $1
go mod tidy

# go get github.com/getsentry/sentry-go
# go get gopkg.in/DataDog/dd-trace-go.v1/ddtrace/tracer
# go get gorm.io/gorm
# go get gorm.io/driver/postgres
# go get github.com/elastic/go-elasticsearch/v7

# ensure protoc is installed

# add the go deps to the compiler

# stub in a proto3 for grpc
# echo "" > api/first.proto

# make a sample client
# mkdir examples/client
