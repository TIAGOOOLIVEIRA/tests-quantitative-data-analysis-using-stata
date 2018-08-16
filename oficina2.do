

* como generate serve para criar variável
gen logvendas=ln(sales)
gen logsalario=ln(salary)
gen sales1=sales/1000 
reg logsalario logvendas 
reg lsalary lsales

*Modelo com vendas e valor de mercado
reg lsalary lsales lmktval 
* Comando predict tira a previsão do modelo
predict yprevisto
* Comando "predict , res" tira o resíduo do modelo 
predict residuo, res
* ou 
gen erro=(lsalary -yprevisto)

* gerar erro ao quadrado
gen resiudo2=residu^2


reg lsalary lsales lmktval profits
reg lsalary lsales profits

* comando de correlação das variáveis
correl lsalary lsales lmktval profits
