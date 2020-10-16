package main

import (
	"context"
	"flag"
	"fmt"
	"log"

	secretmanager "cloud.google.com/go/secretmanager/apiv1"
	smpb "google.golang.org/genproto/googleapis/cloud/secretmanager/v1"
)

var (
	projectName = flag.String("gcp-project", "", "GCP project name")
	secretName  = flag.String("secret", "", "Secret Manager secret name")
	version     = flag.String("version", "latest", "Version")
)

func main() {
	flag.Parse()

	ctx := context.Background()
	client, err := secretmanager.NewClient(ctx)
	if err != nil {
		log.Fatal(err)
	}

	req := &smpb.AccessSecretVersionRequest{
		Name: fmt.Sprintf("projects/%s/secrets/%s/versions/%s", *projectName, *secretName, *version),
	}
	secret, err := client.AccessSecretVersion(ctx, req)
	if err != nil {
		log.Fatal(err)
	}

	fmt.Printf("%s", string(secret.Payload.Data))
}
