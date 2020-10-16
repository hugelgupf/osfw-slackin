#!/bin/sh

export SLACK_API_TOKEN=$(./getcreds --gcp-project=osfw-slack-signup --secret=osfw-slack-api-token)
export RECAPTCHA_SECRET=$(./getcreds --gcp-project=osfw-slack-signup --secret=osfw-slack-recaptcha-secret)

./bin/slackin
