# First stage: Build the application
FROM golang:1.17 AS builder
WORKDIR /go/src/app
COPY . .
RUN go get -d -v ./...
RUN go install -v ./...

# Second stage: Run the application
FROM gcr.io/distroless/base-debian10
COPY --from=builder /go/bin/app /usr/local/bin/app
ENTRYPOINT ["app"]
