+++
title = "O caminho da Startup"
date = 2022-11-12
lastmod = 2024-02-20T23:56:20-03:00
tags = ["rust", "clojurescript", "startup", "empresa"]
draft = false
weight = 2001
url = "/post/16"
description = "Devaneios de querer ser dono de empresa."
+++

Está aqui. Finalmente chegou o momento, depois de tanta espera, angústia,
alegrias e descobrimentos. A minha empresa (ou startup né, já que está na moda)
está online! De CNPJ e tudo, vai encarar?

A MercadoSkin é uma marketplace C2C (customer to customer) de skins para Counter
Strike GO. Quem deseja vender realiza o cadastro, sobe o item que deseja vender
e recebe o dinheiro direto no banco ou carteira virtual. Para quem deseja
comprar, os itens estão mais baratos que no mercado tradicional da Steam além de
oferecermos várias opções de pagamento como o poder de parcelar em 4x sem juros
(em processo de integração) e PIX.

Não começou exatamente como um projeto de empresa, mas ao longo do tempo acabou
se tornando. Aqui descrevo a jornada do herói, vulgo empreendedor de baixa
renda, aquele que não tem um puto para colocar do bolso. Triste mas é a pura
realidade. Vou descrever todo o tech da loja, colocando hiperlinks para
facilitar a navegação, e também descrever algumas nuances que enfrentei como
dono e desenvolvedor.


## Tech stack {#tech-stack}

Muita tecnologia e várias apostas também. Contei com um pouco de sorte nestes
últimos um ano e meio e tudo que utilizei no projeto amadureceu bem. As seções a
seguir possuem bastantes jargões da área de TI, mas não se assuste! Prometo que
vai ficar tudo bem.


### Backend em Rust {#backend-em-rust}

Como eu havia dito na introdução, no início do projeto, ainda não sabia se esses
estudos iriam para lugar algum, ou ainda que concretizariam-se em algo; apenas
estava com a ideia de portar várias bibliotecas de código aberto em C# e Node.js
para Rust, a fim justamente de aprender a linguagem.

Então, Rust foi meio que uma aposta, e que felizmente me surpreendeu muito com
as facilidades que ela me ofereceu até hoje. Há um ano e meio atrás, nunca havia
trabalhado com linguagens tipadas e agora não consigo voltar atrás. Além da
tipagem em si, Rust possui o famigerado borrow checker, sistema que realiza
controle dos tempos de vida das referências de variáveis, evitando uma série de
problemas, como double frees, e racing conditions no caso de multi-threading.

Não entrarei em muitos detalhes sobre a ergonomia da linguagem já que não é o
ponto do post, mas recomendo a todos experimentarem. Quando necessário realizar
algum tipo de refactor, o compilador te guia com as mensagens de erro. Coisa
divina.


### Frontend com ClojureScript {#frontend-com-clojurescript}

Seguindo o mesmo racional de Rust, comecei a escrever o frontend na linguagem
CLJS (ClojureScript). Ela é basicamente Clojure, mesma sintaxe, com a diferença
que ela "transpila" (converte) seu código para Javascript otimizado através do
compilador Google Closure.

Escrevo o frontend com as bibliotecas Reagent (de grosso modo um wrapper de
React), e re-frame, este que preencheria o espaço de um banco de dados, com uma
lógica reativa muito bacana onde através de uma função, fica esperando por
mudanças de uma variável, e ao acontecer re-renderiza somente aquela seção que
possui a variável.

Ao longo do tempo, ouvia dizer que programação funcional mudaria o modo de como
o programador pensa, devido a mudança total do paradigma imperativo (python, js)
para o funcional. Com funções sem side effects (funções puras), funções que
recebem outras funções como parâmetros etc. Então resolvi mergulhar em Clojure e
já lhes digo, que jornada!

No início foi difícil me acostumar. Antes do projeto já havia testado Haskell só
por brincadeira, então já tinha uma certa noção de como funcionava, mas Haskell
por si só é uma linguagem pura que não permite mutabilidade. No caso, Clojure
até permite, mas não é incentivado. Em suma, é outro jeito de escrever código e
ajuda demais utilizar esses pilares da programação funcional ao voltar em outras
linguagens, em especial ao evitar bugs de mutabilidade.


### Infraestrutura {#infraestrutura}

Um processo que realmente brilha dentro na MercadoSkin, é o continuous
deployment e delivery. Com o Github Actions, assim que existe um commit novo
dentro da branch principal, ele realiza o teste, e após todos passarem com
sucesso, um processo adjacente executa um cross-compilation para a arquitetura
MUSL.

