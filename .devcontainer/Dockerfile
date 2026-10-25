FROM mcr.microsoft.com/devcontainers/python:1-3.12

# A imagem pode trazer o repositorio legado do Yarn com uma chave GPG
# indisponivel. As features executam apt-get update durante o build e falham
# antes de instalar o Docker-in-Docker. O Node e instalado por sua propria
# feature, portanto este repositorio nao e necessario.
RUN rm -f /etc/apt/sources.list.d/yarn.list
