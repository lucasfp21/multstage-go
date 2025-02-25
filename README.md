# multstage-go
Repo to test multstage image with docker

# Passos para rodar o projeto
com os arquivos main.go, Dockerfile e go.mod no diretorio local
rodar:

    docker build -t lufertony/app-multstage:simples -f Dockerfile.simples . 
    docker container run -d -p 8080:8080 lufertony/app-multstage:simples
    checar no navegado na porta indicada se o projeto esta rodando.

# rodando no multstage
    renomear a image usando 'as' no parametro from:
        FROM golang:1.18.10 as build
    mudar o diretorio (*opcional)
        WORKDIR /build


    no mesmo dockefile criar imagem final e renomear usando o 'as'
        FROM alpine:3.18.4 as app
    copiar os arquivos da imagem "build" passando o parametro --from no COPY
        COPY --from=build /build/main .


    a parte do cmd sera necessaria somente na segunda imagem (pois ela vai executar o binario gerado na imagem base "build)
        CMD [ "/main" ]

# usando o target
    para poder escolher qual imagem vc quer como resultado final (no caso de um dockefile com mult-stage), basta adicionar o parametro --target=<nome> no comando de build, ex:
            ocker build -t lufertony/app-multstage:mult -f Dockerfile.multstage  --target=build . 