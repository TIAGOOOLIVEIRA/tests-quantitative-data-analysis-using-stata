

* Mudei um pouco o modelo do que fiz em aula, aproveitei uma coisa que já tinha feito

* Modelo de Probabilidade Linear
reg approve white hrat unem male married dep yjob
predict prob_MPL
* note no modelo de probabilidade com Mínimos Quadrados há previsão acima de 1 (100%)
sum prob_MPL


* Logit
logit approve white hrat unem male married dep yjob
* O Deafult do Predict é a Probabilidade
predict prob_logit
* Quando vc faz o Predict com a opção ", xb" o que saí é o logit, fazendo expondencial disso, teremos o resultado da razão de chances (odds)
predict lo, xb
* Para saber que o efeito de cada variável na probabilidade devemos fazer o comando mfx, mas lembre que ele faz a conta na média das variáveis
mfx
* Para saber qual é o efeito marginal para um dado indivíduo,  vc tem que colocar as características dele
mfx, predict(p) at(hrat=50, unem=5, male=1, married=0, dep=1, yjob=1)
mfx, predict(p) at(hrat=10, unem=2, male=1, married=0, dep=1, yjob=10)
* No exemplo acima, o efeito do preconceito para os caras com mais tempo de serviço e menor participação dos gastos é menor



* Probit 
probit approve white hrat unem male married dep yjob
* O Deafult do Predict é a Probabilidade
predict prob_probit
* quando vc coloca o comando ", xb" após o modelo Probit o que sai é o resultado em desvião padrão da normal.
* Isto é, para achar a probabilidade vc tem que usar o comando "normal(nome da variável)"
* Por exemplo, se a previsão ", xb" for 1,96, então, a probabilidade será de 97,5%
predict po, xb
* Abaixo uma exemplo da conta para a segunda observação desta base
disp normal(1.479279)
* Qual o efeito marginal partindo da média das variáveis?
mfx, predict(p) at(hrat=50, unem=5, male=1, married=0, dep=1, yjob=1)
mfx, predict(p) at(hrat=10, unem=2, male=1, married=0, dep=1, yjob=10)
* o efeito do preconceito para os caras com mais tempo de serviço e menor participação dos gastos é menor
* Note que o efeito marginal do Probit é parecdio com o Logit


* Comando para a lista e que pode ser útil.
* Para fazer um teste t para uma determinada variável (ou combinação de variáveis) que vc quer testar mas que não seja o teste padrão contra zero (H0: beta=0) é o comando "lincom"
* Vc pode colocar o comando lincom e testar se uma variável é igual a outro valor (H0: beta=valor), por exemplo
* Abaixo um exemplo testando se o coeficiente casado poderia ser de 0,1
reg approve white hrat unem male married dep yjob
lincom _b[male]-0.10
