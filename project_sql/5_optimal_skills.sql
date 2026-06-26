WITH skill_salary AS (SELECT 
    salary_year_avg,
    skills
FROM job_postings_fact
LEFT JOIN skills_job_dim
    ON skills_job_dim.job_id = job_postings_fact.job_id
INNER JOIN skills_dim
    ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE 
    job_title_short = 'Data Analyst'
    AND salary_year_avg IS NOT NULL
    AND (job_location = 'Anywhere' OR job_work_from_home = TRUE)
)

SELECT 
    skills,
    COUNT(*) AS job_count,
    ROUND(AVG(salary_year_avg)) AS skill_salary_average
FROM skill_salary
GROUP BY skills
HAVING COUNT(*)> 10
ORDER BY skill_salary_average DESC