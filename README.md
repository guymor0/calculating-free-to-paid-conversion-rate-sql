# Free-to-Paid Conversion Analysis

This project explores student engagement behavior on a learning platform, focusing on the time between registration, lecture engagement, and subscription.

## Project Structure

- `analysis.Rmd`: The main analysis in R Markdown
- `engagement_metrics.sql`: SQL query used to extract the relevant student data
- `time_differences.csv`: Raw data exported from the database (includes NA values, handled in the R code)

## Key Insights

- Most students engage shortly after registering (median and mode = 0 days).
- Although many convert quickly after watching a lecture, the mean time to purchase is longer (26 days), suggesting some users delay their decision—potentially waiting for discounts.
- Distributions confirm this behavior with a right-skewed tail in the *watch → purchase* transition.

## Visualizations

Histograms and descriptive statistics were used to identify behavioral patterns.

## Author

Guy Mor
