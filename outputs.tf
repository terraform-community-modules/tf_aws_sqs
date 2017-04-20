output "url" {
  value                     = "${aws_sqs_queue.q.id}"
}

output "arn" {
  value                     = "${aws_sqs_queue.q.arn}"
}
