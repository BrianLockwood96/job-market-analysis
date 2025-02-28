/*
Question: What are the highest-paying remote junior roles in Data and Business Analysis?

- Retrieve the top 30 highest-paying Data-related or Business Analyst positions.
- Include only remote jobs (available anywhere).
- Ensure the job title contains “Junior” to focus on entry-level roles.
- Exclude postings without salary information (remove null values).

Goal: Understand the salary expectations for top-paying junior remote jobs in the Data and Business Analysis market.
*/

SELECT
    job_title,
    job_title_short,
    salary_year_avg,
    name AS company_name
FROM
    job_postings_fact
LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE
    (
    job_title ILIKE '%Data%' OR
    job_title ILIKE '%Business Analyst%'
    )
    AND job_title ILIKE '%Junior%'
    AND job_location = 'Anywhere'
    AND salary_year_avg IS NOT NULL
ORDER BY
    salary_year_avg DESC
LIMIT 30