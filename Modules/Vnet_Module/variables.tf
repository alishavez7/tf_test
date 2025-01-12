variable "storage_name" {
  description = "The name of the storage account"
  type        = string
  default = "tftestsatf"

}

variable "rg_name" {
  description = "The name of the resource group in which to create the storage account"
  type        = string
  default = "rg"
  
}

variable "location" {
  description = "resource location"
  type = string
  default = "westeurope"
}