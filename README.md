# Data Analyst (Academic Project) – Super Bowl Historical Trend Analysis

## Exploratory Analysis and Visualization with R, dplyr, and ggplot2

I took on the role of data analyst to investigate historical trends in the Super Bowl, using a dataset spanning decades of viewership, advertising costs, and game results. My goals were to debunk common assumptions and visualize the evolution of this iconic event over time.

My first challenge was a data integrity issue. Super Bowl I was broadcast bytwo television networks, resulting in two duplicate records. To resolve this, I meticulously consolidated the two records into one, summing viewership and averaging advertising costs to create an accurate and single representation of the event.

Once I had a clean dataset, I addressed a key business question: "Does a closer game (with a smaller point spread) attract more viewers?" To answer this question, I combined viewership data with game data and calculated the correlation between point spread and average viewership. The analysis revealed a weak correlation, allowing me to use data to debunk the assumption that a competitive game is a major factor in historically attracting viewers. Finally, to understand the Super Bowl's growth trajectory, I analyzed the long-term trends of three key metrics: viewership, advertising cost, and ratings. Since these metrics operate on very different scales, I applied data normalization (scaling) to be able to fairly compare them in a single graph. I transformed the data into a long format (pivot_longer) for effective visualization and created a line chart that clearly showed the evolution of each variable, allowing me to identify which metric began to grow first. 

Demonstrated Achievements and Skills:
+ Demystified a business hypothesis by demonstrating with a correlation analysis that a match's competitiveness has a weak impact on total viewership.
+ Resolved a data integrity issue by identifying and consolidating duplicate records, ensuring the quality and reliability of the analysis.
+ Applied data normalization techniques to effectively and unbiasedly compare trends in variables with different scales.
+ Demonstrated high proficiency in data manipulation with dplyr and tidyr, using functions such as left_join and pivot_longer to prepare data for analysis and visualization.
+ Created clear and informative data visualizations with ggplot2 to communicate findings on correlations and trends over time.
+ Efficiently integrated multiple data sources to perform a holistic analysis that combined audience information with match-specific data.
