library(ggplot2)
cars93 <- MASS::Cars93
ggplot(cars93, aes(x = Price, y = Fuel.tank.capacity)) +
  geom_point(color = "grey60") +
  geom_smooth(se = TRUE, method = "gam", formula = y ~ x, color = "#7c6bea") +
  scale_x_continuous(
    name = "price (USD)",
    breaks = c(20, 40, 60),
    labels = c("$20,000", "$40,000", "$60,000")
  )+
  scale_y_continuous(name = "fuel-tank capacity\n(US gallons)")+
  ggtitle("GAM Smoothing")+
  theme(plot.title = element_text(size=14, color="#7c6bea"))