Compilando para MUSL, você permite que o projeto rode sem absolutamente nenhuma
dependência do ambiente que vai rodar. Isso significa que você não precisa da
libc, openssl, ou qualquer outra biblioteca, já que está tudo incluído
estaticamente no executável do servidor. O container fica com apenas 25mb. É
para chorar de alegria.

Então logo depois testar, ele compila para linux MUSL, e lança o projeto no AWS
ECR, que é o container registry da AWS, que fica de graça no free tier.
Contratei um servidor bem baratinho no cloud hosting da Hetzner, por
aproximadamente 3.99 euros por mês, e possui 2GB de RAM e 2 vCPU. E utilizo um
serviço chamado CapRover para realizar o deploy/orquestração deste container,
além dos outros, como Redis e de outros processos.

Ou seja, depois de 1h, que é mais ou menos o tempo que demora para tudo ser
testado e compilado, o commit estará live automaticamente. Viva a tecnologia meu
garoto!

Além do container do site, criei uma função AWS Lambda rodando em Python, dentro
de um container. Ela é responsável por todos os processos de scraping que a
MercadoSkin realiza. Eu não sei o que posso compartilhar, mas são váááários
processos, hehe.

O interessante sobre as funções Lambda, é que a Amazon é muito generosa quanto
ao tempo de processamento que ela pode rodar, com a condição que não exija-se
demais — no sentido de precisar muito de CPU, que custam mais caro. Permitindo
que todo o scraping rode na faixa. Sim, grátis, for free. Obrigado tio Bezos!

Além das funções Lambda AWS, também utilizamos o S3 para storage dos perfis da
Steam e os resultados do scraping, e AWS ECR para guardar o container com o
código do site.

Uma coisa que descobri durante o desenvolvimento da infraestrutura, é a
possiblidade de “descrever a infraestrutura” em código, utilizando a linguagem
Terraform. Se você não conhece, você basicamente pega a sua chave de API das
plataformas de infraestrutura, tipo Cloudflare, Hetzner, AWS; e escreve em
código mesmo as funcionalidades. Assim você sempre possuirá o mesmo “ambiente”
só rodando o script Terraform. Muito louco!


### E-mails transacionais {#e-mails-transacionais}

Com o SendGrid, enviamos todos os e-mails transacionais de maneira muito
simplificada. Basta criar os modelos de designs dos e-mails, com as variáveis
que serão substituídas por seus valores mais tarde. Então na hora de chamar a
API de envio de e-mail, você coloca o nome da variável e seu valor concreto.
Assim o SendGrid realiza a substituição antes do envio. Muito prático.

Você também consegue utilizar sua chave de API para enviar e-mails por SMTP.
Assim você consegue enviar e-mails a partir de uma caixa convencional, tipo
GMAIL, sem a necessidade de ter que pagar por uma caixa única. Hoje eu recebo
todos meus e-mails via Cloudflare por redirecionamento, e envio através do meu
Gmail com o auxílio do SendGrid, sem gastar um real!!! Caminho das Pedras

Adoro a expressão de passar pelo caminho das pedras, um grande abraço ao meu
ex-chefe Renato! Mas digo de antemão: use no mínimo um chinelo, porque o caminho
das pedras machuca e não é pouco.


### Escolhendo um gateway de pagamento em 2022 {#escolhendo-um-gateway-de-pagamento-em-2022}

Uma das etapas mais engessadas até agora, foi a parte da integração de cartão de
crédito. São muitos os possíveis parceiros, SafraPay, MercadoPago, Pagar.me,
Yapay, PayPal entre vários outros que oferecem ou somente a maquininha, ou
alguma outra coisa.

Como meu backend foi desenvolvido em Rust, e minha plataforma é proprietária,
tenho que realizar a integração manualmente ☹. Mas tranquilo, somos
verdadeiramente guerreiros dos teclados, então nada tememos desde que a
documentação esteja bem especificada. Segue o relato:

**SafraPay**: O SafraPay foi a maior decepção até agora. Entrei no site e pimba,
ótimas taxas, bem explicativo, possui suporte para Checkout Transparente, até
então tudo perfeito! Até chegar a hora do credenciamento. Um atendente pior que
o outro, ninguém conhece o produto, ninguém conhece o Checkout Transparente que
está sendo anunciado no site. Um deles até chegou a me perguntar o que era API
de pagamentos. Poxa, como vou saber se eles que vendem os serviços? Achei
engraçado, e depois de alguns segundos, trágico. Abri reclamação no ReclameAqui,
recebi ligações, mensagens, e depois de uma semana descobri que o checkout
transparente foi descontinuado. Bora para o próximo!

