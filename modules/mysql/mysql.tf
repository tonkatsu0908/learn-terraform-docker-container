terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
      version = "~> 3.0.1"
    }
  }
}

resource "docker_image" "mysql" {
  name = "mysql"
  keep_locally = false
}

resource "docker_container" "mysql" {
  image = docker_image.mysql.image_id
  name = "mysql"

  # port
  ports {
    internal = 3306
    external = 3306
  }

  # 環境変数
  env = [
    "MYSQL_ROOT_PASSWORD=root-pass",
    "MYSQL_DATABASE=mydatabase",
    "MYSQL_USER=user",
    "MYSQL_PASSWORD=user-pass",
  ]
}