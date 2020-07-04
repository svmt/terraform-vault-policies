variable "organization" {
  description = "github organisation"
}

variable "token_period" {
  description = "Token expiration time"
  default     = 28800 # 8h
}

variable "teams" {
  type        = map(string)
  description = "Maps github team name to vault policy"
  default     = {
    admins     = "admin"
    developers = "dev"
    operations = "ops"
  }
}
