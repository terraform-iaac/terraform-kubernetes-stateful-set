variable "name" {
  type        = string
  description = "(Required) Deployment name"
}
variable "namespace" {
  type        = string
  description = "(Required) K8S namespace where deploy app"
}
variable "image" {
  type        = string
  description = "(Required) Docker image for app"
}
variable "volume_claim" {
  type        = list(object({ name = string, namespace = string, access_modes = list(string), requests_storage = string, storage_class_name = string, persistent_volume_name = string }))
  description = "(Optional) Attach Persistant Volume Claim"
  default      = []
}
variable "volume_nfs" {
  type        = list(object({ path_on_nfs = string, nfs_endpoint = string, volume_name = string }))
  description = "(Optional) Attach NFS"
  default     = []
}
variable "volume_host_path" {
  description = "(Optional) Attach a file or directory from the host node’s filesystem"
  default     = []
}
variable "volume_config_map" {
  type        = list(object({ mode = string, name = string, volume_name = string }))
  description = "(Optional) The data stored in a ConfigMap object can be referenced in a volume of type configMap and then consumed by containerized applications running in a Pod"
  default     = []
}
variable "volume_empty_dir" {
  type    = list(object({ volume_name = string }))
  default = []
}
variable "volume_gce_disk" {
  description = "(Optional) Create volume from google disk to pod"
  default     = []
}
variable "volume_secret" {
  description = "(Optional) Create volume from secret"
  default     = []
}
variable "volume_aws_disk" {
  description = "(Optional) Create volume from aws disk to pod"
  default     = []
}
variable "volume_mount" {
  description = "(Optional) Mount path from pods to volume"
  default     = []
}
variable "env" {
  type        = list(object({ name = string, value = string }))
  description = "(Optional) Add environment variables to pods."
  default     = []
}
variable "env_field" {
  type        = list(object({ name = string, field_path = string }))
  description = "(Optional) Get field from k8s and add as environment variables to pods"
  default     = []
}
variable "env_secret" {
  description = "(Optional) Get secret keys from k8s and add as environment variables to pods"
  type        = list(object({ name = string, secret_name = string, secret_key = string }))
  default     = []
}
variable "hosts" {
  type        = list(object({ hostname = string, ip = string }))
  description = "(Optional) Add /etc/hosts records to pods"
  default     = []
}
variable "internal_port" {
  description = "(Optional) Expose port in pods"
  default     = []
}
variable "security_context" {
  description = "(Optional) Set startup user_id, when pods start"
  default     = []
}
variable "custom_labels" {
  description = "(Optional) Add custom label to pods"
  default     = null
}
variable "args" {
  type        = list(string)
  description = "(Optional) Arguments to the entrypoint."
  default     = []
}
variable "command" {
  description = " (Optional) Entrypoint array. Not executed within a shell. "
  default     = []
}
variable "service_account_token" {
  type        = bool
  description = "Indicates whether a service account token should be automatically mounted"
  default     = null
}
variable "service_account_name" {
  type        = string
  description = "(Optional) Is the name of the ServiceAccount to use to run this pod"
  default     = null
}
variable "image_pull_policy" {
  default     = "IfNotPresent" // Always, Never or empty
  description = "he default pull policy is IfNotPresent which causes the Kubelet to skip pulling an image if it already exists. If you would like to always force a pull, you can do one of the following"
}
variable "restart_policy" {
  type        = string
  description = "Restart policy for all containers within the pod. One of Always, OnFailure, Never"
  default     = "Always"
}
variable "replicas" {
  type        = number
  description = "(Optional) Count of pods"
  default     = 1
}
variable "resources" {
  description = "(Optional) Limit resources by cpu or memory for pods"
  default     = {}
}
variable "pod_management_policy" {
  type        = string
  description = "(Optional) podManagementPolicy controls how pods are created during initial scale up, when replacing pods on nodes, or when scaling down"
  default     = null
}
variable "revision_history_limit" {
  type        = number
  description = "(Optional) The maximum number of revisions that will be maintained in the StatefulSet's revision history"
  default     = null
}
variable "update_strategy_type" {
  type        = string
  description = "(Optional) Indicates the type of the StatefulSetUpdateStrategy. There are two valid update strategies, RollingUpdate and OnDelete"
  default     = "RollingUpdate"
}
variable "update_strategy_partition" {
  type        = string
  description = "(Optional) Indicates the ordinal at which the StatefulSet should be partitioned. You can perform a phased roll out (e.g. a linear, geometric, or exponential roll out) using a partitioned rolling update in a similar manner to how you rolled out a canary. To perform a phased roll out, set the partition to the ordinal at which you want the controller to pause the update. By setting the partition to 0, you allow the StatefulSet controller to continue the update process"
  default     = "0"
}
variable "node_selector" {
  description = "(Optional) Specify node selector for pod"
  type        = map(string)
  default     = null
}
variable "tty" {
  default = "true"
}
variable "liveness_probe" {
  description = "(Optional) Periodic probe of container liveness. Container will be restarted if the probe fails. Cannot be updated. "
  default     = []
}
variable "readiness_probe" {
  description = "(Optional) Periodic probe of container service readiness. Container will be removed from service endpoints if the probe fails. Cannot be updated. "
  default     = []
}
variable "lifecycle_events" {
  description = "(Optional) Actions that the management system should take in response to container lifecycle events"
  default     = []
}
variable "termination_grace_period_seconds" {
  description = "(Optional) ptional duration in seconds the pod needs to terminate gracefully"
  default     = null
}