
module "traceparent" {
	source = "./traceparent"

	traceparent = var.traceparent
}

data "external" "example" {
  program = ["bash", "${path.module}/example-data-source.sh"]

  query = {
    traceparent = module.traceparent.traceparent
  }
}

output "traceparent" {
  value = data.external.example.result.traceparent
  description = "Traceparent all the way through"
}

