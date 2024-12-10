# gcp-py-cloud-function

This project demonstrates how to create, deploy, and test a simple Google Cloud Function using Python. The function responds to HTTP requests and returns a JSON message.

## Prerequisites

1. A Google Cloud account with billing enabled.
2. Python 3.10 or later installed locally.
3. `gcloud` CLI installed and initialized:
   - Follow the [GCloud CLI Installation Guide](https://cloud.google.com/sdk/docs/install).

---

## Setup Instructions

### Step 1: Clone This Repository
```bash
git clone git@github.com:amaziahub/gcp-py-cloud-function.git
cd gcp-py-cloud-function
```

### Step 2: Create a Google Cloud Project
- Go to the [Google Cloud Console](https://console.cloud.google.com/)
- Create a new project
- Note the project ID for later use

---

## Deploying the Function

### Step 3: Initialize `gcloud` CLI
1. Set your project ID:
   ```bash
   gcloud config set project YOUR_PROJECT_ID
   ```

2. Enable necessary APIs:
   ```bash
   gcloud services enable cloudfunctions.googleapis.com
   gcloud services enable cloudbuild.googleapis.com
   ```

---

### Step 4: Deploy the Cloud Function
Run the following command to deploy the function:
```bash
gcloud functions deploy helloWorld \
    --runtime python310 \
    --trigger-http \
    --allow-unauthenticated \
    --entry-point hello_world
```
---

## Testing the Function
### Step 5: Get the Function URL
Retrieve the function URL:
```bash
gcloud functions describe helloWorld --format='value(httpsTrigger.url)'
```

### Step 6: Test the Function
Use `curl` to test the function:
```bash
curl -X POST \
    -H "Content-Type: application/json" \
    -d '{"name": "Amazia"}' \
    FUNCTION_URL
```
Replace `FUNCTION_URL` with the URL retrieved in the previous step.

---

## Logs and Debugging
### View Logs
```bash
gcloud functions logs read helloWorld
```
---

## Cleanup
### Delete the Function
To avoid incurring costs, delete the deployed function:
```bash
gcloud functions delete helloWorld
```

---

Happy Coding! 🚀
```yaml

---

### How to Use It
Replace `your-username/your-repo-name` with your GitHub repository’s actual details. This README provides all the necessary steps to recreate, deploy, and test your Cloud Function, along with a structured overview of the project. Let me know if you need further customization!

```


