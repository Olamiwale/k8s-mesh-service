FROM golang:1.22-alpine AS builder

WORKDIR /app

COPY go.mod go.sum ./
RUN go mod download

COPY . .
RUN go build -o app .

FROM alpine:latest
WORKDIR /app
COPY --from=builder /app/app .
CMD ["./app"]


# FROM golang:1.22-alpine

# WORKDIR /app

# COPY main.go .

# RUN go build -o app main.go

# CMD ["./app"]
