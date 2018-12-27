module "serviceAccount" {
    source  = "github.com/muvaki/terraform-google-serviceAccount"

    name            = "muvaki-test-serviceAccount"
    description     = "Muvaki Test Service Account"

    iam = {
        "roles/storage.objectAdmin" = [
            "user:admin@muvaki.com",
            "serviceAccount:1111111111@cloudbuild.gserviceaccount.com"
        ],
        "project/muvaki/roles/superAdmin" = [
            "group:superadmins@muvaki.com"
        ]
    }
    
    module_dependency       = "${module.vpc.name}"
}