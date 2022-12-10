# Lack of Fit Test  
- See Script for Null Hypothesis  

### Procedures  
**1) Run the interactions and get the ANOVA**

proc glm data = twitter;  
class gender (ref="0");     
model logfollowers = gender|FollowEES gender| Tweetsperwk/solution;  
run;  


**2) Run without Interactions and get the ANOVA**  

proc glm data = twitter plots = all;  
class gender (ref="0");   
model logfollowers = gender FollowEES Tweetsperwk/solution;
run;  

**3) Get Probability - See Script to copy Table**    
![image](https://user-images.githubusercontent.com/110003333/206823966-466cce38-c55b-42ad-bd23-65859cdc6788.png)

data pval;  
pvalue = 1-probF(5912.1, 2, 393);  
run;  

proc print data = pval;  
run;  

### R Code
pf(5912.1, 393, 2, lower.tail = FALSE)

