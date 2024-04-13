# Load the dataset that is stored on the web
data <- read.table("https://raw.githubusercontent.com/holtzy/R-graph-gallery/master/DATA/stacked_barplot_negative_values.csv", header=T, sep=",")

#Overview of the dataset 
library(knitr)
kable(head(data, 4))

# transform the format
data_long <- gather(data, group, value, groupA:groupD) %>%
  arrange(factor(x, levels = c("Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sept", "Oct"))) %>% 
  mutate(x=factor(x, levels=unique(x)))

# And that's the result!
kable(head(data_long, 4))

# plot
ggplot(data_long, aes(fill=group, y=value, x=x)) + 
  geom_bar(position="stack", stat="identity")

#Stacked barchart polish
library(hrbrthemes)
#install.packages('hrbrthemes')
library(viridis)

# plot
ggplot(data_long, aes(fill=group, y=value, x=x)) + 
  geom_bar(position="stack", stat="identity") + 
  scale_fill_viridis(discrete=TRUE, name="") +
  theme_ipsum() +
  ylab("Money input") + 
  xlab("Month")