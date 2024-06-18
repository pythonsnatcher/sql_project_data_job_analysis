/*
 Question: What are the top paying data analyst jobs?
 -Identify the top 10 highest paying Data Analyst roles that are available remotely.
 -Focus on job postings with specified Salaries (remove nulls).
 -Why? Highlight the top-paying opportunities for Data Analysts, offering insight into employers wants.
 */
SELECT
    job_id,
    job_title,
    job_location,
    Job_schedule_type,
    salary_year_avg,
    job_posted_date,
    name
FROM
    job_postings_fact
    left JOIN
    company_dim on company_dim.company_id = job_postings_fact.company_id
where
    job_title_short = 'Data Analyst'
    AND job_location = 'Anywhere'
    AND salary_year_avg is not NULL
order BY
    salary_year_avg DESC
limit
    10