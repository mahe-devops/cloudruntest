# Build Stage
FROM golang:1.13 as builder
WORKDIR /app
# Copy Go source files and HTML from the blue folder
COPY amazingapp/blue/ .

# Build the Go application
RUN CGO_ENABLED=0 GOOS=linux go build -o server main.go

# Final Stage
FROM alpine:3
RUN apk add --no-cache ca-certificates
# Copy the built server and any other necessary files to the final container
COPY --from=builder /app/server /
COPY --from=builder /app/homepage.html /

# Run the server executable
CMD ["/server"]
