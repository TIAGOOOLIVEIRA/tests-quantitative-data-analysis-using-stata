

* Mudei um pouco o modelo do que fiz em aula, aproveitei uma coisa que j� tinha feito

* Modelo de Probabilidade Linear
reg approve white hrat unem male married dep yjob
predict prob_MPL
* note no modelo de probabilidade com M�nimos Quadrados h� previs�o acima de 1 (100%)
sum prob_MPL


* Logit
logit approve white hrat unem male married dep yjob
* O Deafult do Predict � a Probabilidade
predict prob_logit
* Quando vc faz o Predict com a op��o ", xb" o que sa� � o logit, fazendo expondencial disso, teremos o resultado da raz�o de chances (odds)
predict lo, xb
* Para saber que o efeito de cada vari�vel na probabilidade devemos fazer o comando mfx, mas lembre que ele faz a conta na m�dia das vari�veis
mfx
* Para saber qual � o efeito marginal para um dado indiv�duo,  vc tem que colocar as caracter�sticas dele
mfx, predict(p) at(hrat=50, unem=5, male=1, married=0, dep=1, yjob=1)
mfx, predict(p) at(hrat=10, unem=2, male=1, married=0, dep=1, yjob=10)
* No exemplo acima, o efeito do preconceito para os caras com mais tempo de servi�o e menor participa��o dos gastos � menor



* Probit 
probit approve white hrat unem male married dep yjob
* O Deafult do Predict � a Probabilidade
predict prob_probit
* quando vc coloca o comando ", xb" ap�s o modelo Probit o que sai � o resultado em desvi�o padr�o da normal.
* Isto �, para achar a probabilidade vc tem que usar o comando "normal(nome da vari�vel)"
* Por exemplo, se a previs�o ", xb" for 1,96, ent�o, a probabilidade ser� de 97,5%
predict po, xb
* Abaixo uma exemplo da conta para a segunda observa��o desta base
disp normal(1.479279)
* Qual o efeito marginal partindo da m�dia das vari�veis?
mfx, predict(p) at(hrat=50, unem=5, male=1, married=0, dep=1, yjob=1)
mfx, predict(p) at(hrat=10, unem=2, male=1, married=0, dep=1, yjob=10)
* o efeito do preconceito para os caras com mais tempo de servi�o e menor participa��o dos gastos � menor
* Note que o efeito marginal do Probit � parecdio com o Logit


* Comando para a lista e que pode ser �til.
* Para fazer um teste t para uma determinada vari�vel (ou combina��o de vari�veis) que vc quer testar mas que n�o seja o teste padr�o contra zero (H0: beta=0) � o comando "lincom"
* Vc pode colocar o comando lincom e testar se uma vari�vel � igual a outro valor (H0: beta=valor), por exemplo
* Abaixo um exemplo testando se o coeficiente casado poderia ser de 0,1
reg approve white hrat unem male married dep yjob
lincom _b[male]-0.10
