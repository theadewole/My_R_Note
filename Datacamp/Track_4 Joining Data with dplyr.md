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
inner_join(inventories,by="set_num") %>%
inner_join(inventory_parts,by=c("id"="inventory_id"))

sets %>%
  inner_join(inventories, by = "set_num") %>%
  inner_join(inventory_parts, by = c("id" = "inventory_id")) %>%
  inner_join(colors,by=c("color_id"="id"),suffix=c("_set","_color"))

%>% from the above
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
millennium_falcon_colors <- millennium_falcon %>%
  group_by(color_id) %>%
  summarize(total_quantity = sum(quantity))

- Now, sum the quantity column by color_id in the Star Destroyer dataset.
star_destroyer_colors <- star_destroyer %>%
  group_by(color_id) %>%
  summarize(total_quantity = sum(quantity))

- Left join the two datasets, millennium_falcon_colors and star_destroyer_colors,
using the color_id column and the _falcon and _star_destroyer suffixes
millennium_falcon_colors %>%
left_join(star_destroyer_colors,by=c("color_id"),
suffix=c("_falcon","_star_destroyer"))
```
****Finding an observation that doesn't have a match****
```
- Use a left_join to join together sets and inventory_version_1 using their common column.
- filter for where the version column is NA using is.na.

inventory_version_1 <- inventories %>%
  filter(version == 1)

sets %>%
left_join(inventory_version_1,by="set_num") %>%
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
  count(part_cat_id) %>%
   right_join(part_categories,by=c("id"="part_cat_id"))
  right_join(part_categories, by = c("part_cat_id" = "id"))

%>% from above 
  filter(is.na(n))
    ~ after the 2nd right_join %>%
  replace_na(list(n=0))
```

## Joining tables to themselves
This is more useful when a table has a relationship to itself (hierarchical table).  <br>
![Screenshot 2024-02-08 152843](https://github.com/theadewole/My_R_Note/assets/108795960/1304a7d4-1662-40bf-ab2c-27bfc965ba8d)
   <br>
****inner joining a table to itself****
```
- Inner join themes to their own children, resulting in the suffixes "_parent" and "_child", respectively.
- Filter this table to find the children of the "Harry Potter" theme.

themes %>% 
 inner_join(themes,by=c("id"="parent_id"),
 suffix=c("_parent","_child")) %>%
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
 left_join(themes,by=c("id"="parent_id"),
 suffix=c("_parent","_child")) %>%
  filter(is.na(name_child))
```

# Full, Semi, and Anti Joins
## The full_join verb
Returns all cases in either dataset
```
inventory_parts_joined <- inventories %>%
  inner_join(inventory_parts, by = c("id" = "inventory_id")) %>%
  arrange(desc(quantity)) %>%
  select(-id, -version)

- In order to join in the themes, you'll first need to combine the inventory_parts_joined and sets tables.
- Then, combine the first join with the themes table, using the suffix argument to clarify which table each name came from ("_set" or "_theme").

inventory_parts_joined %>%
  inner_join(sets, by = "set_num") %>%
  inner_join(themes, by = c("theme_id" = "id"), suffix = c("_set", "_theme"))
```

```
inventory_sets_themes <- inventory_parts_joined %>%
  inner_join(sets, by = "set_num") %>%
  inner_join(themes, by = c("theme_id" = "id"), suffix = c("_set", "_theme"))

batman <- inventory_sets_themes %>%
  filter(name_theme == "Batman")

star_wars <- inventory_sets_themes %>%
  filter(name_theme == "Star Wars")

- Count the part number and color id for the parts in Batman and Star Wars, weighted by quantity.

batman %>%
count(part_num,color_id,wt=quantity)
star_wars %>%
count(part_num,color_id,wt=quantity)
```

```
batman_parts <- batman %>%
  count(part_num, color_id, wt = quantity)

star_wars_parts <- star_wars %>%
  count(part_num, color_id, wt = quantity)

- Combine the star_wars_parts table with the batman_parts table; use the suffix argument to include the "_batman" and "_star_wars" suffixes.
- Replace all the NA values in the n_batman and n_star_wars columns with 0s.

batman_parts %>% 
  full_join(star_wars_parts,by=c("part_num","color_id"),
  suffix=c("_batman","_star_wars"))%>%
 replace_na(list(n_batman=0,n_star_wars=0))
