/*
 Question: What are the top skills based on salary?
 - Look at the average salary associated with each skill for data analyst positions
 - Focuses on roles with specified salaries, regardless of location
 Why? It reveals how different skills impact salary levels for Data Analysts and
 helps identify the most financially rewarding skills to acquire or improve
 */
select
    skills,
    round(avg(salary_year_avg), 0) as avg_salary
from
    job_postings_fact
    inner join skills_job_dim on skills_job_dim.job_id = job_postings_fact.job_id
    inner join skills_dim on skills_job_dim.skill_id = skills_dim.skill_id
where
    job_title_short = 'Data Analyst'
    and salary_year_avg is not NULL
    and job_location = 'Anywhere'
group by
    skills
order by
    avg_salary desc
limit
    25;

/*
 The data provided gives us valuable insights into the top-paying skills for data analysts, revealing several key trends:
 
 1. Big Data and Cloud Computing Tools: The highest paying skills often relate to big data and cloud computing technologies. 
 For instance, PySpark tops the list with an average salary of $208,172. 
 Other big data tools like Couchbase and Databricks also command high salaries.
 
 2. Collaboration and Version Control: Tools for collaboration and version control, such as Bitbucket ($189,155) and GitLab ($154,500), are highly valued. 
 This highlights the importance of effective team collaboration in data projects.
 
 3. Machine Learning and AI: Proficiency in machine learning tools and libraries is also lucrative. 
 For example, Watson and DataRobot have average salaries of $160,515 and $155,486, respectively. 
 Libraries like Pandas ($151,821) and Scikit-learn ($125,781) are also well-compensated, underscoring the demand for machine learning expertise.
 
 4. Programming Languages: Knowledge of programming languages such as Swift ($153,750), Golang ($145,000), and Scala ($124,903) is highly rewarded. 
 This indicates the necessity for data analysts to be proficient in multiple programming languages.
 
 5. Data Visualization and Analysis Tools: 
 Tools that aid in data visualization and analysis, like Jupyter ($152,777) and MicroStrategy ($121,619), are among the top-paying skills, 
 reflecting their crucial role in interpreting and presenting data insights.
 
 6. Database Management Systems: Skills in database management systems, such as PostgreSQL ($123,879) and Elasticsearch ($145,000), are well-compensated, 
 emphasizing the importance of efficient data storage and retrieval.
 
 7. DevOps and Automation: Knowledge of DevOps and automation tools, including Jenkins ($125,436) and Kubernetes ($132,500), is in demand, 
 highlighting the trend towards automated and efficient data pipeline management.
 
 8. Cloud Platforms: Expertise in cloud platforms like GCP ($122,500) is also highly valued, 
 reflecting the increasing reliance on cloud infrastructure for data management and analysis.
 
 Overall, the trends indicate that data analysts who possess a diverse skill set, 
 particularly in big data technologies, machine learning, programming languages, and cloud platforms, are likely to command higher salaries. 
 This aligns with the broader industry movement towards leveraging advanced data analytics and cloud computing to drive business insights and efficiency.
 */