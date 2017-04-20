resource "aws_sqs_queue" "q" {
  name                      = "${var.name}"
  
  delay_seconds             = "${var.delay_seconds}"
  max_message_size          = "${var.max_message_size}"
  
  redrive_policy            = "${var.redrive_policy}"
  policy                    = "${var.policy}"
}