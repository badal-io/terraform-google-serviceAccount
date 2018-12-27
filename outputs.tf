output "email" {
  value       = "${google_service_account.default.email}"
  description = "service account email address"
}

output "name" {
  value       = "${google_service_account.default.name}"
  description =  "Service Account name"
}

output "unique_id" {
  value       = "${google_service_account.default.unique_id}"
  description =  "The unique id of the service account."
}

# SA Key Export
output "key_name" {
  value       = "${google_service_account_key.default.*.name}"
  description =  "Service Account name used for key pair"
}

output "public_key" {
  value       = "${google_service_account_key.default.*.public_key}"
  description =  "The public key, base64 encoded"
}

output "private_key" {
  value       = "${google_service_account_key.default.*.private_key_encrypted}"
  description =  "The private key base 64 encoded and encrypted with the given pgp_key."
}