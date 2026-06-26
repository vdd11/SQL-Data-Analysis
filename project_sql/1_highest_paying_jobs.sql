-- identify top paying Data Analyst jobs, remove nulls, 

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
LIMIT 50;


SELECT *
FROM skills_job_dim
WHERE job_id = 552322