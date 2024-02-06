# Inner Join 
Combines two datasets and returns exact matching values from both datasets <br> 
****When combining the two datasets set and theme:**** <br>
```
set %>%
inner_join(theme,by="Id")
```
****When the combining columns have different name:****
- set: "id"
- theme: "theme_id"
```
set %>%
inner_join(theme,by=c("theme_id"=Id"))
```
****Suffix**** <br>
used to customize variable names upon joining <br>
```
set %>%
inner_join(theme,by=c("theme_id"=Id"),
suffix=c("_set","_theme")
```
```
  ~ Add the correct verb, table, and joining column
parts %>% 
  inner_join(part_categories,by=c("part_cat_id"="id"))
   ~ Use the suffix argument to replace .x and .y suffixes
parts %>% 
  inner_join(part_categories, by = c("part_cat_id" = "id"),
  suffix=c("_part","_category"))
```

## Joining with a one-to-many relationship
```
  ~ Combine the parts and inventory_parts tables
parts %>%
inner_join(inventory_parts,by="part_num")
 ~ Combine the parts and inventory_parts tables
inventory_parts %>%
inner_join(parts,by="part_num")

Both results are the same, but the order of the tables is reversed.
For an inner_join, either direction will yield a table that contains the same information!
Note that the columns will appear in a different order depending on which table comes first
```
## Joining three or more tables
You can pipe any number of joins together, just like you can combine other dplyr verbs. With this second join
```
- Combine the inventories table with the sets table.
- Next, join the inventory_parts table to the table you created in the previous join by the inventory IDs.

sets %>%
  ~ Add inventories using an inner join 
inner_join(inventories,by="set_num") %>%
  ~ Add inventory_parts using an inner join 
inner_join(inventory_parts,by=c("id"="inventory_id"))

  ~ Add an inner join for the colors table
sets %>%
  inner_join(inventories, by = "set_num") %>%
  inner_join(inventory_parts, by = c("id" = "inventory_id")) %>%
  inner_join(colors,by=c("color_id"="id"),suffix=c("_set","_color"))

%>% from the above
  ~ Count the number of colors and sort
count(name_color,sort=T)
```
# Left and Right Joins
## The LEFT JOIN 
keyword returns all records from the left table and the matching records from the right table <br>
Joining with two columns(the two column having same name in the datasets; <br>
```by=c(aaa,bbb)```
```
millennium_falcon <- inventory_parts_joined %>%
  filter(set_num == "7965-1")
star_destroyer <- inventory_parts_joined %>%
  filter(set_num == "75190-1")

- Left join the star_destroyer and millennium_falcon tables on the part_num and color_id columns with the
 suffixes _falcon and _star_destroyer.

   ~ Combine the star_destroyer and millennium_falcon tables
millennium_falcon %>%
left_join(star_destroyer,by=c("part_num","color_id"),
suffix=c("_falcon","_star_destroyer"))

- Sum the quantity column by color_id in the Millennium Falcon dataset.
  ~ Aggregate Millennium Falcon for the total quantity in each part
millennium_falcon_colors <- millennium_falcon %>%
  group_by(color_id) %>%
  summarize(total_quantity = sum(quantity))
- Now, sum the quantity column by color_id in the Star Destroyer dataset.
  ~ Aggregate Star Destroyer for the total quantity in each part
star_destroyer_colors <- star_destroyer %>%
  group_by(color_id) %>%
  summarize(total_quantity = sum(quantity))
- Left join the two datasets, millennium_falcon_colors and star_destroyer_colors,
using the color_id column and the _falcon and _star_destroyer suffixes
  ~ Left join the Millennium Falcon colors to the Star Destroyer colors
millennium_falcon_colors %>%
left_join(star_destroyer_colors,by=c("color_id"),
suffix=c("_falcon","_star_destroyer"))
```
Finding an observation that doesn't have a match
```
- Use a left_join to join together sets and inventory_version_1 using their common column.
- filter for where the version column is NA using is.na.
inventory_version_1 <- inventories %>%
  filter(version == 1)
   ~ Join versions to sets
sets %>%
left_join(inventory_version_1,by="set_num") %>%
   ~ Filter for where version is na
filter(is.na(version))
```
## The right_join verb
keyword returns all records from the right table and the matching records from the left table <br>
The replace_na(list()) is used to assign another variable to na for specific column(s)

