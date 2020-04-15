variable "name" {
  description = "(Required) Deployment name"
}
variable "namespace" {
  description = "(Required) K8S namespace where deploy app"
}
variable "image" {
  description = "(Required) Docker image for app"
}
variable "volume_nfs" {
  description = "(Optional) Attach NFS"
  default = []
}
variable "volume_host_path" {
  description = "(Optional) Attach a file or directory from the host node’s filesystem"
  default = []
}
variable "volume_config_map" {
  description = "(Optional) The data stored in a ConfigMap object can be referenced in a volume of type configMap and then consumed by containerized applications running in a Pod"
  default = []
}
variable "volume_gce_disk" {
  description = "(Optional) Create volume from google disk to pod"
  default = []
}
variable "volume_mount" {
  description = "(Optional) Mount path from pods to volume"
  default = []
}
variable "env" {
  description = "(Optional) Add environment variables to pods."
  default = []
}
variable "env_field" {
  description = "(Optional) Get field from k8s and add as environment variables to pods"
  default = []
}
variable "hosts" {
  description = "(Optional) Add /etc/hosts records to pods"
  default = []
}
variable "internal_port" {
  description = "(Optional) Expose port in pods"
  default = []
}
variable "security_context" {
  description = "(Optional) Set startup user_id, when pods start"
  default = []
}
variable "custom_label" {
  description = "(Optional) Add custom label to pods"
  default = null
}
variable "args" {
  description = "(Optional) Arguments to the entrypoint."
  default = []
}
variable "service_account_token" {
  description = "Indicates whether a service account token should be automatically mounted"
  default = null
}
variable "service_account_name" {
  description = "(Optional) Is the name of the ServiceAccount to use to run this pod"
  default = null
}
variable "restart_policy" {
  description = "Restart policy for all containers within the pod. One of Always, OnFailure, Never"
  default = "Always"
}
variable "replicas" {
  description = "(Optional) Count of pods"
  default = "1"
}
variable "resources" {
  description = "(Optional) Limit resources by cpu or memory for pods"
  default = []
}
variable "pod_management_policy" {
  description = "(Optional) podManagementPolicy controls how pods are created during initial scale up, when replacing pods on nodes, or when scaling down"
  default = null
}
variable "revision_history_limit" {
  description = "(Optional) The maximum number of revisions that will be maintained in the StatefulSet's revision history"
  default = null
}
variable "update_strategy_type" {
  description = "(Optional) Indicates the type of the StatefulSetUpdateStrategy. There are two valid update strategies, RollingUpdate and OnDelete"
  default = "RollingUpdate"
}
variable "update_strategy_partition" {
  description = "(Optional) Indicates the ordinal at which the StatefulSet should be partitioned. You can perform a phased roll out (e.g. a linear, geometric, or exponential roll out) using a partitioned rolling update in a similar manner to how you rolled out a canary. To perform a phased roll out, set the partition to the ordinal at which you want the controller to pause the update. By setting the partition to 0, you allow the StatefulSet controller to continue the update process"
  default = "0"
}