```

```
parts_joined <- batman_parts %>%
  full_join(star_wars_parts, by = c("part_num", "color_id"), suffix = c("_batman", "_star_wars")) %>%
  replace_na(list(n_batman = 0, n_star_wars = 0))

- Sort the number of star wars pieces in the parts_joined table in descending order.
- Inner join the colors table to the parts_joined table.
- Combine the parts table to the previous join using an inner join; add "_color" and "_part" suffixes to specify whether or not the information came from the colors table or the parts table.

parts_joined %>%
 arrange(desc(n_star_wars)) %>%
inner_join(colors,by=c("color_id"="id")) %>%
  inner_join(parts,by="part_num",
  suffix=c("_color","_part"))
```
Inner join, right join, left join and full join are called ****Mutating Joins**** <br>

## Semi Joins and Anti Joins 
Semi join and anti joins are called ****Filtering Joins**** <br>
A filtering join keeps or removes observations from the first table, but it doesn't add new variables
- A semi join asks the question: what observations in X are also in Y?
- A anti join asks the question: what observations in X are not in Y?
![image](https://github.com/theadewole/My_R_Note/assets/108795960/bb8729c7-bfc8-4d4e-9d4e-96b6bac4baeb)

```
batmobile <- inventory_parts_joined %>%
  filter(set_num == "7784-1") %>%
  select(-set_num)

batwing <- inventory_parts_joined %>%
  filter(set_num == "70916-1") %>%
  select(-set_num)

- Filter the batwing set for parts that are also in the batmobile, whether or not they have the same color.
- Filter the batwing set for parts that aren't also in the batmobile, whether or not they have the same color.
batwing %>%
semi_join(batmobile,by="part_num")

batwing %>%
anti_join(batmobile,by="part_num")
```

```
~ Use inventory_parts to find colors included in at least one set
colors %>%
semi_join(inventory_parts,by=c("id"="color_id"))

- Use filter() to extract version 1 from the inventories table; save the filter to version_1_inventories.
- Use anti_join to combine version_1_inventories with sets to determine which set is missing a version 1.

version_1_inventories <- inventories %>%
  filter(version==1)
sets %>%
 anti_join(version_1_inventories,by="set_num")
```

## Visualizing 
```
inventory_parts_themes <- inventories %>%
  inner_join(inventory_parts, by = c("id" = "inventory_id")) %>%
  arrange(desc(quantity)) %>%
  select(-id, -version) %>%
  inner_join(sets, by = "set_num") %>%
  inner_join(themes, by = c("theme_id" = "id"), suffix = c("_set", "_theme"))
- Add a filter for the "Batman" theme to create the batman_colors object.
- Add a fraction column to batman_colors that displays the total divided by the sum of the total.
- Repeat the steps to filter and aggregate the "Star Wars" set data to create the star_wars_colors object.
- Add a fraction column to star_wars_colors to display the fraction of the total.

batman_colors <- inventory_parts_themes %>%
  filter(name_theme == "Batman") %>%
  group_by(color_id) %>%
  summarize(total = sum(quantity)) %>%
  mutate(fraction=total/sum(total))

star_wars_colors <- inventory_parts_themes %>%
filter(name_theme=="Star Wars")%>%
  group_by(color_id) %>%
  summarize(total = sum(quantity)) %>%
  mutate(fraction=total/sum(total))

- Join the batman_colors and star_wars_colors tables; be sure to include all observations from both tables.
- Replace the NAs in the total_batman and total_star_wars columns.

batman_colors %>%
  full_join(star_wars_colors, by = "color_id", suffix = c("_batman", "_star_wars")) %>%
  replace_na(list(total_batman=0,total_star_wars=0)) %>%
  inner_join(colors, by = c("color_id" = "id")) 
```

```
colors_joined <- batman_colors %>%
  full_join(star_wars_colors, by = "color_id", suffix = c("_batman", "_star_wars")) %>%
  replace_na(list(total_batman = 0, total_star_wars = 0)) %>%
  inner_join(colors, by = c("color_id" = "id")) %>%
  mutate(difference = fraction_batman - fraction_star_wars,
         total = total_batman + total_star_wars) %>%
  filter(total >= 200) %>%
  mutate(name = fct_reorder(name, difference))

