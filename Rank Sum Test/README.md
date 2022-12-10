# Paired (Matched Pairs Dependent) T-test

### Wilcox Signed Rank Test
This test can only be used when you have a data set of dependent observations who has two set of different data on the same person.

1) Check for Normality and then Check if They have the same Sample Size
![image](https://user-images.githubusercontent.com/110003333/206860145-2d1a3094-97f5-4217-b9f2-4afa6253e876.png)
![image](https://user-images.githubusercontent.com/110003333/206860163-5fac7f6d-fd15-436b-a451-4db94b819b24.png)
















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
