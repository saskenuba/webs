+++
title = "Diferença entre permuta, combinação e arranjo"
date = 2018-02-09T00:00:00-02:00
lastmod = 2024-02-21T00:58:38-03:00
draft = false
weight = 2010
url = "post/8/diferenca-entre-permuta-combinacao-e-arranjo"
+++

Sempre tive dificuldade de diferenciar estes três, então vou tentar
explicar da forma mais visual possível.

Isso é muito útil principalmente quando você está estudando
probabilidades, e se você for como eu, que confunde entre um e outro,
definitivamente será útil.


## Permuta {#permuta}

A permuta é utilizada para quando você quiser contar de quantos jeitos
diferentes pode-se organizar um número de elementos. Acredito que o
exemplo mais fácil da permuta são os anagramas. Pra quem não se
lembra, anagramas é o "jogo" de palavras que você faz, trocando as
letras de uma palavra de lugar, a fim de formar outra palavra.

Imagine a palavra SOL. São três letras. Vamos ver todas as
possibilidades.

```text
SOL
SLO
LOS
LSO
OSL
OLS
```

Fórmula da Permuta: <img src="/ltximg/posts_aba5f58a0dc8574dc2f29d9d91a09b87f241a1da.svg" alt="\(C = {n!}, \text{n = número de elementos}\)" class="org-svg" />

Seguindo o exemplo da palavra SOL, a fórmula aplicada seria a
seguinte:

<img src="/ltximg/posts_959e2c2bf5243d38acb604d4583e959640774cf2.svg" alt="\[C = {3!} = 6 \text{ possibilidades.}\]" class="org-svg" />

Outro exemplo seriam 15 carros em uma corrida, quais seriam todas as
possíveis combinações de posições de chegada de todos os pilotos?
Agora que temos a fórmula fica muito fácil. Vejamos:

<img src="/ltximg/posts_980dd3617481a9ce614b65248fe8b6de9abf9549.svg" alt="\[C = {15!} = \text{1 trilhão 307 bilhões 674 milhões e 368 mil possibilidades.}\]" class="org-svg" />

Wow!


## Arranjo {#arranjo}

Agora, voltando ao exemplo dos anagramas, imagine que nós desejamos
que as letras não possam assumir a mesma posição mais de uma vez. É um
pouco diferente da fórmula da permuta, onde agora vamos dividir o
resultado das combinações dos nossos elementos, com a nosso desejo de
que agora a ordem dos elementos tenham importância.

Fórmula do Arranjo:

<img src="/ltximg/posts_a2552698d8b60d67cb54814b4205321d19bc9724.svg" alt="\[C = {n! \over (n-p)!}\]" class="org-svg" />, onde <img src="/ltximg/posts_48e1fafad9afab3818cd19e2ff2f0577ca2fe0ac.svg" alt="\( n = \text{número total de elementos}, p = \text{restrição}\)" class="org-svg" />

Vamos seguir com o exemplo da palavra SOL, e após com a palavra
NOME. Desejamos agora que as letras NÃO repitam posições. Temos:

<img src="/ltximg/posts_9bdc09d9ed2c9d23b44f8491450e9d08cdcf5c93.svg" alt="\[C = {3! \over (3-1)!} = 3\text{ arranjos.}\]" class="org-svg" />

número total de elementos: 3;
posições que cada elemento pode ocupar: 1

```text
SOL
LSO
OLS
```

E agora com NOME:

<img src="/ltximg/posts_245246b82b919ef77dfcfaad62232081642cdd07.svg" alt="\(C = {4! \over (4-1)!} = 4\text{ arranjos.}\)" class="org-svg" />

número total de elementos: 4;
posições que cada elemento pode ocupar: 1

```latex
NOME
ONEM
MENO
EMON
```

Outro exemplo. Você pode também imaginar que temos o pódio de uma
competição, onde existem 30 judocas, mas somente são distribuídas três
medalhas, quais são todas as possibilidades de pódium possíveis?

<img src="/ltximg/posts_cff9476805e8ad6d6fbbd8ce662fadd1821b5ea2.svg" alt="\[C = {30! \over (30-3)! } = 24360 \text{ possibilidades.}\]" class="org-svg" />

Resumindo: no arranjo a ordem importa!


## Combinação {#combinação}

Agora que você já está sacando o arranjo, na combinação existe uma
sacada: a posição não importa! Porque na combinação João e Carlos, ou
Carlos e João são a mesma coisa!

Imagine agora que você está dentro um filme de terror, e junto de você
estão mais outras 3 pessoas e vocês precisam se separar em 2 grupos!
(Porque em todo filme de terror, as pessoas sempre se separam).

A fórmula é padrão é a seguinte:

<img src="/ltximg/posts_1eb51f727ea50801be639fa52c637d8c85e6050a.svg" alt="\[C = {n! \over p! * (n-p)!}\]" class="org-svg" />

onde: n = números total de elementos
p = restrição

Agora vamos aplicá-la no nosso problema:

<img src="/ltximg/posts_fe3381471b79ec4e9f8cd075fc121817a0daf49a.svg" alt="\[C = {4! \over 2! * (4-2)!} = 6 \text{ grupos diferentes.}\]" class="org-svg" />

<img src="/ltximg/posts_379a55d17a478f9cf8f897420e355fc4eef9b7a6.svg" alt="\[n = 4\]" class="org-svg" /> sobreviventes

<img src="/ltximg/posts_b66721f9961a6dae998c4a6f6b49e29a27ec8fb2.svg" alt="\[p = 2\text{ pessoas por grupo}\]" class="org-svg" />

Vamos verificar se são 6 grupos mesmo??

Total de pessoas: João, Maria, Carlos, Eu

```text
| Eu e João     | Maria e Carlos |
| Eu e Maria    | João e Carlos  |
| Eu e Carlos   | João e Maria   |
```

Yes! Exatamente 6 grupos diferentes. Se você tentasse efetuar esse
cálculo utilizando o "jeito" do arranjo, notaria que ele cria o dobro
de grupos, isso porque pro arranjo, o grupo Eu e João, e João e Eu são
diferentes!

Por isso que importante saber qual fórmula utilizar para situações diferentes.
