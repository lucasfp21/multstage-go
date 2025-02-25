# multstage-go
Repo to test multstage image with docker

# Passos para rodar o projeto
com os arquivos main.go, Dockerfile e go.mod no diretorio local
rodar:
    docker build -t lufertony/app-multstage:simples -f Dockerfile.simples . 
    docker container run -d -p 8080:8080 lufertony/app-multstage:simples
    checar no navegado na porta indicada se o projeto esta rodando.