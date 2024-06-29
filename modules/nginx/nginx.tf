terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
      version = "~> 3.0.1"
    }
  }
}

# Dockerイメージリソースを定義
resource "docker_image" "nginx" {
    # 使用するイメージの名前を指定
    name = "nginx"
    # イメージをローカルに保持しない
    keep_locally = false
}

# Dockerコンテナリソースを定義
resource "docker_container" "nginx" {
    # 使用するイメージのIDを指定
    image = docker_image.nginx.image_id
    # コンテナの名前を指定
    name = "tutorial"

    # ポートマッピングを定義
    ports {
        # コンテナ内部のポートを指定
        internal = 80
        # 外部に公開するポートを指定
        external = 8000
    }
}