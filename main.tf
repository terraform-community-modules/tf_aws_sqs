resource "aws_sqs_queue" "q" {
  name = "${var.name}"

  delay_seconds              = "${var.delay_seconds}"
  max_message_size           = "${var.max_message_size}"
  visibility_timeout_seconds = "${var.visibility_timeout_seconds}"
  message_retention_seconds  = "${var.message_retention_seconds}"
  receive_wait_time_seconds  = "${var.receive_wait_time_seconds}"

  redrive_policy = "${var.redrive_policy}"
  policy         = "${var.policy}"
}
