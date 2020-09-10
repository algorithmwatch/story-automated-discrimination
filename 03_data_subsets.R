# Data subsets for Google

google <- google %>%
  group_by(country, job, datetime) %>%
  mutate(clicks_rel = if_else(clicks > 0, clicks/sum(clicks), clicks),
         impr_rel = impressions/sum(impressions)) %>%
  ungroup()

google_male_female <- google %>%
  filter(gender != "undetermined") %>%
  group_by(country, job, datetime) %>%
  mutate(clicks_rel = if_else(clicks > 0, clicks/sum(clicks), clicks),
         impr_rel = impressions/sum(impressions)) %>%
  ungroup()


# Data subsets for Facebook

facebook <- facebook %>%
  group_by(country, job, datetime) %>%
  mutate(clicks_rel = if_else(clicks > 0, clicks/sum(clicks), as.double(clicks)),
         impr_rel = impressions/sum(impressions)) %>%
  ungroup()

facebook_male_female <- facebook %>%
  filter(gender != "undetermined") %>%
  group_by(country, job, datetime) %>%
  mutate(clicks_rel = if_else(clicks > 0, clicks/sum(clicks), as.double(clicks)),
         impr_rel = impressions/sum(impressions)) %>%
  ungroup()


# Data subsets for truck2

## Google

gg_truck2 <- gg_truck2 %>%
  group_by(country, job, variation, datetime) %>%
  mutate(clicks_rel = if_else(clicks > 0, clicks/sum(clicks), clicks),
         impr_rel = impressions/sum(impressions)) %>%
  ungroup()


## Facebook

fb_truck2 <- fb_truck2 %>%
  group_by(country, job, variation, datetime) %>%
  mutate(clicks_rel = if_else(clicks > 0, clicks/sum(clicks), as.double(clicks)),
         impr_rel = impressions/sum(impressions)) %>%
  ungroup()
