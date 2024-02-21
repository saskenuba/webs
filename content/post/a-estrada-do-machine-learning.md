+++
title = "A estrada do machine learning"
date = 2018-04-02
lastmod = 2022-11-12T23:21:06-03:00
draft = false
weight = 2009
+++

Algo que me impulsionou a ir um pouco mais a fundo nos fundamentos do machine
learning, foi essa gana de saber como a “mágica” do algoritmo acontece, porque
no início sempre foram umas equações que no mínimo só um doutorando em
matemática para entender, mas que ao longo de meus estudos passei a notar que
não era mais um bicho de 7 cabeças.

Logo abaixo, vou listar os conhecimentos que eu estou estudando ou já estudei, e
que ajudou a me aprofundar no tema, e após uma descrição do porquê estuda-los e
o material principal que li sobre ou fiz um curso.

Data da última alteração: 07/06/2018


## Habilidades a serem desenvolvidas: {#habilidades-a-serem-desenvolvidas}

-   INGLÊS!!!!!!!!!!
-   Básico de Programação
-   Cálculo
    -   Limite, derivada e integral
    -   Somas de Riemann
    -   Derivadas Parciais
    -   Otimização
-   Álgebra Linear
-   Estatística
    -   Estatística Descritiva
    -   Média, Mediana, Moda, Variância, Correlação, Covariância, etc...
-   Distribuições
-   Probabilidade
-   Algoritmos de Machine Learning


### Inglês {#inglês}

Sério, se você não sabe inglês e quer entrar nesse mundo de big data, machine
learning, e todas essas palavras legais, recomendo você se matricular em um
curso de inglês agora. O material disponível de qualidade em português ainda é
muito escasso, e todas as grandes bibliotecas tem documentação na língua da
liberdade. Basicamente 99% dos cursos que irei listar aqui são em inglês, então
me perdoe, rs. Básico de Programação

Saber programar, uma vez que ainda não exista um software onisciente capaz de
simplesmente fazer o que você tem em mente, é um pilar do machine learning,
afinal para poder transcrever os modelos para o computador é por meio da
programação. Manipulação de vetores e matrizes, as plotagens gráficas, testes de
funcionamento, mas veja, não é necessário ser um mestre da montanha no assunto,
pois uma vez que você tenha seu modelo funcional, ele irá (provavelmente) passar
por otimizações pelos engenheiros de software a fim de ser dado o deploy.

Fiz um curso chamado CS50 que é focado em quem não sabe nada mesmo, e te dá um
fundamento bem bacana pra continuar por conta própria.

CS50, Harvard, EDX:
<https://www.edx.org/course/cs50s-introduction-computer-science-harvardx-cs50x>


### Cálculo {#cálculo}

Para todo algoritmo existe um modelo, uma equação, que lhe diz como manipular os
dados para que você obtenha o resultado final, e para que você entenda de
verdade como isso funciona e também implementar o algoritmo na linguagem de
programação de sua escolha é necessário entender cálculo.

Se você, jovem perspicaz e sapiente, esteve em situação semelhante a minha, em
que estudou em escola pública e teve uma educação bem deficiente, seus problemas
acabaram! E igualmente se não foi o caso, uma fundação boa em matemática é
essencial para poder estudar cálculo. E um assunto é necessário que se conheça é
otimização, acredite em mim. Isso porque no ML existe o conceito de minimizar a
função de erro, isto é, para você poder predizer os resultados com a maior
precisão possível, então é recomendado você dar uma chapiscada nesse assunto.

E agora lhes apresento o Khan Academy – para quem não conhece – onde eu aprendi
anos de matemática em meses, um lugar mágico onde há todos esses conceitos que
mencionei de matemática.

Porém eu realmente recomendo vocë ir pegando a matemática conforme ela vai
aparecendo em seus problemas, porque fazer todo o currículo de uma só vez pode
ser bem massante e sua motivação ir por água abaixo.

Cálculo, Khan Academy: <https://pt.khanacademy.org/math/calculus-home>

Essência do Cálculo, 3Blue1Brown, Youtube:
<https://www.youtube.com/watch?v=WUvTyaaNkzM&list=PLZHQObOWTQDMsr9K-rj53DwVRMYO3t5Yr>


### Estatística {#estatística}

A grande difereça que eu percebi nesse tempo estudando estatística é que ela
possui ênfase na inferência, enquanto machine learning é focada na predição. O
importante aqui é ter uma fundação sólida em certos assuntos básicos como Média,
Mediana, Moda, Desvio Padrão, algumas distribuições como a Normal(Gauss),
Exponencial Negativa e também em algumas técnicas de reamostragem como
bootstrapping.

Um curso xuxu beleza mesmo é o Biostatistics Mathematical Bootcamp 1, mas não se
engane, ele é BEM intensivo mesmo, e nele acredito que se encontra tudo o que
você precise para conseguir entender a maioria das coisas que encontrar pela
frente.

Biostatistics Mathematical Bootcamp 1, Coursera:
<https://www.coursera.org/learn/biostatistics/> Algoritmos de Machine Learning

Depois de tomar tanto tapa na cara, chegamos ao grande dia! Agora que temos toda
a fundação da nossa pirâmide de conhecimentos podemos começar a estudar os
algoritmos de Machine Learning.

O primeiro e grande curso que recomendo é o Machine Learning, ministrado pelo
Andrew NG, que realmente abre as portas sobre a utilização de ML para os
problemas, demonstrando o funcionamento de regressão Linear(olha a estatística
aqui de novo) para predizer preços de casas, regressão logística para introduzir
o conceito de classificadores, verá o básico de uma rede neural e como funciona
um perceptron, as melhores maneiras de você verificar os erros do seu modelo e
por aí vai.

Porém como eu havia dito, o curso tenta abranger uma grande área, te mostrando a
intuição de alguns algoritmos e como aplicá-los, mas ainda existem muitos outros
super úteis que não são mostrados, como aprendizado com Árvores de Decisão,
Random Forests, Classificador Naive Bayes.

E caso você tenha visto tudo isso e queira adentrar mais ainda, existe a
especialização em Deep Learning também distribuída pelo Andrew NG, que mostra
novamente desde o básico de redes neurais, até modelos mais avançados como redes
neurais recorrentes(GANs) e também como estruturar um modelo para uma aplicação
como audio, vídeo. _Fantastique my friend_.

Coursera, Machine Learning <https://pt.coursera.org/learn/machine-learning>

Coursera, Deep Learning: <https://www.coursera.org/specializations/deep-learning>

Fast.ai: <http://www.fast.ai/>
