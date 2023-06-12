terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

# Define o provedor AWS
provider "aws" {
    region = "us-east-1"
    #access_key = "SUA_ACCESS_KEY"
    #secret_key = "SUA_SECRET_KEY"
  
}
#Linha Teste
# Cria a chave SSH
resource "aws_key_pair" "wsterraform" {
  key_name   = "wsterraform" # Nome da chave SSH que será criada na AWS
  public_key = file("wsterraform.pub") # Caminho para o arquivo da chave pública SSH
}


# Cria a instância EC2
resource "aws_instance" "webserver" {
  ami           = "ami-04a0ae173da5807d3" # ID da imagem AMI desejada
  instance_type = "t2.micro" # Instância desejada
  key_name      = "wsterraform" # Nome da chave SSH existente. Neste  caso, a chave que foi criada no bloco anterior

  tags = {
    Name = "Exemplo de instância EC2"
  }
}