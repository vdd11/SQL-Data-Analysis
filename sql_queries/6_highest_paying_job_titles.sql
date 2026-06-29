SELECT 
    job_title_short,
    ROUND(AVG(salary_year_avg)) AS job_salary_average,
    COUNT(job_title_short) AS job_posted_count
FROM job_postings_fact  
WHERE 
    salary_year_avg IS NOT NULL
GROUP BY job_title_short
ORDER BY job_salary_average DESC 