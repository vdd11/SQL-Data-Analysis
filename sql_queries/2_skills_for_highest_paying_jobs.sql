-- find the skills associated with these jobs

WITH top_jobs AS (
    SELECT 
        job_id,
        company_id,
        job_title, 
        job_location,
        salary_year_avg,
        job_posted_date AT TIME ZONE 'UTC' AT TIME ZONE 'EST' AS date_posted

    
    FROM 
        job_postings_fact
    WHERE 
        job_title_short = 'Data Analyst' AND
        job_location = 'Anywhere' AND
        salary_year_avg IS NOT NULL
    
    ORDER BY
        salary_year_avg DESC
    LIMIT 50
)

SELECT 
    company_dim.name AS company_name,
    job_title,
    skills_dim.skills,
    skills_dim.type,
    salary_year_avg
FROM 
    top_jobs
INNER JOIN company_dim
    ON company_dim.company_id = top_jobs.company_id
INNER JOIN skills_job_dim
    ON top_jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim
    ON skills_job_dim.skill_id = skills_dim.skill_id

