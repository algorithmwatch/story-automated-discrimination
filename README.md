# Automated Discrimination in online ad delivery

This folder contains the results of an experiment that assesses how Facebook and Google skew the distribution of advertisements, absent any targeting from the advertiser. It is a replication of the following paper:

> Ali, M., Sapiezynski, P., Bogen, M., Korolova, A., Mislove, A., & Rieke, A. (2019). Discrimination through Optimization: How Facebook's Ad Delivery Can Lead to Biased Outcomes. _Proceedings of the ACM on Human-Computer Interaction_, 3(CSCW), 1-30.

All analyses are based on the number of **impressions**. However, a sentence in the article mentions people who saw the ads. This corresponds to the **reach** of the ads. Data about reach is available in `input/facebook.csv`.

### These are the results of the main experiment on Facebook.

![](https://github.com/algorithmwatch/automated-discrimination/blob/main/output/img/zmyqK-when-deciding-who-to-show-an-ad-to-facebook-relies-on-gross-stereotypes.png?raw=true)

### A similar experiment on Google provided different results. However, for a reason we ignore, Google did not let us run ads with an unlimited bid. Capping the bid might have the effect of disturbing the optimization algorithm.

![](https://github.com/algorithmwatch/automated-discrimination/blob/main/output/img/92d1m-google-seems-to-discriminate-much-less.png?raw=true)

### In line with the paper by Ali et al., we found that images were likely to be the main factor for Facebook's discrimination.

![](https://github.com/algorithmwatch/automated-discrimination/blob/main/output/img/FkoAh-facebook-uses-the-image-of-the-ad-to-discriminate.png?raw=true)


### Interestingly, the discrimination starts _before_ the ad starts to run. It is not an adaptation to the ad's click-through rate (CTR).

![](https://github.com/algorithmwatch/automated-discrimination/blob/main/output/img/Mc3UY-facebook-does-not-optimize-based-on-an-ad-s-ctr.png?raw=true)


### However, the overall CTR is correlated for both genders. This suggests that platforms successfully identify users based on their likelihood of clicking on an ad.

![](https://github.com/algorithmwatch/automated-discrimination/blob/main/output/img/05Na4-ctr-between-gender-mostly-correlate-on-facebook.png?raw=true)

### We conducted additional experiments. Here, we checked whether the delivery of an ad changed based on the salary that was advertised. There is no apparent discrimination.

![](https://github.com/algorithmwatch/automated-discrimination/blob/main/output/img/QOdFS-no-discrimination-based-on-salary.png?raw=true)

![](https://github.com/algorithmwatch/automated-discrimination/blob/main/output/img/DDeUp-no-discrimination-based-on-salary-age-.png?raw=true)
