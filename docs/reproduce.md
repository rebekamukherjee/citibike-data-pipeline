# Reproduce

## Create New GCP Project

Navigate to [Google Cloud Platform](https://console.cloud.google.com/) and create a new project by clicking on the dropdown button next to the current project name, and then clicking on **NEW PROJECT**.

![](res/gcp-new-project.png)

Make sure that that new project is selected from the dropdown.

![](res/gcp-new-project-selected.png)

## Create Service Account

To setup a Service Account, navigate to **IAM & Admin** > **Service Accounts** from the left hamburger menu. Then click on the **CREATE SERVICE ACCOUNT** button at the top of the screen. Create a service account called `citibike`. Then add the following roles to grant this service account access to project and then click **Done**:
- BigQuery Admin
- Storage Admin

Next, click on the ellipse next to the newly created service account, and select **Manage keys**. Click on **ADD KEY** > **Create new key** > select **JSON** key type > **CREATE**. A key will be downloaded to our machine. Save the key in the project directory under the sub-directory `code/keys` and in a file called `creds.json`.

> Make sure the subfolder `keys/` is added to `.gitignore`

## Setup Infrastructure with Terraform

### Get the Terraform provider for GCP

Terraform client installation: https://www.terraform.io/downloads

1. Download Terraform.
2. From the download, extract the executable to a directory of your choosing (for example, c:\terraform).
3. Update your system's global path to the executable.
4. Open a terminal window.
5. Verify the global path configuration with the terraform command `terraform -version`

Install the **HashiCorp Terraform** extension in VSCode.

### Run Terraform Code

Make the following changes in the file `code\terraform\variables.tf`:
- Change the **project name** to match your GCP project name
- Change the **Google Cloud Storage bucket name**. It must be a unique value
- (optional) Change the **Big Query dataset name**
- (optional) Change the **region** and **location** depending on where you are located

Navigate to the code location by running the following command in command prompt: `cd code\terraform`.
- Run `terraform init`
- Run `terraform plan`
- Run `terraform apply`
    - When it asks to **"Enter a value:"** to continue, enter `yes`

Check GCP if the resources were created.

## Load data to Google Cloud Storage with Mage.ai

TODO: Load from API (zip)
TODO: Unzip
TODO: Column type conversions
TODO: csv -> pq using pyarrow
TODO: Load into GCS

## Data Warehousing in BigQuery

TODO: create external table
TODO: save parition and cluster table

## Transformation with dbt

TODO: transform
TODO: document
TODO: save back to Big Query

## Visualize with Looker Studio

TODO: 2 slides to visualize the data