# meetup-eng-dados-apache-nifi
Repositório para compartilhar a demo apresentada na meetup https://www.meetup.com/pt-BR/engenharia-de-dados/events/281590591/

#Iniciar containers

docker-compose up -d --scale nifi=2

#Pre requisitos para execução 

No grupo Ex2 - Movies Netflix 

1. Habilitar os controller services para a execução dos processos "Increase Timestamp Column" e "Partition By Type and Release Year".

![Alt text](images/1.MoviesNetflix.JPG?raw=true "Processor Conf")

2. Alterar o nome do bucket nas variaveis do nifi.

3. No processo  "Put Netflix Dataset to S3" será necessario preencher o "Access Key ID" e "Secret Access Key" com acesso de escrita ao bucket informado nas variaveis do nifi.

No grupo Ex3 - Api Marvel

Será necessario criar uma api no link: https://developer.marvel.com/

Criar 3 novas variaveis no nifi

ts = uma opção é utilizar o link https://www.epochconverter.com/
apikey = sua chave publica
hashkey = uma opção é utilizar o link https://www.md5hashgenerator.com/ -> informar ts + chave privada + chave publica. Clicar em generate, utilizar a opção "MD5 Hash".

Será necessario habilitar os controller services para a execução dos processos "Create Insert to SQL" e "Put Characters in tb_marvel".

entrar no adminer http://localhost:18980/ 
Servidor: mysql
Usuário: root
Senha: password
Base de dados: demo_nifi

criar a tabela:
CREATE TABLE `tb_marvel` (
  `id` int NOT NULL,
  `name` varchar(100) NOT NULL,
  `thumbnail` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) 
