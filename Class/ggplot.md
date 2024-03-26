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
