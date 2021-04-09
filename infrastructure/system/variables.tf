variable "user" {
  description = "The primary system user"
  type        = string
}

variable "cores" {
  description = "The number of cores / threads to use for multithreading tasks like makepkg"
  type        = number
}
