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
****The replace_na(list()) is used to assign another variable to na for specific column(s)**** <br>
```replace_na(list(n=0))``` <br>
The above replaces the na in the 'n' variable with 0
```
- Use the count verb to count each part_cat_id in the parts table.
- Use a right_join to join part_categories. You'll need to use the part_cat_id from the count and the id column from part_categories.

parts %>%
    ~ Count the part_cat_id
  count(part_cat_id) %>%
   ~ Right join part_categories
   ~ right_join(part_categories,by=c("id"="part_cat_id"))
  right_join(part_categories, by = c("part_cat_id" = "id"))
    ~ Filter for NA
%>% from above 
  filter(is.na(n))
    ~ after the 2nd right_join %>%
 # Use replace_na to replace missing values in the n column
  replace_na(list(n=0))
```

## Joining tables to themselves
This is more useful when a table has a relationship to itself (hierarchical table).
![image](https://github.com/theadewole/My_R_Note/assets/108795960/d9d9eb96-3206-49df-8dc3-68057bfb5cd0) <br>

****inner joining a table to itself****
```
- Inner join themes to their own children, resulting in the suffixes "_parent" and "_child", respectively.
- Filter this table to find the children of the "Harry Potter" theme.

themes %>% 
  ~ Inner join the themes table
 inner_join(themes,by=c("id"="parent_id"),
 suffix=c("_parent","_child")) %>%
  ~ Filter for the "Harry Potter" parent name 
  filter(name_parent=="Harry Potter")
```
```
- Use another inner join to combine themes again with itself.
   Be sure to use the suffixes "_parent" and "_grandchild" so the columns in the resulting table are clear.
- Update the by argument to specify the correct columns to join on. If you're unsure of what columns to join on, it might help to look at the result of the first join to get a feel for it.

themes %>% 
  inner_join(themes, by = c("id" = "parent_id"), suffix = c("_parent", "_child")) %>%
  inner_join(themes,by=c("id_child"="parent_id"),
  suffix=c("_parent","_grandchild"))
```
****Left joining a table to itself****
```
- Left join the themes table to its own children, with the suffixes _parent and _child respectively.
- Filter the result of the join to find themes that have no children.

themes %>% 
  ~ Left join the themes table to its own children
 left_join(themes,by=c("id"="parent_id"),
 suffix=c("_parent","_child")) %>%
  ~ Filter for themes that have no child themes
  filter(is.na(name_child))
```

# Full, Semi, and Anti Joins

