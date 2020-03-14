# Image-Resizer-Docker
Treinamento Construindo Aplicações Escaláveis para Nuvem 

## Dependências

Para rodar o projeto é necessário criar o container do docker do azurite (emulador) ou hospedar no Azure (nuvem).

Comando para criar o Container do Azurite

```docker
docker run -d -t -p 10000:10000 -p 10001:10001 -p 10002:10002 -v ${pwd}:/opt/azurite/folder  arafato/azurite
```


