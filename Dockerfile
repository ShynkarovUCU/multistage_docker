# Stage 1: creating a text file and writing text to it
FROM alpine AS builder

WORKDIR /build

RUN echo "Hello, World!" > message.txt


# Stage 2: copying the text file from the builder stage and print the text
FROM alpine

WORKDIR /app

COPY --from=builder /build/message.txt .

CMD cat message.txt





