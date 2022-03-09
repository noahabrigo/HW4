library(dplyr)

load("/Volumes/GoogleDrive-102679206261466047710/My Drive/2021-2022/Winter 2022/Data Visualization CSC302/Rscripts/Slides12Rscripts_Data/preprint_growth.rda") 
#please change the path if needed
head(preprint_growth)



preprint_growth %>% filter(archive == "bioRxiv") %>%
  filter(count > 0) %>% drop_na() -> biorxiv_growth
preprint_full<-preprint_growth %>% filter(archive %in%
                                        c("bioRxiv", "F1000Research")) %>%filter(count > 0) %>%
  mutate(archive = factor(archive, levels = c("bioRxiv", "F1000Research"))) %>% drop_na() %>% filter(date >= "2004-01-01")
preprints_final <- filter(preprints, date == ymd("2017-01-01"))

ggplot(preprint_full) +
  aes(date, count, color = archive, fill = archive) +
  geom_line(size = 1) +
  scale_y_continuous(
    limits = c(0, 600), expand = c(0, 0),
    name = "preprints / month",
    sec.axis = dup_axis( #this part is for the second y axis
      breaks = preprints_final$count, #and we use the counts to position our labels
      labels = c("F1000Research", "bioRxiv"),
      name = NULL)
  )+
  scale_x_date(name = "year",
               limits = c(min(ymd("2014-02-01")), ymd("2017-01-01"))) +
  scale_color_manual(values = c("#7c6bea", "#fe8d6d"),
                     name = NULL) +
  theme(legend.position = "right")+
  ggtitle("Preprint Counts")



