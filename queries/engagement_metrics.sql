SELECT 
    ROUND(SUM(first_date_purchased >= first_date_watched) * 100.0 / COUNT(*),
            2) AS conversion_rate,
    ROUND(SUM(date_diff_reg_watch) * 1.0 / COUNT(*),
            2) AS av_reg_watch,
    ROUND(SUM(date_diff_watch_purch) * 1.0 / COUNT(date_diff_watch_purch),
            2) AS av_watch_purch
FROM
    (SELECT 
        si.student_id,
            si.date_registered,
            MIN(se.date_watched) AS first_date_watched,
            MIN(sp.date_purchased) AS first_date_purchased,
            ABS(DATEDIFF(MIN(se.date_watched), si.date_registered)) AS date_diff_reg_watch,
            ABS(DATEDIFF(MIN(sp.date_purchased), MIN(se.date_watched))) AS date_diff_watch_purch
    FROM
        student_info si
    JOIN student_engagement se ON si.student_id = se.student_id
    LEFT JOIN student_purchases sp ON si.student_id = sp.student_id
    GROUP BY si.student_id , si.date_registered
    HAVING first_date_purchased IS NULL
        OR first_date_watched <= first_date_purchased) AS sub;