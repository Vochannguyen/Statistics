# Multiple Comparisons

## Bonferroni
Can be used for a variety of problems

proc glm data= TREX;
class bone;
model oxygen = bone;
means bone/ HOVTEST = BF BON;
run;

## Tukey - If assumptions are met
proc glm data= TREX;
class bone;
model oxygen = bone;
means bone/ HOVTEST = BF TUKEY;
run;

## Dunnett's" Multiple Comparisons to just one
