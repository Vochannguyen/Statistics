# Contrast

![image](https://user-images.githubusercontent.com/110003333/206827218-c6f8fc6b-6acd-4e8f-b38c-bbd641bb2fe7.png)


proc glm data = WebsiteTest;  
class WebsiteType;  
model ClickRate = WebsiteType;  
lsmeans WebsiteType / pdiff;  
estimate “Original versus the Average of Ver2, Ver3 and Ver4” WebsiteType 3 0 -1 -1 -1 divisor = 3  
run;  

![image](https://user-images.githubusercontent.com/110003333/206831858-dab3c247-8e4c-4640-884b-f150dcea2002.png)
