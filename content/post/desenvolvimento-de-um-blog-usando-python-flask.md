+++
title = "Desenvolvimento de um blog usando python + flask"
date = 2017-08-13
lastmod = 2024-02-21T00:01:33-03:00
draft = false
weight = 2014
url = "/post/1"
description = "Descrevendo como o blog antigo escrito em python foi desenvolvido. Antigo, o blog já mudou!"
+++

Neste post vou explicar um pouco sobre como foi realizar a construção deste blog
do zero.


## Fala logo da parte técnica que estou curioso! {#fala-logo-da-parte-técnica-que-estou-curioso}

Tudo bem, vou dizer. Todo o back-end foi feito em Python, utilizando o framework
Flask, já o front-end foi construído com um framework bem interessante chamado
Semantic-UI que é semelhante ao Boostrap que talvez você já deva conhecer. Usei
bastante javascript também, principalmente para a dashboard, onde toda a
inserçào, alteraçào e deleção de posts são feitas por meio de AJAX. Se você for
curioso de verdade basta ver o código-fonte do site, hehe.

Na parte da banco de dados, usei o PostgreSQL que é um dos banco de dados que
mais ganha seguidores no mundo (fonte), e na gestão dele usei o SQLAlchemy que ,
genericamente, é um conjunto de ferramentas e ORM para Python. Nesse ORM, cada
tabela funciona como uma classe, e você acaba utilizando o SQL como se estivesse
programando orientado a objetos. Supimpa.

Nessa mesma parte de postagem, como todos os requests são feitos por AJAX,
montei uma API rest privada, onde o caminho fica centralizado, e as ações são
feitas de acordo com os devidos métodos http, como PUT, POST, DELETE, e todos
estes consomem o arquivo JSON enviado pelo cliente.

Você mesmo consegue ver o JSON deste post por exemplo, basta entrar em
<http://martinmariano.com/post/json/1>. Este é o único exposto pela API.

E os posts ainda contam com syntax highlighting, wow!!

```python
if visitante.status == 'surpreso':
    return ':)'

else:
    return ':((('
```


## E porque tu não usou WordPress? {#e-porque-tu-não-usou-wordpress}

Porque eu não quis! Brincadeira. A vontade de fazer um site pessoal já vinha de
alguns tempos, e como eu estava tirando uma certificação chamada CS50 (dê uma
olhada) que precisava de um projeto e então resolvi meter a cara e fazer.

Já havia desenvolvido alguns sites estáticos - aqueles que não tem nenhum banco
de dados, ou alguma interaçào significativa com o usuário cliente - porém nada
algo desse tamanho, que possuísse um sistema de banco de dados relacional e que
misturasse outras linguagens.

Sofri um pouco na parte do deploy, onde o universo não tava querendo ser muito
amigável comigo, mas no fim deu tudo certo. Acabei comprando o domínio no
GoDaddy e a hospedagem é feita pela Digital Ocean, que vende VPSs carinhosamente
chamados de droplets (gotinhas). Que lindo, não? Os preços são bem camaradas,
inclusive se você quiser $10 de desconto basta clicar no meu referral, yes!


## Beleza, e quem lê um blog em 2017? {#beleza-e-quem-lê-um-blog-em-2017}

Quando você tem alguma dúvida relacionado à programação, você joga no google e
ou você cai no stackoverflow, ou em um blog. Com sorte minha você viu algo
interessante aqui e resolveu ler um outro post. Como sou um desenvolvedor
iniciante tentarei postar as dificuldades inerentes de quem está começando.


## Resumindo {#resumindo}

Foi uma experiência bem bacana montar tudo, aprendi mais sobre python, js, web
em geral (dns, http), linux na parte de segurança, git. Se você quer aprender de
verdade, recomendo iniciar um projetinho, nem que seja de brincadeira, no mínimo
você pega gosto pela coisa e começa aprender mais e mais, e reitero que é muito
viciante, principalmente quando bate aquele "click" que você está pegando o
jeito de programar.

Qualquer dúvida ou sugestão basta me mandar um email na seção de contato ou
postar um comentário abaixo.
