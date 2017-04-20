variable "name" {}

variable "delay_seconds" {
  description = "The time in seconds that the delivery of all messages in the queue will be delayed."
  default = "0"
}

variable "max_message_size" {
  description = "The time in seconds that the delivery of all messages in the queue will be delayed."
  default = "262144"
}

variable "redrive_policy" {
  description = "The JSON policy to set up the Dead Letter Queue"
  default = ""
}

variable "policy" {
  description = "The JSON policy for the SQS queue"
  default = ""
}