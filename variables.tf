variable "name" {}

variable "delay_seconds" {
  description = "The time in seconds that the delivery of all messages in the queue will be delayed."
  default = "0"
}

variable "max_message_size" {
  description = "The time in seconds that the delivery of all messages in the queue will be delayed."
  default = "262144"
}

variable "visibility_timeout_seconds" {
  description = "The visibility timeout for the queue."
  default = 43200
}

variable "message_retention_seconds" {
  description = "The number of seconds Amazon SQS retains a message."
  default = 1209600
}

variable "receive_wait_time_seconds" {
  description = "The time for which a ReceiveMessage call will wait for a message to arrive (long polling) before returning."
  default = 0
}

variable "redrive_policy" {
  description = "The JSON policy to set up the Dead Letter Queue"
  default = ""
}

variable "policy" {
  description = "The JSON policy for the SQS queue"
  default = ""
}
