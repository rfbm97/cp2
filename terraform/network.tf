# Creación de red
resource "azurerm_virtual_network" "myNet" {
  name                = "cpract2-nt"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  tags = {
    environment = "casopractico2"
  }
}

# Creación de subnet
resource "azurerm_subnet" "mySubnet" {
  name                 = "cpract2-sn"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.myNet.name # Asociación con la red virtual
  address_prefixes     = ["10.0.1.0/24"]
}

# Creación de NIC (Interfaz de red)
resource "azurerm_network_interface" "myNicl" {
  name                = "vmnicl"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  ip_configuration {
    name                          = "cpract2-ipconfig"
    subnet_id                     = azurerm_subnet.mySubnet.id
    private_ip_address_allocation = "Static"
    private_ip_address            = "10.0.1.10"
    public_ip_address_id          = azurerm_public_ip.myPublicIp1.id # Asignamos una IP Pública para poder acceder al servidor
  }
  tags = {
    environment = "casopractico2"
  }
}

# IP Pública
resource "azurerm_public_ip" "myPublicIp1" {
  name                = "vmip1"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  allocation_method   = "Dynamic"
  sku                 = "Basic"

  tags = {
    environment = "casopractico2"
  }
}

# Creación de un par de claves ssh

resource "tls_private_key" "ssh_key" {
    algorithm = "RSA"
    rsa_bits  = 2048
}

# Guardamos el par de claves ssh en la carpeta claves_ssh del directorio actual

resource "local_file" "private_key" {
    content  = tls_private_key.ssh_key.private_key_pem
    filename = "${path.module}/claves_ssh/private_key.pem"
}

