sqs terraform module
===========

A terraform module to provide Simple Queue Service (SQS) in AWS.

Module Input Variables
----------------------

- `name` - vpc name
- `delay_seconds` - vpc cidr
- `max_message_size` - list of public subnet cidrs
- `visibility_timeout_seconds` - The visibility timeout for the queue
- `message_retention_seconds` - The number of seconds Amazon SQS retains a message
- `receive_wait_time_seconds` - The time for which a ReceiveMessage call will wait for a message to arrive (long polling) before returning
- `redrive_policy` - JSON policy to set up the Dead Letter Queue
- `policy` - JSON policy for the SQS queue

Usage
-----

```hcl
module "sqs" {
  source = "github.com/terraform-community-modules/tf_aws_sqs"

  name                       = "my-sqs"
  
  delay_seconds              = "20"
  max_message_size           = "262144"
  visibility_timeout_seconds = "43200"
  message_retention_seconds  = "1209600"
  receive_wait_time_seconds  = "0"
  
  redrive_policy             = "{\"deadLetterTargetArn\":\"${aws_sqs_queue.terraform_queue_deadletter.arn}\",\"maxReceiveCount\":4}"
  policy                     = <<POLICY
{
  "Version": "2012-10-17",
  "Id": "sqspolicy",
  "Statement": [
    {
      "Sid": "First",
      "Effect": "Allow",
      "Principal": "*",
      "Action": "sqs:SendMessage",
      "Resource": "${aws_sqs_queue.my-sqs.arn}",
      "Condition": {
        "ArnEquals": {
          "aws:SourceArn": "${aws_sqs_queue.my-sqs.arn}"
        }
      }
    }
  ]
}
POLICY
}
```

Outputs
=======

 - `url` - URL of the SQS endpoint
 - `arn` - ARN or the SQS instance

Authors
=======

Created and maintained by [Kevin Duane](https://github.com/crackmac)

License
=======

Apache 2 Licensed. See LICENSE for full details.
