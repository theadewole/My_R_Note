library(scales)

#extract hex color codes for a plot with three elements in ggplot2 
hex <- hue_pal()(3)

#display hex color codes
hex

#overlay hex color codes on actual colors
show_col(hex)

################################################################################
#And we can use the following code to create a plot that shows the default ggplot2 colors for 
#plots with one through eight elements:
################################################################################
#set margins of plot area
par(mai = c(0.1, 0, 0.1, 0), bg = "grey85")

#create plot with ggplot2 default colors from 1 to 8
gc.grid <- layout(matrix(1:8, nrow = 8))
for(i in 1:8){
  gc.ramp <- hue_pal()(i)
  plot(c(0, 8), c(0,1),
       type = "n", 
       bty="n", 
       xaxt="n", 
       yaxt="n", xlab="", ylab="")
  for(j in 1:i){
    rect(j - 1, 0, j - 0.25, 1, col = gc.ramp[j])
  }
}


################################################################################
#And we can use the following code to display the hex color codes for each color shown in the plot
################################################################################
#display ggplot2 default hex color codes from 1 to 8
for(i in 1:8){
  print(hue_pal()(i))
}

