
* Model Irrestrito
reg salary sales mktval profits ceoten ceotensq
* Teste F para testes sobre coeficientes 
test mktval=profits=0
* Teste F Manual
* Model Restrito
reg salary sales ceoten ceotensq
* ((SQResíduo Restrito - SQResíduo Irrestrito)/q)/(SQResíduo Irrestrito)/n-k-1)
disp ((48402412.6-46647707.8)/2)/(46647707.8/171)
disp Ftail(2,171,3.2161765)
* Ftail(q,n-k-1,valor da estatística) 

reg salary sales mktval ceoten ceotensq grad


reg sleep totwrk educ age agesq yngkid male 
reg sleep totwrk educ age agesq yngkid if male==1

gen female=1 if male==0
replace female=0 if male==1

reg sleep totwrk educ age agesq yngkid male female


gen lsleep=ln(sleep)
reg lsleep totwrk educ age agesq yngkid male 



* Auxílio lista 
reg price lotsize sqrft bdrms
* Previsão em um ponto
disp _b[_cons]+_b[lotsize]*10000+_b[sqrft]*2300+_b[bdrms]*4
* Gerar variáveis centradas
gen lotsize1=lotsize-10000
gen sqrft1=sqrft-2300
gen bdrms1=bdrms-4
* novo modelo com as variáveis transformadas
reg price lotsize1 sqrft1 bdrms1