- Create a bar plot using the colors_joined table to display the most prominent colors in the Batman and Star Wars themes, with the bars colored by their name

ggplot(colors_joined, aes(name, difference, fill = name)) +
  geom_col() +
  coord_flip() +
  scale_fill_manual(values = color_palette, guide = "none") +
  labs(y = "Difference: Batman - Star Wars")
```
# Case Study Stack Overflow
```
- Join together questions and question_tags using the id and question_id columns, respectively.
- Use another join to add in the tags table.
- Use replace_na to change the NAs in the tag_name column to "only-r"
questions %>%
  left_join(question_tags, by = c("id" = "question_id")) %>%
  left_join(tags, by = c("tag_id" = "id")) %>%
  replace_na(list(tag_name="only-r"))

- Aggregate by the tag_name.
- Summarize to get the mean score for each question, score, as well as the total number of questions, num_questions.
- Arrange num_questions in descending order to sort the answers by the most asked questions.

questions_with_tags %>% 
  group_by(tag_name) %>%
  summarize(score = mean(score), num_questions =n()) %>%
  arrange(desc(num_questions))

- Use a join to determine which tags never appear on an R question
tags %>%
  anti_join(question_tags,by=c("id"="tag_id"))
```

```
- Use an inner join to combine the questions and answers tables using the suffixes "_question" and "_answer", respectively.
- Subtract creation_date_question from creation_date_answer within the as.integer() function to create the gap column.

questions %>%
 inner_join(answers,by=c("id"="question_id"),suffix=c("_question","_answer")) %>%
  mutate(gap = as.integer(creation_date_question -
  creation_date_answer))

- Count and sort the question_id column in the answers table to create the answer_counts table.
- Join the questions table with the answer_counts table and include all observations from the questions table.
- Replace the NA values in the n column with 0s.

answer_counts <- answers %>%
count(question_id,sort=T)

questions %>%
  full_join(answer_counts,by=c("id"="question_id")) %>%
replace_na(list(n=0))

- Combine the question_tags table with question_answer_counts using an inner_join.
- Now, use another inner_join to add the tags table.

question_answer_counts %>%
 inner_join(question_tags,by=c("id"="question_id")) %>%
  inner_join(tags, by = c("tag_id" = "id"))

- Aggregate the tagged_answers table by tag_name.
- Summarize tagged_answers to get the count of questions and the average_answers.
- Sort the resulting questions column in descending order.

tagged_answers %>%
 group_by(tag_name) %>%
  summarize(questions =n(),
            average_answers =mean(n)) %>%
 arrange(desc(questions))
```
****To bind together two data frames by their rows**** <br>
``bind_rows(df1, df2, df3, ...)``` <br>
****To bind_cols() function from dplyr to bind together two data frames by their columns**** <br>
```bind_cols(df1, df2, df3, ...)``` <br>
## Extracting date using the lubridate library year () function
The year () function which takes a date and turns it into the relevant year.

```
- Use two inner joins to combine the question_tags and tags tables with the questions table.
- Now, use two inner joins to combine the question_tags and tags tables with the answers table.

questions %>%
  inner_join(question_tags, by = c("id" = "question_id")) %>%
  inner_join(tags, by = c("tag_id" = "id"))

answers %>%
  inner_join(question_tags, by = "question_id") %>%
  inner_join(tags, by = c("tag_id" = "id"))

- Combine the questions_with_tags and answers_with_tags tables into posts_with_tags.
- Add a year column to the posts_with_tags table, then count posts by type, year, and tag_name.

posts_with_tags <- bind_rows(questions_with_tags %>% mutate(type = "question"),
answers_with_tags %>% mutate(type = "answer"))

posts_with_tags %>%
  mutate(year = year(creation_date)) %>%
  count(type, year, tag_name)
```

```
Filter the by_type_year_tag table for the dplyr and ggplot2 tags.
Create a line plot with that filtered table that plots the frequency (n) over time, colored by question/answer and faceted by tag.

by_type_year_tag_filtered <- by_type_year_tag %>%
  filter(tag_name %in% c("dplyr","ggplot2"))

ggplot(by_type_year_tag_filtered, aes(year, n, color = type)) +
  geom_line() +
  facet_wrap(~ tag_name)
```
``
