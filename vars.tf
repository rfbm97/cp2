variable "location" {
  type        = string
  description = "Región de Azure donde creamos la infraestructura"
  default     = "West Europe"
}

variable "name_of_resource_group" {
  type        = string
  description = "Nombre del grupo de recursos"
  default     = "cpract2-rg"
}

variable "name_of_storage_account" {
  type        = string
  description = "Nombre del storage account"
  default     = "cpract2stoaccount"
}

variable "vm_size" {
  type        = string
  description = "Tamaño de la máquina virtual"
  default     = "Standard_B2ms" 
}

variable "aks_vm_size" {
  type        = string
  description = "Tamaño de la máquina virtual"
  default     = "Standard_D2_v2" 
}

variable "vm_name" {
  type        = string
  description = "Nombre de la VM de Azure"
  default     = "cpract2vm"
}

variable "image_publisher" {
  type        = string
  description = "Publisher de a imagen de la VM de Debian11"
  default     = "Debian" 
}

variable "image_offer" {
  type        = string
  description = "Campo offer de la VM de Debian11"
  default     = "debian-11"
}

variable "image_sku" {
  type        = string
  description = "Campo sku de la VM de Debian11"
  default     = "11-backports-gen2"
}

variable "image_version" {
  type        = string
  description = "Versión de la VM de Debian11"
  default     = "latest"
}

variable "acr_name" {
  type        = string
  description = "Nombre de la ACR de Azure"
  default     = "cpract2acr"
}

variable "aks_name" {
  type        = string
  description = "Nombre de la AKS de Azure"
  default     = "cpract2aks"
}

