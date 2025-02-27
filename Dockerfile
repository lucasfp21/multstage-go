FROM golang:1.18.10 as build
WORKDIR /build
COPY . .
RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o main .

FROM build as package_build
WORKDIR /pkg
#copy de uma imagem externa
COPY --from=fabricioveronez/pacote-bin:v1 /pkg/pacote.bin .

FROM alpine:3.18.4 as app
WORKDIR /app
#copy padrao
COPY --from=build /build/main .
COPY --from=package_build /pkg/pacote.bin .
CMD [ "./main" ]