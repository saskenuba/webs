+++
title = "Túnel ssh (ssh tunneling) - local port forwarding"
date = 2018-08-11
lastmod = 2024-02-20T20:40:28-03:00
draft = false
weight = 2007
url = "/post/11"
+++

Venho compartilhar algo incrível que descobri recentemente, e que talvez não
seja muito conhecido por aí. É um procedimento chamado Túnel SSH, também
conhecido como _SSH Tunnelling_, e tem a capacidade de resolver alguns problemas
relativos com conexões entre servidores, e contornar bloqueios de firewall.


## Problema {#problema}

Precisava me conectar ao banco de dados deste site que você está acessando agora
a fim de realizar o backup das informações das tabelas. Ele é um servidor
POSTGRESQL remoto, e faço sua administração através da ferramenta PGADMIN, porém
o único jeito de acessar meu servidor, é por SSH (chave pública e privada)
porque desativei o login por usuário/senha que é o recomendado. Resumindo o
processo, preciso me conectar ao servidor remoto, na porta 5432, por SSH.

Agora imagine configurar todo esse acesso, de coleta de chave privada,
autorização e tudo mais, em uma ferramenta como o PGADMIN que possui uma
interface gráfica. _Um verdadeiro porre_.

\#+CAPTION Representação do processo de Túnel SSH. Solução - Local port forwarding
![](https://i.imgur.com/VzGq1Gd.png)

Como sempre me conecto ao meu servidor por SSH, a configuração inicial já estava
feita, resolvi criar um “túnel” entre meu computador e a porta usada pelo
POSTGRESQL no servidor remoto. O comando usado para alcançar esse objetivo é o
seguinte:

```shell
ssh usuario@servidorRemoto.com -f -N -L 9000:localhost.com:5432
```

Desmembrando a primeira parte do comando, temos:

```shell
ssh usuario@servidorRemoto.com -f -N
```

Primeiro nos conectamos ao nosso servidor remoto por SSH, e usamos o -f para
manter essa conexão em background, e usamos -N para avisar que não mande nenhum
comando para o shell deste servido. Na sequência temos:

```shell
-L 9000:localhost:5432
```

Que é equivalente a:

```shell
-L porta_em_seu_computador:servidor:porta_servidor
```

Então 9000 é SUA porta de seu computador que você quer criar a entrada este
túnel para que a saída dele seja a porta 5432 do servidor remoto.

Este localhost que aparece é na perspectiva do SERVIDOR REMOTO (é o localhost
DELE), e a porta para qual ele irá redirecionar o acesso quando você alcançar
este mesmo servidor. Ou seja, quando você acessar `localhost:9000` no seu
computador, você será redirecionado para `root@servidorRemoto.com:5432`.

Ainda nessa área de túneis SSH, existem ainda o Remote port Forwarding e o
Dynamic Port Forwarding, este último é comumente utilizado para utilizar um
computador externo de proxy! Assim que possível irei comentar sobre estes dois
métodos, e também irei realizar uma postagem de como utilizar chaves GPG para
gerenciar a autenticação com SSH. Supimpa!
