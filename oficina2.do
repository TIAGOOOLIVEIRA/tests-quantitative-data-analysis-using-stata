

* como generate serve para criar vari�vel
gen logvendas=ln(sales)
gen logsalario=ln(salary)
gen sales1=sales/1000 
reg logsalario logvendas 
reg lsalary lsales

*Modelo com vendas e valor de mercado
reg lsalary lsales lmktval 
* Comando predict tira a previs�o do modelo
predict yprevisto
* Comando "predict , res" tira o res�duo do modelo 
predict residuo, res
* ou 
gen erro=(lsalary -yprevisto)

* gerar erro ao quadrado
gen resiudo2=residu^2


reg lsalary lsales lmktval profits
reg lsalary lsales profits

* comando de correla��o das vari�veis
correl lsalary lsales lmktval profits
