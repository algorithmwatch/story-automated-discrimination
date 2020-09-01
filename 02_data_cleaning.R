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
  ungroup()
