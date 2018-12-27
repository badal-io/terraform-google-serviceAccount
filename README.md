# terraform-google-serviceAccount
A opinionated Terraform module that helps create Service Account and Manage IAM Permissions


Supports following:
- Provisioning a Service Account
- Setting IAM Permissions as a Resource usecase (for identity set IAM at Project Level)
- Ability to generate key (**Security Risk**: Understand risks and risk mitigation strategies before utilizing this feature)

## Prerequisite
This module uses docker to flatten IAM permissions passed down to module. Ensure that you have docker installed as it uses [terraform-flatten](https://hub.docker.com/r/muvaki/terraform-flatten) image to flatten the IAM Map. Information about the image can be found [here](https://github.com/muvaki/terraform-flatten)

## Usage
Example folder covers how to Provision service account and set permissions and also how to generate keys. Most basic config:

```hcl
module "serviceAccount" {
    source  = "github.com/muvaki/terraform-google-serviceAccount"

    name            = "muvaki-test-sa"

}
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| name | A unique name for the service account | string | - | yes|
| project | The project in which the resource belongs. If it is not provided, the provider project is used. | string. | "Provisioned by Terraform" | no |
| description | Service Account description | string | false | no|
| key | A Map that passes configuration for creating and retrieving SA keys | map | { enabled = "false" } | no|
| labels | A mapping of labels to assign to bucket. Bucket name under the key 'name' is automatically assigned. Pass a map of key/value to assign as labels to bucket | map | { name: 'bucket name' } | no|
| versioning_enabled | When set to true, versioning is fully enabled for this bucket. | string | false | no|
| iam |  authorative service account role binding. Grants permissions to other users to act as the SA | map | {} | no |
| module_dependency | Pass an output from another variable/module to create dependency | string | - | no |


### IAM Inputs

IAM input should be passed as roles (key) with list of members as a list value. Roles can be passed as either custom role names (project/project-id/roles/role-name) or standard predefined gcp roles (roles/role-name). Members list is allowed to only have the following prefixes: domain, serviceAccount, user or group.

```hcl
    iam = {
        "roles/iam.serviceAccountAdmin" = [
            "user:admin@muvaki.com",
            "serviceAccount:1111111111@cloudbuild.gserviceaccount.com"
        ],
        "project/muvaki/roles/superAdmin" = [
            "group:superadmins@muvaki.com"
        ]
```

### key Inputs

Pass a map key value if you need to generate a key. 

| Name | Description | Type | Default |
|------|-------------|:----:|:-----:|
| enabled | weather to generate a key for service account | string | "false" |
| key_algorithm | The algorithm used to generate the key. Valid values are listed at [ServiceAccountPrivateKeyType](https://cloud.google.com/iam/reference/rest/v1/projects.serviceAccounts.keys#ServiceAccountKeyAlgorithm) (only used on create) | string | "KEY_ALG_RSA_2048" |
| public_key_type | The output format of the public key requested. | string | "X509_PEM" |
| private_key_type | The output format of the private key | string | "TYPE_GOOGLE_CREDENTIALS_FILE" |
| pgp_key | An optional PGP key to encrypt the resulting private key material. Only used when creating or importing a new key pair. May either be a base64-encoded public key or a keybase:keybaseusername string for looking up in Vault. | string | "" |

**WARNING**: make sure you understand the risks and appropriate mitigation strategies when generating service account keys with terraform. Use of PGP encryption is highly recommended.


## Outputs

| Name | Description | 
|------|-------------|
| name | Service Account name |
| email | service account email address. |
| unique_id | The unique id of the service account. |
| key_name |  Service Account name used for key pair |
| public_key | The public key, base64 encoded. |
| private_key | The private key base 64 encoded and encrypted with the given pgp_key. |


## Docs:

module reference docs: 
- terraform.io (v0.11.11)
- GCP [Service Accounts](https://cloud.google.com/iam/docs/understanding-service-accounts)
- GCP [IAM](https://cloud.google.com/iam/)
- Muvaki [Terraform Flatten](https://github.com/muvaki/terraform-flatten)

### LICENSE

MIT License