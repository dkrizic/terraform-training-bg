resource "random_password" "my_password" {
  length = 16
  special = false
}

output "my_password" {
  value = random_password.my_password.result
  sensitive = true
}
