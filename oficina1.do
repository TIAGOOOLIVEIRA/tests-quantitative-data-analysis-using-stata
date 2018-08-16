
* Comando use serve para abrir o banco de dados
use "D:\CEOSAL2.DTA", clear

* comando que apresenta as variáveis da base de dados
describe

* comando summarize Para tirar estatísticas das variáveis
sum salary ceoten

* comando tabulate apresenta os valores das variáveis e sua frequência
tab ceoten


* Comando regress representa a regressão de Mínimos Quadrados Ordinários
* reg y x1 x2 x3
* MQO salário=b0+b1*tempo
reg salary ceoten

