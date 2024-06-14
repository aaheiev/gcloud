variable "main_dns_zone_name" {
  type = string
}

variable "name" {
  type = string
}

variable "description" {
  type = string
}

variable "labels" {
  type = object({})
}

variable "ns_ttl" {
  type = number
  default = 3600
}
