#########################################
# Annotations
##geom text() to add text descriptions or to label points Most plots will not benefit from 
#adding text to every single observation on the plot, but labelling outliers and other important 
#points is very useful.

##geom rect() to highlight interesting rectangular regions of the plot. geom rect() has 
#aesthetics xmin, xmax, ymin and ymax.

##geom line(), geom path() and geom segment() to add lines. All these geoms have an arrow parameter, 
#which allows you to place an arrowhead on the line. Create arrowheads with arrow(), 
#which has arguments angle, length, ends and type.

##geom vline(), geom hline() and geom abline() allow you to add reference lines 
#(sometimes called rules), that span the full range of the plot.
#########################################
ggplot(economics, aes(date, unemploy)) +
  geom_line()

#Annotating the above to the president in power
eco <- economics
pre <-presidential
presidential <- subset(presidential, start > economics$date[1])

ggplot(economics) +
  geom_rect(
    aes(xmin = start, xmax = end, fill = party),
    ymin = -Inf, ymax = Inf, alpha = 0.2,
    data = presidential
  ) +
  geom_vline(
    aes(xintercept = as.numeric(start)),
    data = presidential,
    colour = "grey50", alpha = 0.5
  ) +
  geom_text(
    aes(x = start, y = 2500, label = name),
    data = presidential,
    size = 3, vjust = 0, hjust = 0, nudge_x = 50
  ) +
  geom_line(aes(date, unemploy)) +
  scale_fill_manual(values = c("blue", "red"))

#adding a single annotation to a plot
yrng <- range(economics$unemploy)
xrng <- range(economics$date)
caption <- paste(strwrap("Unemployment rates in the US have
            varied a lot over the years", 40), collapse = "\n")

ggplot(economics, aes(date, unemploy)) +
  geom_line() +
  geom_text(
    aes(x, y, label = caption),
    data = data.frame(x = xrng[1], y = yrng[2], caption = caption),
    hjust = 0, vjust = 1, size = 4)


#Using the annotation helper
ggplot(economics, aes(date, unemploy)) +
  geom_line() +
  annotate("text", x = xrng[1], y = yrng[2], label = caption,
           hjust = 0, vjust = 1, size=4)


caption <- paste(strwrap("The point of interception between the mean of vline
                         and median of hline",40),collapse="\n")
ggplot(data, aes(x = x, y = y)) +
  geom_point() +  # Adding some points for context
  geom_vline(xintercept = median_y, color = "red", linetype = "dashed") + 
  geom_hline(yintercept = mean_x, color = "blue", linetype = "dashed") +
  annotate("text", y=mean_x,x=median_y,label=caption,hjust=0,vjust=1)+
  labs(title = "Using geom_vline() and hline in ggplot2",x = "X-axis",y = "Y-axis")

#Annotation: Reference line
ggplot(diamonds, aes(log10(carat), log10(price))) +
  geom_bin2d() +
  facet_wrap(~cut, nrow = 1)
#Adding a reference line
mod_coef <- coef(lm(log10(price) ~ log10(carat), data = diamonds))
ggplot(diamonds, aes(log10(carat), log10(price))) +
  geom_bin2d() +
  geom_abline(intercept = mod_coef[1], slope = mod_coef[2],
              colour = "white", size = 1) +
  facet_wrap(~cut, nrow = 1)
