# Data import for Google
# is different from FB because the reports were not separated for countries - all in one folder

folder <- "data/google/"
subfolder <- "gender"
filenames_google <- list.files(paste0(folder, subfolder), full.names = T)
filenames_google <- filenames_google[-1] # remove the test run results

google <- tibble() # start with an empty dataframe
for (file in filenames_google) { # loop through all the files in the google/gender/ folder
  next_report <- read_excel(file)
  next_report$datetime <- str_extract(file, "2020.+(?=\\.xlsx)") %>% # extract the time of the report creation
    as_datetime()
  google <- rbind(google, next_report)
}
rm(next_report)


# Data import for Facebook
# and cleaning for Facebook data

clean_facebook_data <- function(input) {
  if("Campaign.Name" %in% names(next_report)){
    # Cleaning for new reports
    input <- input %>%
      clean_names() %>%
      filter(impressions > 0) %>%
      select(country = campaign_name, job = ad_set_name, gender, clicks = results, impressions, datetime) %>%
      mutate(country = str_extract(country, "[:upper:]{2}"),
             gender = case_when(gender == "unknown" ~ "undetermined",
                                TRUE ~ gender),
             ctr = clicks/impressions,
             job = if_else(job == "Preschool teacher", "Child care worker", job))# we changed the term afterwards for accuracy
  } else {
    # Cleaning for old reports
    input <- input %>%
      clean_names() %>%
      filter(impressions > 0) %>%
      select(ad_set_name, gender, clicks = results, impressions,
             ctr = ctr_link_click_through_rate, # not available for France
             datetime) %>%
      separate(ad_set_name, into = c("country", "country_long", "job"), sep = " - ") %>%
      mutate(gender = case_when(gender == "unknown" ~ "undetermined",
                                TRUE ~ gender),
             ctr = ctr/100, # not available in France
             job = if_else(job == "Preschool teacher", "Child care worker", job)) %>% # we changed the term afterwards for accuracy
      select(-country_long)
  }
}

country_folder <- "data"
subfolder <- "/facebook/gender"
filenames_facebook <- c()
for (country in list.dirs(country_folder, recursive = FALSE)) {
  filenames_facebook <- c(filenames_facebook, list.files(paste0(country, subfolder), full.names = TRUE))
}


facebook <- tibble() # start with an empty dataframe
for (file in filenames_facebook) { # loop through all the files in the facebook/gender/ folder
  next_report <- read.csv(file)
  next_report$datetime <- str_remove(file, "\\.csv") %>% # extract the time of the report creation
    ymd_hm()
  next_report <- clean_facebook_data(next_report)
  facebook <- rbind(facebook, next_report)
}
rm(next_report)

facebook <- facebook %>%
  group_by(country) %>%
  mutate(time = interval(datetime, start = min(datetime)) %>% time_length(unit = "hour") %>% round(4)) %>%
  ungroup()


# Data import for Truck2

# Google

folder_gg_truck2 <- "data/google/truck2"
filenames_gg_truck2 <- list.files(folder_gg_truck2, full.names = TRUE)

gg_truck2 <- tibble() # start with an empty dataframe
for (file in filenames_gg_truck2) { # loop through all the files in the google/gender/ folder
  next_report <- read_excel(file)
  next_report$datetime <- str_extract(file, "2020.+(?=\\.xlsx)") %>% # extract the time of the report creation
    as_datetime()
  gg_truck2 <- rbind(gg_truck2, next_report)
}
rm(next_report)

# Facebook

folder_fb_truck2 <- "data/france/facebook/truck2-gender/"
filenames_fb_truck2 <- list.files(folder_fb_truck2)


fb_truck2 <- tibble() # start with an empty dataframe
for (file in filenames_fb_truck2) { # loop through all the files in the facebook/gender/ folder
  next_report <- read.csv(paste0(folder_fb_truck2, file))
  next_report$datetime <- str_remove(file, "\\.csv") %>% # extract the time of the report creation
    ymd_hm()
  next_report <- clean_facebook_data(next_report)
  next_report <- next_report %>%
    separate(job, into = c("job", "variation"), sep = " - ")
  fb_truck2 <- rbind(fb_truck2, next_report)
}
rm(next_report)

fb_truck2 <- fb_truck2 %>%
  group_by(country) %>%
  mutate(time = interval(datetime, start = min(datetime)) %>% time_length(unit = "hour") %>% round(4)) %>%
  ungroup()



