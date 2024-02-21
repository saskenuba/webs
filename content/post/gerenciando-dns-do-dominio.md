+++
title = "Gerenciando DNS do domínio"
date = 2017-08-19
lastmod = 2024-02-20T20:36:09-03:00
draft = false
weight = 2014
url = "/post/2"
+++

Se você já colocou seu website na internet, certamente já ouviu falar sobre DNS
e as dores de cabeça que dá ficar mexendo, então nesse post vou tentar trazer
umas informaçòes de um jeito menos técnico que possam ajudar.

O DNS é sistema de nome de domínios, que genericamente significa que quando você
escreve uma frase na barra de endereços, ele vai traduzir essa informação para
um IP que o computador pode entender.

Uma convenção que é usada na hora de mexer com DNS pelos sites de hospedagem, é
no caso do @ representar o seu domínio.

Para os exemplos a seguir, vamos considerar o meu domínio, que é
[martinmariano.com](https://martinmariano.com). Ele é gerenciado pela [GoDaddy.com](https://godaddy.com), e hospedado pela
[DigitalOcean](https://digitalocean.com), e tem seus registros MX pela [NameCheap](https://namecheap.com).

Lembrando que todas estas informações são de domínio público, e podem ser
verificadas por qualquer um na internet utilizando de ferramentas do tipo DNS
Lookup, um exemplo seria <https://mxtoolbox.com/DNSLookup.aspx>.


## Visão Geral {#visão-geral}

Estes abaixo seus meus registros DNS vistos do painel de gerenciamente de DNS do
site da GoDaddy.com.

{{< figure src="http://i.imgur.com/KHkJ7tk.jpg" >}}


### Tipos de registros {#tipos-de-registros}

A: Ele vai apontar seu domínio para um ip, este onde está com o @ na coluna de
nome completo. aponta para o ip fornecido pela minha hospedagem.

Você irá notar que existe um outro registro do tipo A, que é chamado mg, ele
significa um subdomínio, que no caso você o acessa em mg.martinmariano.com. No
meu caso é utilizado por uma API de emails.

AAAA: Funciona exatamente igual ao registro A, mas aponta à um ipv6.

CNAME: O Cname é basicamente um apelido, que quando você o digita, é
redirecionado para um domínio. Se este dominio é seu próprio registro A, esse
atuará como uma máscara. Por exemplo, nos meus registros pegue o exemplo do
CNAME com o nome de www, ele aparece como www.martinmariano.com, mas na verdade
por baixo você está acessando martinmariano.com (Você não pode colocar um CNAME
para direcionar para um IP, somente para um domínio.)

TXT: Esses contêm algum tipo de informação adicional requerida por algum outro
site, no caso eu os utilizo para o redirecionamento de emails, e também para
usar o google web console.

MX: São os registros de email do seu domínio. Você nota na minha configuração,
que quando utilizado o meu subdomínio mg.martinmariano.com, os emails são
gerenciados por outra aplicação, no caso o [MailGun](http://www.mailgun.com), que é uma API para enviar e
receber emails.

NS: São os registros de nomes, basicamente os que cuidam do seu DNS. Os que eu
utilizo são os padrões fornecidos pela própria GoDaddy.


## Resumão {#resumão}

Este foi um post bem rápido para servir de apoio a alguém que quer configurar
seu domínio/hospedagem ou entender como funcionam os registros rapidamente.
