# cloudruntest

Simple Cloud Run test repository.

## Build and deploy a simple Docker image

This repo now includes a minimal static web app in `simple-app/` and a Cloud Build pipeline that builds a container image and deploys it to Cloud Run.

### Prerequisites

- Google Cloud SDK (`gcloud`) installed and authenticated
- A GCP project with Cloud Build, Cloud Run, and Artifact Registry APIs enabled

### Deploy command

```bash
./deploy_simple.sh <PROJECT_ID> [REGION] [SERVICE_NAME]
```

Example:

```bash
./deploy_simple.sh my-project us-central1 simple-app
```

This runs `simple-app/cloudbuild.yaml`, which:

1. Builds image `us-docker.pkg.dev/$PROJECT_ID/cloud-run-source-deploy/simple-app:$COMMIT_SHA`
2. Pushes the image to Artifact Registry
3. Deploys the image to Cloud Run
