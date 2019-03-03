FROM golang:alpine
LABEL maintainer="Gary A. Stafford <garystafford@rochester.rr.com>"
ENV REFRESHED_AT 2019-02-03
EXPOSE 8000

RUN apk update && apk upgrade && apk add git

WORKDIR /go/src/app
COPY main.go .
RUN cat main.go
RUN go get -d -v ./...
RUN go install -v ./...

CMD ["app"]
