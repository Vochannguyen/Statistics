# Paired (Matched Pairs Dependent) T-test

![image](https://user-images.githubusercontent.com/110003333/206831164-ac32a42e-d7f8-4284-b866-8eeb603a4c23.png)


![image](https://user-images.githubusercontent.com/110003333/206831180-a06abffd-894f-415b-acf0-c2087c683232.png)

![image](https://user-images.githubusercontent.com/110003333/206831188-93f9797a-b481-417b-b722-beb41bd322c4.png)

## Sample 1


data monster;
input drink $ num;
datalines;
monster 300
monster 310
monster 290 
monster 305
monster 302
monster 290
monster 340
monster 340
control 280
control 310
control 270
control 280
control 265
control 300
;

proc print data=monster;
run;

##SAS Code for Kruskal Wallis Test
proc npar1way data = monster wilcoxon;
class drink;
var num;
exact HL Wilcoxon;
run;
