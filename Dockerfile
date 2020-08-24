FROM emedvedev/slackin-extended:latest

RUN apk add --update python curl which bash

RUN curl -sSL https://sdk.cloud.google.com | bash
ENV PATH $PATH:/root/google-cloud-sdk/bin

ENV SLACK_SUBDOMAIN osfw
ENV SLACKIN_PORT 8080
ENV RECAPTCHA_SITEKEY 6Le43jcUAAAAAK2967S1HzizSeNCHpI_VEzOb72p

COPY start-slackin.sh .
CMD ./start-slackin.sh
