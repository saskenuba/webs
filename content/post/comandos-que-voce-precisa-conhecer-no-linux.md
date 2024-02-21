+++
title = "Comandos que você precisa conhecer no linux"
date = 2017-10-16
lastmod = 2024-02-20T20:39:29-03:00
draft = false
weight = 2011
url = "/post/6"
+++

A qualquer ponto durante o uso do Linux, você já deve ter se perguntado por que
raios devo usar a linha de comando, se usar a interface de usuário é muito mais
rápido?

Então aqui te dou uma dica que você agradecerá imensamente no futuro. São os
comandos:

-   sed
-   awk
-   grep
-   more, less
-   cat
-   pipes, redirecionamento e backsticks

Para que você entenda cada um deles, vou começar explicando pelo sed.

Lembrando que esse post não é para ser entendido como um tutorial de todos, e
sim como uma informação nova que deve ser estudada. Leia, pesquise e pratique!
Comando sed

Para entender como o sed funciona, imagine uma receita de bolo. Você possui as
entradas (ingredientes), o processamento (batedeira, forno) e as saídas (bolo
pronto). O sed vai agir como essa parte de processamento. Faça o teste.

```shell
$ echo dia | sed s/dia/noite/
>> "noite"
```

Nesse exemplo acima, o comando echo faz simular que você tivesse escrito dia com
o teclado, e o sed agirá substituindo a primeira palavra "dia" que encontrar
para a palavra "noite". Muito bom!

Então se nós desmembrarmos o comando, temos:

|         |                                    |
|---------|------------------------------------|
| s       | Comando de substituição            |
| _.._../ | Delimitador                        |
| dia     | Expressão regular à ser pesquisada |
| noite   | String de reposição                |

É importante notar que o comando faz exatamente o que você pede a ele, então
caso você escrever:

```shell
$ echo procedia | sed s/dia/noite/
>> "procenoite"
```

E o sed funciona por linha, ou seja, se o seu arquivo possui multiplas linhas,
ele irá trocar sempre a primeira palavra para aquela que você escolheu.

Além disso possui várias outras aplicações, dê uma olhada.


## Comando awk {#comando-awk}

Como o sed, o comando awk funciona para processamento de texto. Muitos comandos
do linux produzem outputs (saídas) formatadas em linhas e colunas e é muito mais
fácil utilizar o awk do que utilizar outras linguagens de programação ou fazer
manualmente.


## Comando grep {#comando-grep}

Devo assumir que você já ouviu falar (se não ouviu vá dar uma olhada agora)
sobre expressões regulares, porque o grep as usa, e seu poder vem de sua
flexibilidade.

Em um dos primeiros editores de texto do Unix, para pesquisar e imprimir a
string “tranqueira” em determinado artquivo, era necessário você digitar o
comando:

`/tranqueira/p`

E para imprimir todas as linhas que continham a palavra era:

`g/tranqueira/p`

A letra “g” era usada como abreviação para “pesquisa global”.

Então como era uma função tão comum e usada por todos, alguém decidiu fazer um
comando próprio, muito mais simples. E este foi chamado de grep, que era o
encurtamento de “g/regular expression/p” ou “g/re/p”.

Um exemplo simples é utilizar para procurar por senhas em outro computador, você
poderia executar:

`grep senha *`

Então todas as linhas em todos os arquivos que contêm essa palavra vão ser
impressos na tela. O output seria mais ou menos:

```text
notas: se lembrar que a senha do sistema Linux é “contacinza54”, não esquecer!
notas: guardar em outro lugar porque não é seguro ter senhas salvas no computador, hehe
mensagem: você sabe qual é a senha do sistema? Abraço
```

No exemplo de notas, no mesmo arquivo a palavra “senha” foi citada duas vezes, e
no arquivo “mensagem” foi citada uma vez. Bem simples de achar, certo?


## Pipes, Redirecionamento e Backsticks {#pipes-redirecionamento-e-backsticks}

Essa parte aqui é muito bacana, e tem muitos usos diferentes.


### Pipes e Redirecionamento {#pipes-e-redirecionamento}

Quando trabalhamos com redirecionamento, estamos conversando sobre redirecionar a saída ou entrada de um comando para outro lugar ou até para um outro comando. Com isso podemos reutilizar fácilmente as informações que nos são dadas e otimizar nosso tempo.

Por padrão, a maioria dos programas redirecionam para a chamada "stream" STDOUT, que seria a saída padrão, o seu monitor. Um exemplo seria abrir o terminal e digitar:

```shell
ls -al
>> total 27
drwxr-xr-x  7 martin users 4096 Apr 12 19:59 .
drwx------ 25 martin users 4096 Apr 28 17:43 ..
drwxr-xr-x  3 martin users 4096 Apr 11 16:56 Pictures
drwxr-xr-x  2 martin users 4096 Apr 12 20:25 Private
drwxr-xr-x  5 martin users 4096 Apr 25 19:00 programming
drwxr-xr-x  7 martin users 4096 Apr  9 17:28 src
```

Então todo a listagem de arquivos e pastas da sua localização atual aparecerá na
sua tela. Agora experimente digitar:

```shell
ls -al > listagem.txt
```

Nada irá aparecer no seu monitor. Isto acontece porque você redirecionou a saída
do "programa" ls para o arquivo listagem.txt. Basta acessá-lo com um editor de
texto e verá a mesma coisa que antes.


### Backsticks {#backsticks}

O backsticks é simplesmente o \`(símbolo que usamos para crase). Qualquer comando
que você colocar entre os backsticks, ele irá rodar, e seu output irá voltar
para o console.

```shell
cd `which programa`
```

Ou seja, primeiro o comando which é executado e seu resultado é o caminho para o
programa, e em seguida este caminho é alimentado como argumento para o comando
cd, que entra na pasta. Muito show, não é?
