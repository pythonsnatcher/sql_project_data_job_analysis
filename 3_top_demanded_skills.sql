/*
Question: What are the top 5 skills most in demand among remote Data Analyst job postings?
- Analyze the frequency of skills required in remote Data Analyst roles.
- Identify the skills that are most sought after across various remote job postings.
- Gain insights into the essential skills for Data Analysts in remote work environments based on current job market trends.
*/
select
    count(skills_job_dim.job_id) as demand_count,
    skills
from
    job_postings_fact
    inner join skills_job_dim on skills_job_dim.job_id = job_postings_fact.job_id
    inner join skills_dim on skills_job_dim.skill_id = skills_dim.skill_id
where
    job_title_short = 'Data Analyst' AND job_location = 'Anywhere'
group BY
    skills
order by
    demand_count desc
limit
    5;