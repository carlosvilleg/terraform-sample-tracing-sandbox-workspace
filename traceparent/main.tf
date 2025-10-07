
variable "TFC_CONFIGURATION_VERSION_GIT_COMMIT_SHA" {
    type = string
    default = null
}

variable "TFC_RUN_ID" {
    type = string
    default = null
}

variable "traceparent" {
	type = string
	default = null
	description = "Traceparent value for tracing the run"
}


locals {
 correlation_id = (
   trimspace(coalesce(var.traceparent,
     var.TFC_CONFIGURATION_VERSION_GIT_COMMIT_SHA,
     var.TFC_RUN_ID,
     timestamp(),
   "RUN_ID should never be null"))
 )
}

output "traceparent" {
 description = "Traceparent value for tracing the run"
 value = (
   can(regex("^00-[0-9a-f]{32}-[0-9a-f]{16}-[0-9a-f]{2}$", local.correlation_id))
   ? local.correlation_id                        # Use as-is if already in trace parent format
   : "00-${substr(sha256(local.correlation_id), 0, 32)}-${substr(sha256(local.correlation_id), 0, 16)}-00" # Otherwise, construct from its hash
 )
}


