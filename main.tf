# Terraformブロックは使用するプロバイダーの要件を定義します
terraform {
  required_providers {
    docker = {
        # Dockerプロバイダーのソースとバージョンを指定
        source = "kreuzwerker/docker"
        version = "~> 3.0.1"
    }
  }
}

# Dockerプロバイダーを宣言
provider "docker" {}

module "web" {
  source = "./modules/nginx"
}

module "db" {
  source = "./modules/mysql"
}


