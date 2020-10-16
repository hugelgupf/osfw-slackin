FROM golang:latest
WORKDIR /root
COPY getcreds.go .
COPY go.mod .
COPY go.sum .
RUN CGO_ENABLED=0 go build -o getcreds .

FROM emedvedev/slackin-extended:latest

#RUN apk add --update python curl which bash
#RUN curl -sSL https://sdk.cloud.google.com | bash
#ENV PATH $PATH:/root/google-cloud-sdk/bin

WORKDIR /srv/www

COPY --from=0 /root/getcreds .

ENV SLACK_SUBDOMAIN osfw
ENV SLACKIN_PORT 8080
ENV RECAPTCHA_SITEKEY 6Le43jcUAAAAAK2967S1HzizSeNCHpI_VEzOb72p

COPY start-slackin.sh .
CMD ./start-slackin.sh
