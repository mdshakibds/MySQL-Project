# Movie Streaming Platform SQL Project

## Overview

This project provides a realistic dataset and SQL queries to analyze user behavior, content popularity, and operational metrics for a movie streaming platform (e.g., Netflix-like). The analytics and data are designed for media analysts, data scientists, and engineers to gain insights into platform engagement, content trends, subscription performance, and more.

## Table of Contents

- [Project Structure](#project-structure)
- [Features](#features)
- [Data Sources](#data-sources)
- [Key SQL Queries](#key-sql-queries)
- [How to Use](#how-to-use)
- [Sample Analysis Topics](#sample-analysis-topics)
- [Contributing](#contributing)
- [License](#license)

## Project Structure

```
Movie_streaming/
├── Movie_streaming.csv         # Sample watch history dataset
└── Movie_Streaming.sql         # Analytics/reporting SQL queries
```

## Features

- Top watched movies/TV shows and trending titles by region
- Genre and device usage analytics
- User-level metrics: average watch time, completion rate, activity, ratings
- Engagement comparison across subscription types
- Region-wise and daily viewing trends
- Inactive user detection for retention campaigns

## Data Sources

**Movie_streaming.csv**:  
Consists of simulated watch history data, including:
- User info: ID, name, region, subscription type
- Content details: movie/TV show ID, title, genre, type, duration
- Watch stats: watch time, date, rating, device, completion status

Sample columns:  
`record_id, user_id, user_name, region, subscription_type, movie_id, title, genre, type, watch_time_minutes, duration_minutes, watch_date, rating, device, status`

## Key SQL Queries

The file [`Movie_Streaming.sql`](Movie_streaming/Movie_Streaming.sql) provides ready-to-use queries for:

- Top 10 most watched movies/shows
- Most watched genres overall
- Per-user & per-title average watch/completion rates
- Daily and region-wise trending titles
- Inactive user list (for last 30 days)
- Genre popularity by region/device/subscription
- Average ratings and watch times by genre, device, subscription
- Top users by total watch time
- Titles with lowest completion rates
- Daily viewing trends

See the SQL script for full query details and analytics logic.

## How to Use

1. **Load the dataset**
   - Import `Movie_streaming.csv` into your SQL database.
   - Use the provided `CREATE TABLE watch_history` statement to define your schema.

2. **Run analytics**
   - Open and execute queries from `Movie_Streaming.sql`.
   - Queries are compatible with MySQL; adjust for other flavors as needed.

3. **Customize and extend**
   - Modify/adapt queries for deeper insight or special metrics.
   - Add new analytics or combine query results as desired.

## Sample Analysis Topics

- Content: Most/least engaging titles, genre trends, completion rates
- User: Top users, inactive users, engagement by subscription/device
- Operations: Viewing by region/country, day-wise activity, device breakdown
- Recommendations: Trending content, genre popularity, active user profiles

## Contributing

1. Fork the repo and add/query your changes.
2. Propose improvements to queries, dataset, or add new insights.
3. Submit a pull request with your modifications.

## License

MIT License

---

**Author:** [PANAKAJ01](https://github.com/PANAKAJ01)
