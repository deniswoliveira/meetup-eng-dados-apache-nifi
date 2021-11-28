# meetup-eng-dados-apache-nifi
Repositório para compartilhar a demo apresentada na meetup https://www.meetup.com/pt-BR/engenharia-de-dados/events/281590591/

# Iniciar containers

docker-compose up -d --scale nifi=2

# Pré-requisitos para execução 

No grupo Ex2 - Movies Netflix 

1. Habilitar os controller services para a execução dos processos "Increase Timestamp Column" e "Partition By Type and Release Year".

![Alt text](images/1.MoviesNetflix.JPG?raw=true "Processor Conf")
![Alt text](images/2.MoviesNetflix.JPG?raw=true "Conf")
![Alt text](images/3.MoviesNetflix.JPG?raw=true "Controller Services")

2. Alterar o nome do bucket nas variaveis do nifi.

![Alt text](images/4.MoviesNetflix.JPG?raw=true "Variable")

3. No processo  "Put Netflix Dataset to S3" será necessario preencher o "Access Key ID" e "Secret Access Key" com acesso de escrita ao bucket informado nas variaveis do nifi.

![Alt text](images/5.MoviesNetflix.JPG?raw=true "Aws keys")

No grupo Ex3 - Api Marvel

1.Criar uma api no link: https://developer.marvel.com/

![Alt text](images/1.ApiMarvel.JPG?raw=true "https://developer.marvel.com/")

2. Criar 3 novas variaveis no nifi

ts = uma opção é utilizar o link https://www.epochconverter.com/
![Alt text](images/2.ApiMarvel.JPG?raw=true "ts")
apikey = sua chave publica
hashkey = uma opção é utilizar o link https://www.md5hashgenerator.com/ -> informar ts + chave privada + chave publica. Clicar em generate, utilizar a opção "MD5 Hash".
![Alt text](images/3.ApiMarvel.JPG?raw=true "https://www.md5hashgenerator.com/")
![Alt text](images/4.ApiMarvel.JPG?raw=true "https://www.md5hashgenerator.com/")

3. Configurar password e Habilitar os controller services para a execução dos processos "Create Insert to SQL" e "Put Characters in tb_marvel".

![Alt text](images/5.ApiMarvel.JPG?raw=true "mysql")

4. Entrar no adminer http://localhost:18980/ 
    Servidor: mysql
    Usuário: root
    Senha: password
    Base de dados: demo_nifi

![Alt text](images/6.ApiMarvel.JPG?raw=true "adminer - mysql")

criar a tabela:

  CREATE TABLE `tb_marvel` (
    `id` int NOT NULL,
    `name` varchar(100) NOT NULL,
    `thumbnail` varchar(100) NOT NULL,
    PRIMARY KEY (`id`)
  ) 

![Alt text](images/7.ApiMarvel.JPG?raw=true "adminer - mysql")