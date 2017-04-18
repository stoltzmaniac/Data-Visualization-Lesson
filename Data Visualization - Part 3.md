---
title: "Data Visualization - Part 3"
author: "Scott Stoltzman"
date: "April 7, 2017"
output: html_document
---


### What Type of Data Visualization Do You Choose (if any)?  

Determining whether or not you need a visualization is ***step one***. While it seems silly, this is probably something everyone (including myself) should be doing more often. A lot of times, it seems like a great way to showcase the amount of work you have been doing, but winds up being completely ineffective and could potentially harm what you're doing. Once you determine that you actually need to visualize your data, you should have a rough idea of the options to look at. This post will explain and demonstrate some of the common types of charts and plots.  




<img src="https://www.stoltzmaniac.com/wp-content/uploads/2017/04/unnamed-chunk-2-1-4.png" title="plot of chunk unnamed-chunk-2" alt="plot of chunk unnamed-chunk-2" style="display: block; margin: auto;" />

This is Part 3 in a series about Data visualization:  

* [Data Visualization - Part 1](https://www.stoltzmaniac.com/data-visualization-part-1?utm_medium=SERIES&utm_source=DATA_VISUALIZATION_TOP)
* [Data Visualization - Part 2](https://www.stoltzmaniac.com/data-visualization-part-2?utm_medium=SERIES&utm_source=DATA_VISUALIZATION_TOP)

#### Determine whether or not you actually need a visualizatoin in the first place.

Like the best practices I listed in [Data Visualization - Part 1](https://www.stoltzmaniac.com/data-visualization-part-1?utm_medium=SERIES&utm_source=DATA_VISUALIZATION_MID_ARTICLE), make sure your visualizations:

- Are clearly illustrating a relevant point  
- Are tailored to the appropriate audience  
- Are tailored to the presentation medium  
- Are memorable to those who care about the material  
- Are increasing the understanding of the subject matter  
  
If these don't seem possible, ***you probably don't need a data visualization.***  

#### If you do need one, what's a good first step to take?

Take a look at the forum in which you're presenting, it matters! If you are writing for a scientific journal, it will be different than presenting live to a thousand person audience. Think about a Ted Talk compared to the Journal of Physics.  

Point being: **consider your audience!**  

Let's talk about a high-level presentation. Everyone has seen a slideshow with fancy charts that add zero value. Do not be the person presenting something that way! Providing useless content will confuse the audience and/or lead to boredom.

If your point is to show year-over-year change of a single metric - show it as a simple number on the page in big bold font rather than a chart.

In this made up example, I am displaying revenue over the last few years (***note: be more specific*** when it comes to what type of revenue you're talking about).  

Which of the following makes more sense to put on a slide?

<img src="https://www.stoltzmaniac.com/wp-content/uploads/2017/04/unnamed-chunk-3-1-4.png" title="plot of chunk unnamed-chunk-3" alt="plot of chunk unnamed-chunk-3" style="display: block; margin: auto;" />

If you agree with me, the one on the right will be much easier for people to understand in a presentation. It gets the point across without requiring processing which will allow people to focus on what is important. Any additional nuggets you would like to point out can be spoken to. 

Now, let's talk about publishing content that isn't for academic use but will reach the public (i.e. newspapers, magazines, blogs, etc.). These types of charts can cover a wide range of topics so we'll have to stick to the basics. We're going to look at displaying information which is interesting and adds value.  

Here is a great example from [Junk Charts](http://junkcharts.typepad.com/junk_charts/2017/04/what-does-lying-politicians-have-in-common-with-rainbow-colors.html) in which the author of the original [Daily Kos Article](http://www.dailykos.com/story/2016/8/7/1556666/-Three-lessons-from-the-rise-of-Donald-Trump) is showing a type of "lie detector" chart. The chart does a number of things well: it illustrates a relevant point, it is appropriate to the audience and medium, and really helps to understand the subject matter better. However, the original chart is too colorful which takes away from its effectiveness. Junk Charts took it to the next level by simplifying the colors and axes.  


#### Original Version (Daily Kos)
<img src="https://www.stoltzmaniac.com/wp-content/uploads/2017/04/unnamed-chunk-4-1-2.png" title="plot of chunk unnamed-chunk-4" alt="plot of chunk unnamed-chunk-4" style="display: block; margin: auto;" />

#### Modified Version (Junk Charts)
<img src="https://www.stoltzmaniac.com/wp-content/uploads/2017/04/unnamed-chunk-5-1-4.png" title="plot of chunk unnamed-chunk-5" alt="plot of chunk unnamed-chunk-5" style="display: block; margin: auto;" />

By merely looking at this chart you can see how it is ranked, a sense of scale, the comparison between people, and clearly labeled names. Fantastic work!  

Rather than going over more examples of work others are doing, please visit [Chart Porn](http://chartporn.org/) (don't worry about the name, it's a great data visualization site) and [Junk Charts](http://junkcharts.typepad.com/). They have phenomenal examples of what to do (and what not to do) when publishing to the public.

#### You have a point, now what?  

There is no rulebook as to how to display your data. However, as you have seen, there are both great and poor options. The choice is up to you - so think long and hard before making a decision (and you can always try a number of them out on people before publishing).

**Ask yourself the following questions to help drive your decision:**  

- Are you making a comparison?
- Are you finding a relationship?
- Are you showing a distribution?
- Are you finding a trend over time?
- Are you showing composition?
  
Once you know which question you are asking, it will keep your mind focused on the outcome and will quickly narrow down your charting options.

#### Rule of Thumb  

- **Trend:** Column, Line  
- **Comparison:** Area, Bar, Bullet, Column, Line, Scatter  
- **Relationship:** Line, Scatter  
- **Distribution:** Bar, Boxplot, Column  
- **Composition:** Donut, Pie, Stacked Bar, Stacked Column  
  
Obviously, there are plenty of choices beyond these, so don't hesitate to use what works best. I will go over some of these basics and show some comparisons of poor charting techniques vs. slightly better ones.

For this project, I'll use some oil production data that I found while digging through http://data.world (pretty great site). The data can be found [here](http://www.eia.gov/dnav/pet/pet_crd_crpdn_adc_mbbl_m.htm)  

Let's load up some libraries and get started.


```r
library(ggplot2)
library(dplyr)
library(tidyr)
library(lubridate)
library(scales)
```




```r
#Custom data preparation
#GitHub (linked to at bottom of this post)
source('data_preparation.R')
data = getData()
```


```r
head(data)
```

```
##   Location Month Year ThousandBarrel       Date
## 1  Alabama   Mar 2013            883 2013-03-01
## 2  Alabama   Apr 2013            844 2013-04-01
## 3  Alabama   May 2013            878 2013-05-01
## 4  Alabama   Feb 2013            809 2013-02-01
## 5  Alabama   Mar 1982           1687 1982-03-01
## 6  Alabama   Apr 1982           1567 1982-04-01
```

----  

## Trend - Line Chart

**Objective:** Visualize a trend in oil production in the US from 1981 - 2016 by year. I want to illustrate the changes over the time period. This is a very high-level view and only shows us a decline followed by a ramp up at the end of the period.

#### Poor Version  
The x-axis is a disaster and the y-axis isn't formatted well. While it gets the point across, it's still worthless.



```r
df = data %>% 
  group_by(Year) %>%
  summarise(ThousandBarrel = sum(ThousandBarrel))

p = ggplot(df,aes(x=Year,y=ThousandBarrel,group=1)) 
p + geom_line(stat='identity') + 
  ggtitle('Oil Production Over Time') + 
  theme(plot.title = element_text(hjust = 0.5),plot.subtitle = element_text(hjust = 0.5)) + 
  xlab('') + ylab('')
```

<img src="https://www.stoltzmaniac.com/wp-content/uploads/2017/04/unnamed-chunk-7-1-4.png" title="plot of chunk unnamed-chunk-7" alt="plot of chunk unnamed-chunk-7" style="display: block; margin: auto;" />

#### Better Version  
The title gives us a much better understanding of what we're looking at. The chart is slightly wider and the axes are formatted to be legible.


```r
p = ggplot(df,aes(x=Year,y=ThousandBarrel,group=1)) 
p + geom_line(stat='identity') + 
  ggtitle('Thousand Barrel Oil Production By Year in the U.S.') +
  theme(plot.title = element_text(hjust = 0.5),plot.subtitle = element_text(hjust = 0.5)) + 
  theme(axis.text.x = element_text(angle = 90, hjust = 1)) + 
  scale_y_continuous(labels = comma)
```

<img src="https://www.stoltzmaniac.com/wp-content/uploads/2017/04/unnamed-chunk-8-1-4.png" title="plot of chunk unnamed-chunk-8" alt="plot of chunk unnamed-chunk-8" style="display: block; margin: auto;" />


----

## Comparison - Line Chart  

**Objective**: Identify which states affected the trend the most. Evaluate them simultaneously in order to paint the picture and compare their trends over the time period. From this visual you can see the top states are Alaska, California, Louisiana, Oklahoma, Texas and Wyoming. Texas seems to break the mold quite drastically and drove the spike which occurred after 2010.

#### Poor Version  
There are far too many colors going on here. Everything at the bottom of the chart is relatively useless and takes our focus away from the big players. 


```r
df = data %>%
  group_by(Location, Year) %>%
  summarise(ThousandBarrel = sum(ThousandBarrel))

df$Year = as.numeric(df$Year)

p = ggplot(df,aes(x=Year,y=ThousandBarrel,col=Location))
p + geom_line(stat='identity') + 
  ggtitle(paste('Oil Production By Year By State in the U.S.')) + 
  theme(plot.title = element_text(hjust = 0.5)) + 
  theme(axis.text.x = element_text(angle = 90, hjust = 1))
```

![plot of chunk unnamed-chunk-9](https://www.stoltzmaniac.com/wp-content/uploads/2017/04/unnamed-chunk-9-1-4.png)

#### Better Version  
This focuses attention on the top producing states. It compares them to each other and shows the trend per state as well. Using facet_wrap() tends to be used in what's known as "small multiples" - this is a technique which helps to break up the visual components of the data into easy-to-understand pieces which make intuitive sense.


```r
n=6 #Arbitrary at first, after trying a few, this made the most sense
topN = data %>%
  group_by(Location) %>%
  summarise(ThousandBarrel = sum(ThousandBarrel)) %>%
  arrange(-ThousandBarrel) %>%
  top_n(n)

df = data %>%
  filter(Location %in% topN$Location) %>%
  group_by(Year,Location) %>%
  summarise(ThousandBarrel = sum(ThousandBarrel))

df$Year = as.numeric(df$Year)
df$Location = as.factor(df$Location)

p = ggplot(df,aes(x=Year,y=ThousandBarrel,group=1))
p + geom_line(stat='identity') + 
  ggtitle(paste('Top',as.character(n),'States - Oil Production By Year in the U.S.')) + 
  theme(plot.title = element_text(hjust = 0.5)) + 
  theme(axis.text.x = element_text(angle = 90, hjust = 1)) + 
  facet_wrap(~Location) + 
  scale_y_continuous(labels = comma) 
```

![plot of chunk unnamed-chunk-10](https://www.stoltzmaniac.com/wp-content/uploads/2017/04/unnamed-chunk-10-1-4.png)

----

## Relationship - Scatter Plot

**Objective**: Check to see if data from Alaska and California is correlated. While this isn't extremely interesting, it does allow us to use this same data set (sorry). The charts indicate that there appears to be a strong positive correlation between the two states.

#### Poor Version  
Lots of completely irrelevant data! The size of the point should have nothing to do with the year.  


```r
statesList = c('Alaska','California')
df = data %>%
  filter(Location %in% statesList) %>%
  spread(Location,ThousandBarrel) %>%
  select(Alaska,California,Month,Year)

p = ggplot(df,aes(x=Alaska,y=California,col=Month,size=Year))
p + geom_point() + 
  scale_y_continuous(labels = comma) +
  scale_x_continuous(labels = comma) +
  ggtitle('Oil Production - CA vs. AK') + 
  theme(plot.title = element_text(hjust = 0.5))
```

![plot of chunk unnamed-chunk-11](https://www.stoltzmaniac.com/wp-content/uploads/2017/04/unnamed-chunk-11-1-4.png)

#### Better Version  
The points are all the same size and a trend line helps to visualize the relationship. While it can sometimes be misleading, it makes sense with our current data.  


```r
df = data %>%
  filter(Location %in% statesList) %>%
  spread(Location,ThousandBarrel) %>%
  select(Alaska,California,Year)

p = ggplot(df,aes(x=Alaska,y=California))
p + geom_point() + 
  scale_y_continuous(labels = comma) +
  scale_x_continuous(labels = comma) +
  ggtitle('Monthly Thousand Barrel Oil Production 1981-2016 CA vs. AK') + 
  theme(plot.title = element_text(hjust = 0.5)) + 
  geom_smooth(method='lm')
```

![plot of chunk unnamed-chunk-12](https://www.stoltzmaniac.com/wp-content/uploads/2017/04/unnamed-chunk-12-1-4.png)

## Distribution - Boxplot 

**Objective**: Examine the range of production by state (per year) to give us an idea of the variance. While the sums and means are nice, it's quite important to have an idea of distributions. While it was semi-apparent in the line charts, the variance of Texas is huge compared to the others! 


#### Poor Version  
Alphabetical order doesn't add any value, names are overlapping on top of each other. While you can tell who the big players are, this visual does not add the value it should.


```r
df = data %>%
  group_by(Year,Location) %>%
  summarise(ThousandBarrel = sum(ThousandBarrel))

p = ggplot(df,aes(x=Location,y=ThousandBarrel))
p + geom_boxplot() + 
  ggtitle('Distribution of Oil Production by State')
```

![plot of chunk unnamed-chunk-13](https://www.stoltzmaniac.com/wp-content/uploads/2017/04/unnamed-chunk-13-1-4.png)


#### Better Version  
This gives a nice ranking to the plot while still showing their distributions. We could take this a step further and separate out the big players from the small players (I'll leave that up to you).


```r
p = ggplot(df,aes(x=reorder(Location,ThousandBarrel),y=ThousandBarrel))
p + geom_boxplot() + 
  scale_y_continuous(labels = comma) +
  ggtitle('Distribution of Annual Oil Production By State (1981 - 2016)') + 
  coord_flip()
```

![plot of chunk unnamed-chunk-14](https://www.stoltzmaniac.com/wp-content/uploads/2017/04/unnamed-chunk-14-1-4.png)


## Composition - Stacked Bar 

**Objective**: Check out the composition of total production by state. It's interesting to see how the composition was relatively similar across decades until the 2010's. Texas was 50% of the output!


#### Poor Version  
My favorite, the beautiful pie chart! There's nothing better than this... (no need for further commentary).


```r
df = data %>%
  group_by(Location) %>%
  summarise(ThousandBarrel = sum(ThousandBarrel)) %>%
  mutate(ThousandBarrel = ThousandBarrel/sum(ThousandBarrel))

df$ThousandBarrel = round(100*df$ThousandBarrel,0)

library(plotrix)
pie(x=df$ThousandBarrel,labels=df$Location,explode=0.1,col=rainbow(nrow(df)),main='Percentage of Oil Production by State')
```

![plot of chunk unnamed-chunk-15](https://www.stoltzmaniac.com/wp-content/uploads/2017/04/unnamed-chunk-15-1-4.png)


#### Better Version  
The 1980's and 2010's will be missing years in terms of a "decade" due to the data provided (and it's only 2017). While the percentage labels are slightly off center, it's certainly much better than the pie chart. It's not quite "apples-to-apples" for a comparison because I created different decades, but you get the idea.

I also created an "Other" category in order to simplify the output. When you are doing comparisons, it's typically a good idea to find a way to reduce the number of variables in the output while not removing data by dropping it completely - **do this carefully and transparently!**


```r
data$Decade = '1980s'
data$Decade[data$Year >= 1990] = '1990s'
data$Decade[data$Year >= 2000] = '2000s'
data$Decade[data$Year >= 2010] = '2010s'
data$Decade = as.factor(data$Decade)

top5 = data %>%
  group_by(Location) %>%
  summarise(ThousandBarrel = sum(ThousandBarrel)) %>%
  arrange(-ThousandBarrel) %>%
  top_n(5) %>%
  select(Location)

top5List = top5$Location

data$State = "Other"

for(i in 1:length(top5List)){
  data$State[data$Location == top5List[i]] = top5List[i]
}

df = data %>%
  group_by(Decade,State) %>%
  summarise(ThousandBarrel = sum(ThousandBarrel)) %>%
  mutate(ThousandBarrel = ThousandBarrel/sum(ThousandBarrel))

df$ThousandBarrel = round(df$ThousandBarrel,3)
df$text = paste(round(100*df$ThousandBarrel,0),'%', sep='')

p = ggplot(df,aes(x=Decade,y=ThousandBarrel,col=reorder(State,ThousandBarrel),fill=reorder(State,ThousandBarrel)))
p + geom_bar(stat='identity') + 
  geom_text(aes(label=text),col='Black',size = 4, hjust = 0.5, vjust = 3, position = "stack") + 
  scale_y_continuous(labels = percent) +
  ggtitle('Percentage of Top Oil Producing States by Decade') + 
  guides(fill=guide_legend(title='State'),col=guide_legend(title='State')) + 
  theme(plot.title = element_text(hjust = 0.5))
```

![plot of chunk unnamed-chunk-16](https://www.stoltzmaniac.com/wp-content/uploads/2017/04/unnamed-chunk-16-1-4.png)




### Some other fun concepts are below!  
Some of them are nice, others are terrible! I won't comment on any of them, but I felt it was necessary to include some other ideas I toyed around with. 

Have fun with your data visualizations: be creative, think outside the box, use tools other than computers if it makes sense, fail often but learn quickly. I'm sure I'll think of a thousand better ways to have illustrated the concepts in this post by tomorrow, so I'll make updates as I think of them!

Now it's your turn!

As always, the code used in this post is on my [GitHub](https://github.com/stoltzmaniac/Data-Visualization-Lesson)



```r
df = data %>% 
  group_by(Location) %>%
  summarise(ThousandBarrel = sum(ThousandBarrel)) %>%
  arrange(-ThousandBarrel)
p = ggplot(df,aes(x=reorder(Location,ThousandBarrel),y=ThousandBarrel))
p + geom_bar(stat='identity') + 
  ggtitle('Oil Production 1981 - 2016 By Location') + 
  theme(plot.title = element_text(hjust = 0.5)) + 
  coord_flip()
```

![plot of chunk unnamed-chunk-17](https://www.stoltzmaniac.com/wp-content/uploads/2017/04/unnamed-chunk-17-1-4.png)






```r
top10 = data %>%
  group_by(Location) %>%
  summarise(ThousandBarrel = sum(ThousandBarrel)) %>%
  arrange(-ThousandBarrel) %>%
  top_n(10)
```

```
## Selecting by ThousandBarrel
```

```r
print(top10)
```

```
## # A tibble: 10 × 2
##       Location ThousandBarrel
##          <chr>          <dbl>
## 1        Texas       23447172
## 2       Alaska       15775279
## 3   California        9988225
## 4    Louisiana        4267246
## 5     Oklahoma        3701224
## 6      Wyoming        2894624
## 7       Kansas        1708873
## 8     Colorado        1288643
## 9         Utah         894657
## 10 Mississippi         861999
```

```r
df = data %>% 
  group_by(Location,Year) %>%
  filter(Location %in% top10$Location) %>%
  summarise(ThousandBarrel = sum(ThousandBarrel)) 
p = ggplot(df,aes(x=Year,y=ThousandBarrel,col=Location,fill=Location))
p + geom_bar(stat='identity') + 
  ggtitle('Oil Production - Top 10 States') + 
  theme(plot.title = element_text(hjust = 0.5)) + 
  theme(axis.text.x = element_text(angle = 90, hjust = 1))
```

![plot of chunk unnamed-chunk-18](https://www.stoltzmaniac.com/wp-content/uploads/2017/04/unnamed-chunk-18-1-4.png)




```r
df = data %>%
  filter(Year == 1990)%>%
  group_by(Location) %>%
  summarise(ThousandBarrel = sum(ThousandBarrel))
df$Location = tolower(df$Location)

#Add States without data
States = data.frame(Location = tolower(as.character(state.name)))
missingStates = States$Location[!(States$Location %in% df$Location)]
appendData = data.frame(Location=missingStates,ThousandBarrel=0)
df = rbind(df,appendData)

states_map <- map_data("state")

ggplot(df, aes(map_id = Location)) + 
    geom_map(aes(fill=ThousandBarrel), map = states_map) +
    expand_limits(x = states_map$long, y = states_map$lat)
```

![plot of chunk unnamed-chunk-19](https://www.stoltzmaniac.com/wp-content/uploads/2017/04/unnamed-chunk-19-1-4.png)



```r
df = data %>% 
  filter(Location == 'Texas') %>%
  group_by(Year,Month) %>%
  summarise(ThousandBarrel = sum(ThousandBarrel))

p = ggplot(df,aes(x=Month,y=ThousandBarrel))
p + geom_line(stat='identity',aes(group=Year,col=Year)) + 
  ggtitle('Oil Production By Year in the U.S.') + 
  theme(plot.title = element_text(hjust = 0.5)) + 
  theme(axis.text.x = element_text(angle = 90, hjust = 1))
```

![plot of chunk unnamed-chunk-20](https://www.stoltzmaniac.com/wp-content/uploads/2017/04/unnamed-chunk-20-1-4.png)







