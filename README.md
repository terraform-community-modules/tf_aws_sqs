sqs terraform module
===========

A terraform module to provide Simple Queue Service (SQS) in AWS.

Module Input Variables
----------------------

- `name` - vpc name
- `delay_seconds` - vpc cidr
- `max_message_size` - list of public subnet cidrs
- `redrive_policy` - JSON policy to set up the Dead Letter Queue
- `policy` - JSON policy for the SQS queue

Usage
-----

```hcl
module "sqs" {
  source = "github.com/terraform-community-modules/tf_aws_sqs"

  name              = "my-sqs"
  
  delay_seconds     = "20"
  max_message_size  = "262144"
  
  redrive_policy    = "{\"deadLetterTargetArn\":\"${aws_sqs_queue.terraform_queue_deadletter.arn}\",\"maxReceiveCount\":4}"
  policy            = <<POLICY
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
