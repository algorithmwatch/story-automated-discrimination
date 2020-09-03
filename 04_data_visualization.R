countries <- google %>% pull(country) %>% unique()
for (c in countries) {
  google_gender_female_share <- google_male_female %>%
    filter(gender == "female",
           country == c) %>%
    slice_max(datetime) %>%
    ggplot()+
    # geom_vline(aes(xintercept = .5))+
    geom_point(aes(x = impr_rel, y = job %>% fct_reorder(., impr_rel)), color = "#7fc97f")+
    scale_x_continuous(limits = c(0,1))+
    # scale_y_discrete(expand = expansion(add = c(0.6,6))) +
    labs(x = paste0("Female share of impressions\nfor campaign on Google in ",c),
         y = "Employment ad")+
    theme_minimal()+
    theme(legend.position = "top",
          axis.title.y = element_blank())
  ggsave(filename = paste0("google_gender_female_share_",c,".png"),
         plot = google_gender_female_share,
         device = "png",
         dpi = 300,
         width = 4,
         height = 2,
         path = "img")
}

countries <- facebook %>% pull(country) %>% unique()
for (c in countries) {
  facebook_gender_female_share <- facebook_male_female %>%
    filter(gender == "female",
           country == c) %>%
    slice_max(datetime) %>%
    ggplot()+
    # geom_vline(aes(xintercept = .5))+
    geom_point(aes(x = impr_rel, y = job %>% fct_reorder(., impr_rel)), color = "#7fc97f")+
    scale_x_continuous(limits = c(0,1))+
    # scale_y_discrete(expand = expansion(add = c(0.6,6))) +
    labs(x = paste0("Female share of impressions\nfor campaign on Facebook in ",c),
         y = "Employment ad")+
    theme_minimal()+
    theme(legend.position = "top",
          axis.title.y = element_blank())
  ggsave(filename = paste0("facebook_gender_female_share_",c,".png"),
         plot = facebook_gender_female_share,
         device = "png",
         dpi = 300,
         width = 4,
         height = 2,
         path = "img")
}
