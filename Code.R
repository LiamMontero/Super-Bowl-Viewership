# Load packages
library(tidyverse)

# Load the CSV data
tv  <-  read_csv("data/tv.csv", show_col_types=FALSE)
super_bowls  <-  read_csv("data/super_bowls.csv", show_col_types=FALSE)


#Q1

# join the last 2 rows in the data frame tv because the super bowl number 1 was transmitted per 2 tv channels
super_1 <- tv %>% filter(super_bowl == 1)

# creating the new row using the rows from both channels
super_1 <- data.frame(x1 = 1,
                      x2 = "CBS-NBC", # the channels who transmitted the game
                      x3 = sum(super_1$avg_us_viewers), 
                      x4 = sum(super_1$total_us_viewers, na.rm = TRUE),
                      x5 = sum(super_1$rating_household),
                      x6 = sum(super_1$share_household),
                      x7 = NA,
                      x8 = NA,
                      x9 = mean(super_1$ad_cost))

# changing the names 
names(super_1) <- names(tv)  

# deleting the las 2 rows and add in the new row which has the new data trasformated
tv_ok <- tv %>% filter(!super_bowl == 1) %>% rbind(super_1)

# creating a data with the 2 data frames 
full_data <- super_bowls %>% left_join(tv_ok, by = "super_bowl")

# calculating the correlation between the difference of point per game and the viewers per game
cor(full_data$difference_pts, full_data$avg_us_viewers)

# ploting the relation between the diferece of point per game and the viewers per game
full_data %>% ggplot(aes(difference_pts, avg_us_viewers)) + geom_point()

score_impact <- "weak"



#Q2

# Normalizing the variables
superbowl_df_norm <- full_data %>%
  mutate(
    viewers_norm = scale(avg_us_viewers),
    ad_price_norm = scale(ad_cost),
    rate_norm = scale(rating_household)
  ) %>%
  select(super_bowl, viewers_norm, ad_price_norm, rate_norm)

# Converting to long format for graphing because we can not do it with the data like we have it
superbowl_long <- superbowl_df_norm %>%
  pivot_longer(cols = -super_bowl, names_to = "variable", values_to = "value")

# Creating the graph
ggplot(superbowl_long, aes(x = super_bowl, y = value, color = variable)) +
  geom_line(size = 1.2) +
  labs(title = "Tendencias Normalizadas del Super Bowl",
       x = "Año",
       y = "Valor Normalizado",
       color = "Variable")


# Another way to create the graph
ggplot(superbowl_df_norm, aes(x = super_bowl)) +
  geom_line(aes(y = viewers_norm, color = "Televidentes")) +
  geom_line(aes(y = ad_price_norm, color = "Precio Anuncio")) +
  geom_line(aes(y = rate_norm, color = "Rating")) +
  labs(title = "Tendencias Normalizadas del Super Bowl",
       x = "Año",
       y = "Valor Normalizado",
       color = "Variable")


first_to_increase <- "ratings"
