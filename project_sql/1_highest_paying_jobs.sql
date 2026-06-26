-- identify top paying Data Analyst jobs, remove nulls, 

SELECT 
    job_title, 
    CASE
        WHEN job_location = 'Anywhere' THEN 'Remote'
        ELSE job_location
        END AS job_location,
    salary_year_avg
    
        

    
FROM 
    job_postings_fact
WHERE 
    salary_year_avg IS NOT NULL
    
ORDER BY
    salary_year_avg DESC
;


