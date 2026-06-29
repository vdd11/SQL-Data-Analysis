-- find the skills that pay the most

WITH skill_salary AS (SELECT 
    salary_year_avg,
    skills
FROM job_postings_fact
LEFT JOIN skills_job_dim
    ON skills_job_dim.job_id = job_postings_fact.job_id
INNER JOIN skills_dim
    ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE 
    salary_year_avg IS NOT NULL
)

SELECT 
    skills,
    COUNT(*) AS skill_count,
    ROUND(AVG(salary_year_avg)) AS skill_salary_average
FROM skill_salary
GROUP BY skills
HAVING COUNT(*)> 10
ORDER BY skill_salary_average DESC


