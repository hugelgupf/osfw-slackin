#!/bin/bash

export SLACK_API_TOKEN=$(gcloud secrets versions access latest --secret=osfw-slack-api-token)
export RECAPTCHA_SECRET=$(gcloud secrets versions access latest --secret=osfw-slack-recaptcha-secret)

./bin/slackin
