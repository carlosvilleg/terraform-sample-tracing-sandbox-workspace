
variable "traceparent" {
	type = string
	default = null
	description = "Traceparent value for tracing the run"
}

output "traceparent" {
	description = "Traceparent value for tracing the run"
	value = var.traceparent
}
	
