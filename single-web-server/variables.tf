variable "AWS_REGION" {
  default = "eu-west-2"
}

variable "AMIS" {
  type = map(string)
  default = {
    "eu-west-2" = "ami-0dd555eb7eb3b7c82"
  }
}

variable "server_port" {
  description = "Port used by the HTTP requests"
  type        = number
  default     = 8080
}

