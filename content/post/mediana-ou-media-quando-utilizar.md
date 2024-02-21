+++
title = "Mediana ou média? quando utilizar"
date = 2018-06-15
lastmod = 2024-02-20T20:40:16-03:00
draft = false
weight = 2008
url = "/post/10"
+++

Em primeiro lugar, quando falamos de mediana e média, esta última também
conhecida como valor esperado, estamos falando de uma estatística de tendência
central, ou seja, queremos saber o centro de nossa distribuição.

Embora não exista uma regra definida sobre o uso de um ou outro, em linhas
gerais a mediana é uma medida robusta que desconsidera outliers (valores
extremos), lidando melhor com obliquidade, do inglês skewness, sendo comumente
utilizada pra verificar a tendência central de salários, uma vez que estes são
muito influenciados por poucos que ganham muito. Porém algumas vezes queremos
que nossas medidas sejam influenciadas por estes valores extremos.

A maneira ideal para verificar qual medida é a mais representativa de nossos
dados, seria plotar a distribuição destes dados a fim de verificar sua
assimetria e obliquidade, desta forma podemos realizar esta verificação, pois o
importante é saber de onde vem esta assimetria e entende-la de acordo.
Adicionalmente, devemos também considerar o “propósito” desta variável além de
sua natureza “absoluta“ ou “relativa”.

Note que a média também pode ser calculada após remover-se os outliers, onde
calcular a mediana não faz muito sentido. O segredo é conhecer bem os números
que se trabalham.

Agora vou dar alguns exemplos e na sequência, colocarei qual a medida mais
apropriada.

**Em determinado mês, em uma vizinhança mora-se 10 pessoas, com a média de salário de R$5.000,00. E no outro mês um milionário se muda para esta mesma vizinhança e este ganha R$50.000,00 por mês, elevando a média salarial para R$9.090,90. Qual medida é que melhor representa essa população?**

A medida que melhor representa é a mediana. Pois neste caso R$9.090,90 não
representa efetivamente ninguém desta vizinhança. Já na mediana o valor seria de
R$5.000,00.

**Queremos determinar o tempo de prisão dado por um juiz por certo crime. Quanto
tempo o próximo réu pode esperar pegar de prisão?**

A medida que melhor representa é a média.

**Tempo de corrida de 10 voltas em uma pista para determinado corredor. Em quanto
tempo podemos esperar ele completar a pista na próxima vez que este correr?**

Neste caso a média é a medida adequada.

**Notas em uma matéria entre vários estudantes em uma sala. Assumindo que o nível
de dificuldade da prova é uniforme.**

É uma boa ideia considerar seu aspecto relativo através de medidas como mediana,
quartis e etc.

**Notas em várias matérias para um único estudante. A pontuação individual
mostrará o nível de proficiência já descontado pela dificuldade do exame.**

Então para chegarmos ao nível geral de proficiência, tiramos a média.


## Conclusão {#conclusão}

O grande segredo é conhecer bem o número em que se está trabalhando a fim de
utilizar a medida apropriada. Espero ter ajudado nesta questão bem interessante.
