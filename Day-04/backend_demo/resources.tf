# A tiny, cost-free resource whose only job is to prove remote state works.
# After `apply`, check your S3 bucket — the state file will be there, and a
# short-lived `.tflock` object appears while the operation is running.

resource "random_pet" "terraform_pet0" {
  length    = 3
  separator = "-"
}

output "terraform_pet0_id" {
  description = "Proof that state is now stored remotely in S3."
  value       = random_pet.terraform_pet0.id
}