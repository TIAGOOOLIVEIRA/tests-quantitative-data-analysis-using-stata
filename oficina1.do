
* Comando use serve para abrir o banco de dados
use "D:\CEOSAL2.DTA", clear

* comando que apresenta as vari�veis da base de dados
describe

* comando summarize Para tirar estat�sticas das vari�veis
sum salary ceoten

* comando tabulate apresenta os valores das vari�veis e sua frequ�ncia
tab ceoten


* Comando regress representa a regress�o de M�nimos Quadrados Ordin�rios
* reg y x1 x2 x3
* MQO sal�rio=b0+b1*tempo
reg salary ceoten

