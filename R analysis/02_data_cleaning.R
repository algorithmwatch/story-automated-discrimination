# Data cleaning for Google data

google <- google %>%
  clean_names() %>%
  filter(impressions > 0) %>%
  select(campaign_name, gender = criteria, clicks, impressions, ctr, datetime) %>%
  separate(campaign_name, into = c("country", "job"), sep = " - ") %>%
  mutate(gender = str_to_lower(gender))

google <- google %>%
  group_by(country) %>%
  mutate(time = interval(datetime, start = min(datetime)) %>% time_length(unit = "hour")) %>%
  ungroup() %>%
  mutate(job = if_else(job == "Machine Learning developer", "Machine Learning", job))


# Truck2 data

gg_truck2 <- gg_truck2 %>%
  clean_names() %>%
  filter(impressions > 0) %>%
  select(campaign_name, gender = criteria, clicks, impressions, ctr, datetime) %>%
  separate(campaign_name, into = c("country", "job", "variation"), sep = " - ") %>%
  mutate(gender = str_to_lower(gender))

gg_truck2 <- gg_truck2 %>%
  group_by(country) %>%
  mutate(time = interval(datetime, start = min(datetime)) %>% time_length(unit = "hour")) %>%
  ungroup()
