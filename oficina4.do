
* Análise gráfica para ver se 
scatter price lotsize 
scatter price sqrft

* TEste BP
* Passo 1 - salvar os resíduos de MQO
reg price lotsize sqrft bdrms
predict erro, res
* Passo 2 - Roda-se um modelo do erro ao quadrado contra as explicativas
gen erro2=erro^2
* Pode-se olhar o teste F
* onde H0: coeficientes do modelo igual à zero, ou seja, erro ao quadrado não está correlacionado com as explicativas o que equivale a ser homocedástico
reg erro2 lotsize sqrft bdrms
* ou teste LM, onde se calcula a estatístca n*R2 na qui-quadrada com k graus de liberdade - vide p-valor abaixo
disp chi2tail(3,14.0888)

* TEste White
* Passo 1 - salvar as previsão do modelo MQO
reg price lotsize sqrft bdrms
predict ychapeu
gen ychapeu2=ychapeu^2
* Passo 2 - Roda-se um modelo do erro ao quadrado contra a previsão e seu quadrado
reg erro2 ychapeu ychapeu2
* Daí olha-se a estatística F, onde H0: coeficientes do modelo igual à zero o que equivale a ser homocedástico
* ou teste LM, onde se calcula a estatístca n*R2 na qui-quadrada com 2 graus de liberdade - vide p-valor abaixo
disp chi2tail(2,16.2712)


* Uma Solução para heterocedasticidade seria MQG Factível
* O MQGeneralizado demandaria o conhecimento do desvio padrão de cada observação
* Como isso quase sempre não é conhecido, roda-se 
reg price lotsize sqrft bdrms
predict erro, res
* Gera o log do erro ao quadrado e roda contra X's 
gen lerro2=ln(erro^2)
reg lerro2 lotsize sqrft bdrms
* Salva-se a previ~so ao do modelo acima
predict lerro2previsto
*Gerando peso
gen h=exp(lerro2previsto)
* Roda-se o modelo anterior com os pesos criados (aqui equivale a um Mínimos Quadrados Ponderados)
reg  price lotsize sqrft bdrms [aw=1/h]



* Matriz de robusta de variância e covariância de White permite validar os testes t e F feitos nos modelo sem ter que mudar os coeficientes estimados
* Talvez seja a opção mais utilizada
reg price lotsize sqrft bdrms, rob



* Outras opção para arrumar problema de heterocedasticidade é rodar o modelo em log
* Modelo Log
reg lprice llotsize lsqrft bdrms
* Veja que pelo teste de BP, neste caso, em log, o modelo é homocedástico
predict errolog, res
gen errolog2=errolog^2
* Veja o teste F do modelo abaixo
reg errolog2 llotsize lsqrft bdrms

* É possível rodar o modelo em log e com matriz robusta de White
reg lprice llotsize lsqrft bdrms, rob

