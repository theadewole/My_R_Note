####################################################### 
#Output
#######################################################
#Rendering to screen
p <- ggplot(mpg, aes(displ, hwy, colour = factor(cyl))) +
  geom_point()

summary(p)
print (p)

#saving to the current work drive
#ggsave save the latest created plot
getwd()
ggsave("plot.png", width = 5, height = 5)

#Saving to a directed location
ggsave("C:\\Users\\AFSS-Student\\Documents\\R\\Output\\my-plot.pdf", width = 6, height = 6)

#Saving to disk 
saveRDS(p, "plot.rds")
q <- readRDS("plot.rds")
