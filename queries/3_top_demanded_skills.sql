/*
Question: What are the most in-demand skills for entry-level remote Data jobs?

- Join job postings to inner join table similar to query 2.
- Identify the top 5 in-demand skills for a Data job.
- Focus on Junior Data-related job postings.

Goal: To find out top 5 skills with the highest demand in the job market,
      considering my requirements.

*/

SELECT
    skills,
    COUNT(skills_job_dim.job_id) AS demand_count
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    (
    job_title ILIKE '%Data%' OR
    job_title ILIKE '%Business Analyst%'
    )
    AND job_title ILIKE '%Junior%'
    AND job_work_from_home = True
GROUP BY
    skills
ORDER BY
    demand_count DESC
LIMIT 5



/*
[
  {
    "skills": "sql",
    "demand_count": "554"
  },
  {
    "skills": "python",
    "demand_count": "554"
  },
  {
    "skills": "excel",
    "demand_count": "227"
  },
  {
    "skills": "r",
    "demand_count": "190"
  },
  {
    "skills": "tableau",
    "demand_count": "177"
  }
]
*/