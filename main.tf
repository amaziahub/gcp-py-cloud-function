# Specify the provider
provider "google" {
  project = "sparrow-444313"   # Replace with your GCP project ID
  region  = "us-central1"       # Replace with your desired region
}

# Google Cloud Function Deployment
resource "google_cloudfunctions_function" "hello_world" {
  name        = "helloWorld"
  description = "A simple Hello World Cloud Function"
  runtime     = "python310"
  region      = "us-central1" # Match the region from the provider

  # Entry point of the function
  entry_point = "hello_world"

  # The source code archive (will be uploaded)
  source_archive_bucket = google_storage_bucket.function_bucket.name
  source_archive_object = google_storage_bucket_object.function_code.name

  # Trigger on HTTP requests
  trigger_http = true

  # Allow unauthenticated access
  available_memory_mb = 256
  # Removed the environment variable for PORT since it is reserved by the system
}

# Allow unauthenticated access to the function by adding an IAM policy binding
resource "google_cloudfunctions_function_iam_member" "allow_unauthenticated" {
  project        = google_cloudfunctions_function.hello_world.project
  region         = google_cloudfunctions_function.hello_world.region
  cloud_function = google_cloudfunctions_function.hello_world.name
  role           = "roles/cloudfunctions.invoker"
  member         = "allUsers"
}

# Storage bucket for function source code
resource "google_storage_bucket" "function_bucket" {
  name          = "gcf-source-bucket-${random_id.bucket_id.hex}"
  location      = "US"
  force_destroy = true
}

# Upload source code to the bucket
resource "google_storage_bucket_object" "function_code" {
  name   = "function-source.zip"
  bucket = google_storage_bucket.function_bucket.name
  source = "function-source.zip" # Replace with your zipped source code file
}

# Random ID for unique bucket name
resource "random_id" "bucket_id" {
  byte_length = 4
}