**MercadoPago**: API mais ou menos documentada. Mas todas as taxas de todas as
modalidades de recebimento são maiores de que qualquer outro concorrente. Será
que são tão populares ao ponto de colocarem as taxas que quiserem? Próximo.

**PayPal**: Sempre ouvi dizer que ficam muito do lado do cliente em uma possível
disputa. Isso é arriscado já que meus produtos são totalmente digitais; uma vez
que transferi o item, já era. Então decidi procurar por outro parceiro de
recebimentos.

**GalaxPay**: Cobra mensalidade que pode ser absorvida em transações, e também setup
de 300 reais. É preciso credenciar para obter-se as taxas cobradas no cartão.
Pedi uma pré cotação das taxas, mas não me mandaram. Pelo valor total cobrado,
acho improvável de me oferecerem algo mais vantajoso que os concorrentes. Em
compensação, foi o único que me prestou um atendimento realmente personalizado.
Me ligaram, marcaram uma reunião no Meets; valorizo muito isso, props!

**Pagar.me**: Pior contato comercial existente. Três dias aguardando para cada
e-mail para tirar dúvidas, e o comercial responde, sem as dúvidas. Taxas tão
caras quanto MercadoLivre. Não compensa.

**Stripe**: API excelente, texto e taxas claras como as fontes termais nipônicas,
mas infelizmente não possui parcelamento, mas este está para entrar no Q2
de 2022. Agora não rola, mas ficamos de olho!!

**eRede e Cielo**: Possuem taxas boas, mas a eRede só permite antecipação depois
de 1 ano, e a Cielo não é transparente quanto sua antecipação (taxas cobradas
etc.). E em ambas você só recebe junto com as parcelas do cliente. Não tem como,
já que não tenho capital de giro.

**Yapay**: API mais ou menos documentada com taxas atraentes. Entrei em contato com
o atendimento, este que sempre respondeu rapidamente. As melhores taxas
negociadas até o momento. Tive que fechar com eles!


## Fechamento {#fechamento}

É realmente uma loucura ter que lidar com tudo sozinho. Você precisa desenvolver
o produto (software), analisar seus parceiros de recebimentos, lidar com
questões administrativas da empresa, marketing em mídia social onde é necessário
criar fotos e vídeos de maneira que alcance seu público. E gostaria muito de
dizer que vai dar certo, mas no momento é uma incerteza muito grande. Desenvolvi
o projeto pensando muito no SEO (Search Engine Optimization) e estou apostando
minhas fichas no Google fazendo um bom trabalho.

Acredito que esse post resume todo o processo, desde o início até onde estou
agora. Tenho diversas ideias para implementar e continuar, mas infelizmente o
orçamento está curto. Veja bem, é muito mais prático e fácil trabalhar para os
outros, principalmente nesse inicio. Adivinhe meu faturamento desde janeiro?
Precisos R$5,00. Sim. Tudo isso.

Mas digo com toda a convicção do mundo, se não fosse por este projeto, não seria
um terço do desenvolvedor que sou hoje. Aprendi todos os processos de
desenvolvimento de software possíveis e que possam ser descritos. Ajudei com
bibliotecas de código-aberto que são essenciais para o funcionamento da loja,
criei várias bibliotecas também. Dê uma olhada no meu Github e quem sabe você
não acha algo interessante. Aqui seguem algumas direto do Github:

-   SteamHelpers-rs - Conjunto de crates(bibliotecas em Rust) para se comunicar com a Steam;
-   PixToolbelt - Conjunto de utilidades para se comunicar com PSP (bancos, fintechs) através da especificação do PIX. Inclui cliente para chamadas API, gerador de QRCodes, parser de BRCode, entre outros;
-   Yapay-SDK-Rust - SDK não oficial da Yapay em Rust, fortemente tipado para realizar chamadas na API.

O Blog da MercadoSkin também possui artigos interessantes, que apesar de quase
não ter nada neste momento, planejo anúnciar todas as informações da empresa por
lá. Supertope!

E mais, sigo inabalável por pelo menos até o fim de 2022. O produto está ali,
sólido, rápido e sem clientes. Agora minha ideia é focar no marketing para
alcançar o público. Me desejem sorte!
