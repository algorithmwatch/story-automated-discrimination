# Data subsets for Google

google <- google %>%
  group_by(country, job, datetime) %>%
  mutate(impr_rel = impressions/sum(impressions)#,
         # clicks_rel = if_else(clicks > 0, clicks/sum(clicks), clicks)
         ) %>%
  ungroup()

google_male_female <- google %>%
  filter(gender != "undetermined") %>%
  group_by(country, job, datetime) %>%
  mutate(impr_rel = impressions/sum(impressions)) %>%
  ungroup()


# Data subsets for Facebook

facebook <- facebook %>%
  group_by(country, job, datetime) %>%
  mutate(impr_rel = impressions/sum(impressions)#,
         # clicks_rel = if_else(clicks > 0, clicks/sum(clicks), as.double(clicks))
         ) %>%
  ungroup()

facebook_male_female <- facebook %>%
  filter(gender != "undetermined") %>%
  group_by(country, job, datetime) %>%
  mutate(impr_rel = impressions/sum(impressions)) %>%
  ungroup()


# Data subsets for truck2

## Google

gg_truck2 <- gg_truck2 %>%
  group_by(country, job, variation, datetime) %>%
  mutate(impr_rel = impressions/sum(impressions)) %>%
  ungroup()

gg_truck2_male_female <- gg_truck2 %>%
  filter(gender != "undetermined") %>%
  group_by(country, job, variation, datetime) %>%
  mutate(impr_rel = impressions/sum(impressions)) %>%
  ungroup()


## Facebook

fb_truck2 <- fb_truck2 %>%
  group_by(country, job, variation, datetime) %>%
  mutate(impr_rel = impressions/sum(impressions)) %>%
  ungroup()

fb_truck2_male_female <- fb_truck2 %>%
  filter(gender != "undetermined") %>%
  group_by(country, job, variation, datetime) %>%
  mutate(impr_rel = impressions/sum(impressions)) %>%
  ungroup()
