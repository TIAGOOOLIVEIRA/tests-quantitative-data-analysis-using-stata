* Primeiro, indique ao banco de dados qual a sua variável de tempo
tsset year

reg c y 
predict erro, res
* Erro demora a voltar a ficar próximo a zero
line erro year


*  Teste de Durbin Watson Manual
reg erro l(1).erro
disp 2*(1-.5897059)

* Teste de B. Godfrey para 4 defasadas
* Modelo do erro conta 4 defasadas e a variável explicativa (y)
reg erro y  l(1/4).erro
disp chi2tail(4,11.22)

* Testes em um comando
reg c y
estat bgodfrey, lags(4)
estat dwatson

* Métodos para corrigir autocorrelação
prais c y 
prais c y, corc

redict erro1, res
line erro1 year


* Utilizando o diferencial ou as variações percentuais, o problema de correlaçã pode desaparecer, veja como o gráfico se altera
reg gc gy
predict gerro, res
line gerro year 
estat bgodfrey, lags(4)
estat dwatson
