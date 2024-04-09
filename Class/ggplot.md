![image](https://github.com/theadewole/My_R_Note/assets/108795960/0b5f2c7a-4db2-49db-9eee-dd67a2fa3de9)<br>
![image](https://github.com/theadewole/My_R_Note/assets/108795960/9bde074c-f426-4072-8a43-a37c3ec1d8f6) <br>
![image](https://github.com/theadewole/My_R_Note/assets/108795960/49d11712-9586-4650-b318-7a7221df7485) <br>
![image](https://github.com/theadewole/My_R_Note/assets/108795960/7bc182f1-8509-4363-a17b-8ba02d15eb1f) <br>
# Grammar of Graphics
```library(ggplot2)``` <br>
All plot consist of;
- Data: This is the actual information you want to visualize, typically in the form of a data frame or another structured data format. It contains the variables and observations you're interested in representing graphically.
- Aesthetic mappings: These mappings describe how variables in the data are mapped to visual attributes such as color, size, shape, etc. Aesthetic mappings define how the data will be represented visually in the plot.
- Geometric objects (geoms): Geoms are the visual elements that represent the data, such as points, lines, bars, polygons, etc. Geoms define what you actually see on the plot and are specified in ggplot2 using functions like geom_point(), geom_line(), etc.
- Statistical transformations (stats): Stats summarize or transform the data in various ways before visualization. For example, creating histograms, calculating summary statistics, fitting regression lines, etc. Stats are specified within geoms or through separate stat functions.
- Scales: Scales map values in the data space to visual aesthetics like color, size, shape, etc. They provide legends or axes to interpret the visual mappings and read the original data values from the plot. Scales can be continuous or discrete and are specified using functions like scale_x_continuous(), scale_fill_discrete(), etc.
- Coordinate system (coord): The coordinate system defines how data coordinates are mapped to the plane of the graphic. It also provides axes and gridlines to aid in interpreting the plot. Common coordinate systems include Cartesian coordinates, polar coordinates, etc.
- Faceting specification: Faceting breaks up the data into subsets and displays those subsets as small multiples. This allows you to compare different subsets of data more easily. Faceting is specified using functions like facet_wrap() or facet_grid().
- Theme: The theme controls the overall appearance of the plot, including finer points like font size, background color, gridlines, etc. Themes allow you to customize the visual style of the plot to make it more attractive and informative.
## Basic
```
- ggplot(mpg,aes(x=displ,y=hwy))+
  geom_point()

- ggplot(mpg,aes(model,manufacturer))+
  geom_point()

- ggplot(mpg,aes(cty,hwy))+
  geom_point()

- ggplot(diamonds,aes(carat,price))+
  geom_point()

- ggplot(economics,aes(date,unemploy))+
  geom_line()

- ggplot(mpg,aes(cty))+
  geom_histogram()
```
## Colour, Size, Shape and Other Aesthetic Attributes
### Colour
```
ggplot(mpg,aes(displ,hwy,colour=class))+
  geom_point()

ggplot(mpg,aes(displ,cty,colour=class))+
  geom_point()
```

****Changing the color to a fixed value**** <br>
In the first plot, the value “blue” is scaled to a pinkish colour, and legend is added. In the second plot, the points are given the R colour blue
```
ggplot(mpg,aes(displ,hwy))+
  geom_point(aes(colour="blue"))

ggplot(mpg,aes(displ,hwy))+
  geom_point(colour="blue")
``` 
To see value needed for color and aesthetics <br>
```vignette("ggplot2-specs")```
### Shape
```
ggplot(mpg,aes(displ,hwy,shape=drv))+
  geom_point()
```
### Size
```
ggplot(mpg,aes(displ,hwy,size=cyl))+
  geom_point()
```
## Facetting 
There are two types of facet; <br>
facet_wrap() and facet_grid() are both functions used for creating multiple plots (facets) based on the levels of one or more categorical variables. However, they have some differences in their functionality
### facet_wrap
facet_wrap() is used when you want to create a series of small, similarly-sized plots, each representing a subset of the data based on one or more categorical variables. 
- It arranges the plots in a single column (or row), wrapping them onto multiple rows (or columns) depending on the space available and the number of unique levels in the facetting variable.
- You typically use facet_wrap() when you have one or a few categorical variables with a large number of levels and you want to create individual plots for each level. <br>
****USAGE****
- facets: This specifies the formula describing which variables should be used for faceting. For example, ~ group would facet by the group variable.
- nrow: Specifies the number of rows in the grid of facets. If NULL, the number of rows is determined automatically.
- ncol: Specifies the number of columns in the grid of facets. If NULL, the number of columns is determined automatically.
- scales: Specifies how the scales should be drawn. Possible values are "fixed" (all panels have the same scale), "free_x" (each row of panels has its own x-axis scale), "free_y" (each column of panels has its own y-axis scale), or "free" (both axes are free).
- shrink: Specifies whether the facets should be scaled down to fit the available space. It's a boolean value, TRUE or FALSE. Default is TRUE.
- labeller: Specifies the function used to label the facets. Default is "label_value", which uses the variable values as labels.
- as.table: Specifies whether to lay out the panels like a table (the default) or to fill by rows.
- switch: Deprecated argument. It was used to switch the display of facets but is no longer functional.
- drop: Specifies whether levels that don't appear in the data should be dropped from the display.
- dir: Specifies the direction in which the facets should be laid out. "h" for horizontal (the default) or "v" for vertical.
- strip.position: Specifies where to place the facet labels. Possible values are "top" (the default), "bottom", "left", or "right".
```
ggplot(mpg,aes(displ,hwy))+
  geom_point()+
  facet_wrap(~class)

ggplot(mpg,aes(displ,hwy))+
  geom_point()+
  facet_wrap(~cyl)

ggplot(mpg,aes(displ,fl))+
  geom_point()+
  facet_wrap(~cyl)
```
****You can facet by multiple variables****
```
ggplot(mpg, aes(displ, hwy)) +
  geom_point() +
  facet_wrap(vars(cyl, drv))
```
****Use vars() to supply faceting variables:****
```
ggplot(mpg, aes(displ, hwy)) + 
  geom_point()+ 
  facet_wrap(vars(class))
```
****Control the number of rows and columns with nrow and ncol****
```
ggplot(mpg, aes(displ, hwy)) + 
  geom_point()+ 
  facet_wrap(vars(class), nrow = 4,ncol=2)
```
****Use the `labeller` option to control how labels are printed:****
```
ggplot(mpg, aes(displ, hwy)) +
  geom_point() +
  facet_wrap(vars(cyl, drv), labeller = "label_both")
```
****To change the order in which the panels appear, change the levels of the underlying factor.****
```
mpg$class2 <- reorder(mpg$class, mpg$displ)
ggplot(mpg, aes(displ, hwy)) +
  geom_point() +
  facet_wrap(vars(class2))
```
****By default, the same scales are used for all panels. You can allow scales to vary across the panels with the `scales` argument. Free scales make it easier to see patterns within each panel, but harder to compare across panels. By default its fixed****
```
ggplot(mpg, aes(displ, hwy)) +
  geom_point() +
  facet_wrap(vars(class), scales = "free")
```
****To repeat the same data in every panel, simply construct a data frame that does not contain the faceting variable.****
```
ggplot(mpg, aes(displ, hwy)) +
  geom_point(data = transform(mpg, class = NULL), colour = "grey85") +
  geom_point() +
  facet_wrap(vars(class))
```
****Use `strip.position` to display the facet labels at the side of your choice. Setting it to `bottom` makes it act as a subtitle for the axis. This is typically used with free scales and a theme without boxes around strip labels.****
```
ggplot(economics_long, aes(date, value)) +
  geom_line() +
  facet_wrap(vars(variable), scales = "free_y", nrow = 2, strip.position = "top") +
  theme(strip.background = element_blank(), strip.placement = "outside")

ggplot(economics_long, aes(date, value)) +
  geom_line() +
  facet_wrap(vars(variable), scales = "free_y", nrow = 2, strip.position = "top",
             shrink = TRUE)
```
### facet_grid
facet_grid() is used when you want to create a grid of plots, with one variable defining the rows and another defining the columns.
- It allows you to create a more structured layout for your plots, where each combination of levels of the facetting variables gets its own plot.
- You typically use facet_grid() when you have two categorical variables and you want to see the relationship between them across different levels.
```
ggplot(mpg,aes(displ,hwy))+
  geom_point()+
  facet_grid(~class)
```

## Plot Geoms
### Adding smoother to a plot
```
ggplot(mpg,aes(displ,hwy))+
  geom_point()+
  geom_smooth()
```
The smooth() can also take the followig addition argument<br>
- method.args:
This argument allows you to pass additional arguments specific to the smoothing method being used. For example, when using method = "loess", you can specify the span parameter to control the degree of smoothing.
- color, fill, linetype, size:
These aesthetics can be used to customize the appearance of the smoothed line, such as its color, fill (for confidence intervals), line type, and size.
- alpha:
This argument controls the transparency of the smoothed line and confidence intervals. A value of 0 indicates complete transparency (i.e., invisible), while a value of 1 indicates full opacity.
- linetype:
This argument specifies the line type of the smoothed curve, such as solid, dashed, dotted, etc.
- size:
This argument determines the thickness of the line representing the smoothed curve.
- mapping:
This argument allows you to override the default aesthetic mapping specified in the aes() function for the smoothed line.

**applying span**
```
ggplot(mpg,aes(displ,hwy))+
  geom_point()+
  geom_smooth(span=0.2)
```
**applying method** 
```
library(mgcv)
ggplot(mpg,aes(displ,hwy))+
  geom_point()+
  geom_smooth(method="gam",formula=y~ s(x))
```
****applying method=lm(linear model)****
```
ggplot(mpg,aes(displ,hwy))+
  geom_point()+
  geom_smooth(method="lm")
```
**applying more argument**
```
ggplot(mpg, aes(x = displ, y = hwy)) +
  geom_point() +
  geom_smooth(method = "loess", 
              color = "blue", 
              fill = "lightblue", 
              linetype = "dashed", 
              size = 1.5, 
              alpha = 0.5)
```
###  Boxplots and Jittered Points
Useful when data includes a categorical variable and one or more continuous variables, shows how the values of the continuous variables vary with the levels of the categorical variable <br>
- **geom_jitter** <br>
adds a little random noise to the data which can help avoid overplotting.
```
ggplot(mpg, aes(drv,hwy)) +
  geom_jitter()
```
- **boxplot** <br>
summarise the shape of the distribution with a handful of summary statistics.
```
ggplot(mpg, aes(drv,hwy)) +
  geom_boxplot()
```
- **violin plot** <br>
show a compact representation of the “density” of the distribution, highlighting the areas where more points are found.
```
ggplot(mpg, aes(drv,hwy)) +
  geom_violin()
```
###  Histograms and Frequency Polygons
Histograms and frequency polygons show the distribution of a single numeric
variable. They provide more information about the distribution of a single
group than boxplots do, at the expense of needing more space.<br>
Both histograms and frequency polygons work in the same way: they bin
the data, then count the number of observations in each bin. The only difference is the display: histograms use bars and frequency polygons use lines. <br>
- **histogram** <br>
```
ggplot(mpg, aes(hwy)) +
geom_histogram()
```
- **freqpoly** <br>
```
ggplot(mpg, aes(hwy)) +
geom_freqpoly()
- Controlling the bin 
ggplot(mpg, aes(hwy)) +
  geom_freqpoly(binwidth = 1)
```
- ****Mapping with categorical data**** <br>
To compare the distributions of different subgroups, you can map
a categorical variable to either fill (for geom histogram()) or colour (for
geom freqpoly()). It’s easier to compare distributions using the frequency
polygon because the underlying perceptual task is easier. You can also use
facetting: this makes comparisons a little harder, but it’s easier to see the
distribution of each group.
```
ggplot(mpg, aes(displ, colour = drv)) +
  geom_freqpoly(binwidth = 0.5)

ggplot(mpg, aes(displ, fill = drv)) +
  geom_histogram(binwidth = 0.5) +
  facet_wrap(~drv, ncol = 1)
  ```
### Bar Chart 
The discrete analogue of the histogram is the bar chart<br>
There two rather different plots
that are both commonly called bar charts. The one form expects you to
have unsummarised data, and each observation contributes one unit to the
height of each bar. The other form of bar chart is used for presummarised
data.
- **Summarized data**
```
ggplot(mpg, aes(manufacturer)) +
  geom_bar()
```
- **Presummarised**
```
drugs <- data.frame(
  drug = c("a", "b", "c"),
  effect = c(4.2, 9.7, 6.1))
ggplot(drugs, aes(drug, effect)) + geom_bar(stat = "identity")
```
### Time Series with Line and Path Plots
Line and path plots are typically used for time series data. 
- Line plots join the points from left to right
- Path plots join them in the order that they appear in the dataset (in other words, a line plot is a path plot of the data
sorted by x value).
- Line plots usually have time on the x-axis, showing how a single variable has changed over time.
- Path plots show how two variables have simultaneously changed over time, with time encoded in the way that observations are connected.<br>
**Line Plot**
```
ggplot(economics, aes(date, unemploy / pop)) +
  geom_line()

ggplot(economics, aes(date, uempmed)) +
  geom_line()
```
**Path Plot**
```
ggplot(economics, aes(unemploy / pop, uempmed)) +
  geom_path() +
  geom_point()

year <- function(x) as.POSIXlt(x)$year + 1900
ggplot(economics, aes(unemploy / pop, uempmed)) +
  geom_path(colour = "grey50") +
  geom_point(aes(colour = year(date)))
```
## Modifying the Axes
### xlab() and ylab() 
modify the x- and y-axis labels
- **Adding the axis labels**
```
ggplot(mpg, aes(cty, hwy)) +
  geom_point(alpha = 1 / 3)
 
ggplot(mpg, aes(cty, hwy)) +
  geom_point(alpha = 1 / 3) +
  xlab("city driving (mpg)") +
  ylab("highway driving (mpg)")
```
- **Removing the axis label**
```
ggplot(mpg, aes(cty, hwy)) +
  geom_point(alpha = 1 / 3) +
  xlab(NULL) +
  ylab(NULL)
```
### xlim() and ylim()
modify the limits of axes
```
 ggplot(mpg, aes(drv, hwy)) +
  geom_jitter(width = 0.25)

ggplot(mpg, aes(drv, hwy)) +
  geom_jitter(width = 0.25) +
  xlim("f", "r") +
  ylim(20, 30)
```
- **For continuous scales, use NA to set only one limit**
```
ggplot(mpg, aes(drv, hwy)) +
  geom_jitter(width = 0.25, na.rm = TRUE) +
  ylim(NA, 30)
```
Changing the axes limits sets values outside the range to NA. You can suppress the associated warning with na.rm = TRUE.

## Output
- **Rendering to screen**
```
p <- ggplot(mpg, aes(displ, hwy, colour = factor(cyl))) +
  geom_point()

summary(p)
print (p)
```
- **saving to the current work drive** <br>
```
ggsave save the latest created plot
getwd()
ggsave("plot.png", width = 5, height = 5)
```
- **Saving to a directed location**
```
ggsave("C:\\Users\\AFSS-Student\\Documents\\R\\Output\\my-plot.pdf", width = 6, height = 6)
```
- **Saving to disk** <br>
Save a cached copy of it to disk, with saveRDS(). This saves a complete
copy of the plot object, so you can easily re-create it with readRDS().
```
saveRDS(p, "plot.rds")
q <- readRDS("plot.rds")
```
