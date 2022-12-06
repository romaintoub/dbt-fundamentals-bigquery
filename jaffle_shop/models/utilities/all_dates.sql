{{ dbt_utils.date_spine(
    datepart="day",
    start_date="CAST('2019-01-01' AS DATE)",
    end_date="CURRENT_DATE()"
   )
}}
