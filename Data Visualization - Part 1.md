---
title: "Data Visualization - Part 1"
subtitle: "The Good, The Bad and The Ugly"
author: "Scott Stoltzman"
date: "March 14, 2017"
output: html_document
---


----  

# A Lesson on Data Visualization - Introduction  

<img src="http://i.imgur.com/IzVR9vp.png" title="plot of chunk unnamed-chunk-4" alt="plot of chunk unnamed-chunk-4" style="display: block; margin: auto;" />

The topic of data visualization is still very popular in the data science community. The market size for visualization products is valued at $4 Billion and is projected to reach 
$7 Billion by the end of 2022 according to [Mordor Intelligence.](https://www.mordorintelligence.com/industry-reports/data-visualization-applications-market-future-of-decision-making-industry) While we have seen amazing advances in the technology to display information, the understanding of how, why, and when to use visualization techniques has not kept up. Unfortunately, people are often taught how to make a chart before even thinking about whether or not it's appropriate.  

In short, are you adding value to your work or are you simply adding this to make it seem ***less boring?*** Let's take a look at some examples before going through the Stoltzmaniac Data Visualization Philosophy.

---- 

I have to give credit to [Junk Charts](http://junkcharts.typepad.com/) - it inspired a lot of this post.

### One author at Vox wanted to show the cause of death in all of Shakespeare

<img src="http://i.imgur.com/9BGYA65.png" title="plot of chunk unnamed-chunk-5" alt="plot of chunk unnamed-chunk-5" style="display: block; margin: auto;" />
    

**Is this not insane!?!?!**  

Using a legend instead of data callouts is the only thing that could have made this worse. The author could easily have used a number of other tools to get the point across. I hate wordles but due to the fact that the article wasn't trying to show the exact proportions, a wordle easily illustrates the point (the point made by [Junk Charts Article](http://junkcharts.typepad.com/junk_charts/2016/03/which-way-to-die-the-bard-asked-onelesspie.html)).
  

<img src="http://i.imgur.com/xQ6pQIg.png" title="plot of chunk unnamed-chunk-6" alt="plot of chunk unnamed-chunk-6" style="display: block; margin: auto;" />
----  

To be clear, I'm not close to being perfect when it comes to visualizations in my blog. The sizes, shapes, font colors, etc. tend to get out of control and I don't take the time in R to tinker with all of the details. However, when it comes to displaying things professionally, it has to be spot on! So, I'll walk through my theory and not worry too much about aesthetics (save that for a time when you're getting paid).

----

### The Good, The Bad, The Ugly  

**"The Good" visualizations:**  

- Clearly illustrate a point  
- Are tailored to the appropriate audience  
    - Analysts may want detail  
    - Executives may want a high-level view  
- Are tailored to the presentation medium  
    - A piece in an academic journal can be analyzed slowly and carefully  
    - A slide in front of 5,000 people in a conference will be glanced at quickly  
- Are memorable to those who care about the material  
- Make an impact which increase the understanding of the subject matter  

**"The Bad" visualizations:**  

- Are difficult to interpret  
- Are unintentionally misleading  
- Contain redundant and boring information  

**"The Ugly" visualizations:**  

- Are almost impossible to interpret  
- Are filled with completely worthless information  
- Are intentionally created to mislead the audience  
- Are inaccurate  

### Coming soon:  

- Determining whether or not you need a visualization  
- Choosing the type of plot to use depending on the use case  
- Introduction to the ggplot2 in R and how it works  
- Visualization beyond the standard charts and graphs  

As always, the code used in this post is on my [GitHub](https://github.com/stoltzmaniac/Data-Visualization-Lesson)
