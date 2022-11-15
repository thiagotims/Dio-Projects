## **Classificação de imagem utilizando CNN e Transfer Learning**

#### **Descrição sucinta do Desafio**

O projeto de Transfer Learning em Python consiste em aplicar o método de Transfer Learning em uma rede de Deep Learning na linguagem Python no ambiente COLAB.

#### **Detalhes do Desafio**
- Para exemplo, utilizaremos o seguinte projeto que realiza Transfer Learning com o Dataset do MNIST: https://colab.research.google.com/github/kylemath/ml4a-guides/blob/master/notebooks/transfer-learning.ipynb 

- O dataset utilizado engloba duas classes: gatos e cachorros. Uma descrição da base de dados pode ser visualizada neste link: https://www.tensorflow.org/datasets/catalog/cats_vs_dogs. 
>
- Já o dataset para download pode ser acessado por meio deste outro link: https://www.microsoft.com/en-us/download/details.aspx?id=54765. 
>
- **Observações:** Neste projeto, você pode usar sua própria base de dados (exemplo: fotos suas, dos seus pais, dos seus amigos, dos seus animais domésticos, etc), o exemplo de gatos e cachorros, pode ser substituído por duas outras classes do seu interesse. O Dataset criado em nosso projeto anterior, pode ser utilizado agora. 

#### **Projeto**
#### **Objetivo geral**
A partir do desafio proposto, a ideia deste projeto é treinar um modelo CNN para classificar se as imagens utilizadas correspondem a um cachorro ou gato.
> 
#### **Objetivos específicos**
- Desenvolver uma rede neural convolucional (CNN) para classificar fotos de cães e gatos;
- Carregar e preparar fotos de cães e gatos para modelagem;
- Desenvolver uma rede neural convolucional para classificação de fotos do zero e melhorar o desempenho do modelo;
- Desenvolver um modelo para classificação de fotos usando aprendizado de transferência (Transfer Learning).

#### **Recomendação**
- Para acelerar a execução desse script, sugere-se que seja utilizado o recurso GPU, disponível no Google Colab em Editar > Configurações do notebook > Acelerador de hardware 'GPU'.
#### **Nota**
- Também é possível ajustar o número de 'epoch' do treinamento para um número menor para acelerar a execução desse script (ex.: 10). Neste caso, para bons resultados, não recomenda-se ajustar para um número inferior a 10.

- **Tempo aproximado de Execução deste script:** 3h15min, aplicando-se a GPU do Colab, com epoch = 50 no treinamento do modelo.
