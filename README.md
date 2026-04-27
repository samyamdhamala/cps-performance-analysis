# CPS High School Performance Analysis



An exploratory analysis of Chicago Public Schools high school performance 

data using R, examining graduation rates, attendance, and college enrollment 

across school performance levels.



\## Data Source

Chicago Public Schools Progress Report 2013-2014  

Source: Chicago Data Portal (data.cityofchicago.org)  

188 high schools | 97 variables



\## Key Findings

\- A 24 percentage point graduation rate gap exists between Level 1 and 

&#x20; Level 3 schools (75.9% vs 51.9%)

\- Level 1 schools show significantly higher college enrollment rates 

&#x20; (71.1%) compared to Level 3 schools (51.2%)

\- Freshmen-on-track rate is a strong positive predictor of 4-year 

&#x20; graduation rate across all performance levels

\- Attendance rates drop from 92.2% at Level 1 schools to 81.3% 

&#x20; at Level 3 schools



\## Methods

\- Data cleaning and transformation using `dplyr`

\- Descriptive statistics grouped by CPS performance level

\- Visualizations built with `ggplot2`



\## Visualizations

!\[Graduation Rate by Performance Level](graduation\_by\_performance.png)

!\[Freshmen-on-Track vs Graduation Rate](freshmen\_vs\_graduation.png)



\## Tools

\- R 4.5.0

\- tidyverse, ggplot2, readr, dplyr

