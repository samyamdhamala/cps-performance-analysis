# CPS High School Performance Analysis
# Author: Samyam Dhamala
# Data: Chicago Public Schools Progress Report 2013-2014

library(tidyverse)

# Load data
df <- read_csv("Chicago_Public_Schools_-_High_School_Progress_Report__2013-2014_.csv")

# Clean and select relevant columns
df_clean <- df %>%
  select(
    school_name = `Name of School`,
    performance_level = `CPS Performance Policy Level`,
    attendance = `Student Attendance Percentage 2013`,
    graduation_rate = `4-Year Graduation Rate Percentage 2013`,
    college_enrollment = `College Enrollment Rate Percentage 2013`,
    freshmen_on_track = `Freshmen-on-Track Rate Percentage 2013`,
    dropout_rate = `One-Year DropOut Rate Percentage 2013`,
    suspensions = `Suspensions Per 100 2013`
  ) %>%
  filter(!is.na(performance_level)) %>%
  filter(!is.na(graduation_rate))

# Descriptive statistics by performance level
summary_stats <- df_clean %>%
  group_by(performance_level) %>%
  summarise(
    n_schools = n(),
    avg_graduation = mean(graduation_rate, na.rm = TRUE),
    avg_attendance = mean(attendance, na.rm = TRUE),
    avg_college_enrollment = mean(college_enrollment, na.rm = TRUE),
    avg_freshmen_on_track = mean(freshmen_on_track, na.rm = TRUE),
    avg_dropout_rate = mean(dropout_rate, na.rm = TRUE)
  ) %>%
  arrange(desc(avg_graduation))

print(summary_stats)

# Chart 1: Graduation rate by performance level
ggplot(summary_stats, aes(x = reorder(performance_level, avg_graduation),
                          y = avg_graduation,
                          fill = performance_level)) +
  geom_col() +
  coord_flip() +
  labs(
    title = "Average 4-Year Graduation Rate by CPS Performance Level (2013-2014)",
    x = "Performance Level",
    y = "Average Graduation Rate (%)",
    caption = "Source: Chicago Public Schools Progress Report 2013-2014"
  ) +
  theme_minimal() +
  theme(legend.position = "none")

ggsave("graduation_by_performance.png", width = 8, height = 5)

# Chart 2: Freshmen-on-track vs graduation rate
ggplot(df_clean, aes(x = freshmen_on_track,
                     y = graduation_rate,
                     color = performance_level)) +
  geom_point(size = 3, alpha = 0.7) +
  geom_smooth(method = "lm", se = FALSE, color = "gray40", linetype = "dashed") +
  labs(
    title = "Freshmen-on-Track Rate vs. 4-Year Graduation Rate",
    subtitle = "Each point represents one CPS high school (2013-2014)",
    x = "Freshmen-on-Track Rate (%)",
    y = "4-Year Graduation Rate (%)",
    color = "Performance Level",
    caption = "Source: Chicago Public Schools Progress Report 2013-2014"
  ) +
  theme_minimal()

ggsave("freshmen_vs_graduation.png", width = 8, height = 5)