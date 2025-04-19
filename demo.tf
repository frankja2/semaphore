terraform {
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "~> 2.0"
    }
  }
}

provider "local" {}

# Define a local file
resource "local_file" "example" {
  filename = "${path.module}/example.txt"
  content  = <<EOT
This is an example file created by Terraform.
You can customize its content.
EOT
}

# Output the file path
output "file_path" {
  value = local_file.example.filename
}




