# Krusal-Wallis

R CODE
kruskal.test(weight ~ group, data = my_data)

As the p-value is less than the significance level 0.05, we can conclude that there are significant differences between the treatment groups.

Multiple pairwise-comparison between groups
pairwise.wilcox.test(PlantGrowth$weight, PlantGrowth$group,
                 p.adjust.method = "BH")


![image](https://user-images.githubusercontent.com/110003333/206831570-34cda7ae-318f-4623-99e2-6b1cfb70c844.png)
