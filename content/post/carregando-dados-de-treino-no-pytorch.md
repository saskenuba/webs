+++
title = "Carregando dados de treino no PyTorch"
date = 2019-08-08
lastmod = 2024-02-20T20:42:42-03:00
tags = ["python", "pytorch"]
draft = false
weight = 2003
url = "/post/15"
+++

O framework Pytorch tem um jeito muito simples de você carregar os dados para
criar sets de treinamento, desenvolvimento e teste através de classes que
fornecem abstrações. O objetivo delas é fornecer uma maneira genérica de
carregar datasets de QUALQUER tipo, pois cabe ao programador decidir como são
carregadas. Podem ser imagens, arquivos de áudio e qualquer outro tipo.

Estas classes são Dataset e Dataloader, disponibilizadas pela biblioteca
**torch.utils.data**, onde conseguimos extender sua funcionalidade para que atue
exatamente do modo como precisamos.

Para este tutorial é suposto que você tenha alguns arquivos organizados para
serem utilizados para o treinamento. Note que não é necessário entender muito
sobre orientação a objeto em Python, mas ajuda um pouco.

Você pode tanto seguir os passos dentro de um ambiente Jupyter Notebook, ou em
uma IDE, fica a seu critério. Eu pessoalmente sugiro que faça pelo notebook,
pois é bem tranquilo de ficar reiniciando os processos e tudo mais.

Para todo o conteúdo desta postagem, vamos utilizar as seguintes importações:

```python
import pandas as pd # interpretação de arquivos .csv e .xls
import numpy as np
import torch
import librosa # responsável por transformar árquivos de áudio em vetores numpy
import cv2 # carregar imagens em vetores numpy
from torch.utils.data import DataLoader, Dataset, SubsetRandomSampler
```

E a seguinte estrutura de pastas:

```text
.
└── Projeto
    ├── main.py
    └── dataset
        ├── training.csv
        └── arquivos
            ├── imagem3.jpg
            ├── imagem2.jpg
            └── imagem1.jpg
```

O arquivo **training.csv** contêm o caminho relativo da imagem, e sua etiqueta
separada por vírgula. Primeira linha consiste no título das colunas.

```text
caminho,etiqueta
arquivos/imagem1.jpg,gato
arquivos/imagem2.jpg,não-gato
arquivos/imagem3.jpg,gato
```


## Utilizando a classe Dataset {#utilizando-a-classe-dataset}

O primeiro passo é criar uma classe que herdará a classe abstrata **Dataset**.
Vamos olhar para o esqueleto de nossa classe MeuDataset.

```python
class MeuDataset(Dataset):
    '''Classe que representa nosso dataset. Deve herdar da classe Dataset, em torch.utils.data
    '''

    def __init__(self, caminho_raiz):
        '''Define os valores iniciais.'''
        self.caminho_raiz = caminho_raiz

    def __len__(self):
        '''Número total de amostras'''
        return NotImplemented

    def __getitem__(self, indice):
        '''Retorna o item de número determinado pelo indice'''
        return NotImplemented
```

Para utilizar a classe Dataset do Pytorch, precisamos implementar as três
funções, `__init__`, `__len__` e `__getitem__`.

`__init__`: Representa o nosso construtor. Quando a classe for iniciada,
atribuíremos alguns valores aos atributos, como por exemplo, o caminho da pasta
onde estão localizado os arquivos.

`__len__`: Responsável por retornar o tamanho total do dataset quando chamamos
len(dataset).

`__getitem__`: Retorna o item escolhido através do índice. Quando chamemos
dataset[0] irá retornar o primeiro item do dataset.

Vamos começar por específicar a localização do nosso arquivo .csv, que contém o
caminho do arquivo e sua etiqueta, e após isso vamos carregá-lo utilizando a
biblioteca pandas.

```python
class MeuDataset(Dataset):
    '''Classe que representa nosso dataset. Deve herdar da classe Dataset, em torch.utils.data'''

    def __init__(self, pasta_raiz, nome_csv):
        '''Define os valores iniciais.

        Parâmetros:
            pasta_raiz: string contendo a pasta raiz do dataset (caminho relativo)
            nome_csv:  string contendo o nome do arquivo .csv
        '''
        self.pasta_raiz = pasta_raiz
        self.dados_csv = pd.read_csv(pasta_raiz + nome_csv, delimiter=",")

    def __len__(self):
        '''Número total de amostras'''
        return self.dados_csv.shape[0]

    def __getitem__(self, indice):
        '''Retorna o item de número determinado pelo indice'''
        return NotImplemented
```

E testamos para ver se funcionou:

```shell
dataset = MeuDataset("./dataset/", "training.csv")
dataset_size = len(dataset)
>> 3
```

Perfeito, tudo funcionou como esperado. Agora o próximo passo é implementar a
função para selecionar um arquivo através de um índice.

Criamos agora duas novas variáveis que são calculadas após os dados csv serem
carregados. Uma será para conter o caminho dos arquivos, e outra para conter as
etiquetas.

```python
class MeuDataset(Dataset):
    '''Classe que representa nosso dataset. Deve herdar da classe Dataset, em torch.utils.data'''

    def __init__(self, pasta_raiz, nome_csv):
        '''Define os valores iniciais.

        Parâmetros:
            pasta_raiz: string contendo a pasta raiz do dataset (caminho relativo)
            nome_csv:  string contendo o nome do arquivo .csv
        '''
        self.pasta_raiz = pasta_raiz
        self.dados_csv = pd.read_csv(self.pasta_raiz + nome_csv, delimiter=",")
        self.dados_caminhos = self.dados_csv.iloc[:, 0]
        self.dados_etiquetas = self.dados_csv.iloc[:, 1]

    def __len__(self):
        '''Número total de amostras'''
        return self.dados_csv.shape[0]

    def __getitem__(self, indice):
        '''Retorna o item de número determinado pelo indice'''
        x = cv2.imread(self.pasta_raiz + self.dados_caminhos[indice])
        y = self.dados_etiquetas[indice]

        return x, y
```

Com isso, ao rodar dataset[0] você receberá uma tupla, onde o primeiro elemento
é uma matriz numpy, e o segundo elemento será a etiqueta deste arquivo.

```text
dataset = MeuDataset("./dataset/", "training.csv")
dataset[0]
>>>
(array([[[ 94,  26,   0],
         [ 93,  25,   0],
         [ 96,  24,   0],
         ...,]], 'gato')
```

Essa facilidade com que podemos criar e explorar os dados é um dos atrativos que
faz PyTorch ser muito bacana de trabalhar. Além disso, é possível realizar
transformações com os dados no momento em que se carrega o arquivo com as
**transformações**. É possível transformar o arquivo diretamente em um tensor,
croppar, reescalonar e normalizar bastando criar classes de transformações. Como
bônus estarei demonstrando na última seção deste tutorial.

Beleza, agora que temos o dataset pronto para se trabalhar, como podemos
dividí-lo em lotes de 32, 64. Ou ainda separar em lotes de treinamento e teste?
Calma meu jovem padawan, vou explicar todo o processo na próxima seção, onde
conversaremos sobre **DataLoaders**.
