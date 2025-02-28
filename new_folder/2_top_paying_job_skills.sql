/*
Question: What skills are required for the top-paying entry level Data jobs?

- Use the top 30 highest-paying Data jobs from first query.
- Add the specific skills required for these roles.

Goal: To understand which skills to develop that align with top salaries.
*/

WITH top_paying_jobs AS (
    SELECT
        job_id,
        job_title,
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
)

SELECT
    top_paying_jobs.*,
    skills_dim.skills
FROM top_paying_jobs
INNER JOIN skills_job_dim ON top_paying_jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY
    salary_year_avg DESC



/*
Top 10 Most In-Demand Skills:

- SQL (26 mentions) is the most required skill, indicating its critical role in data-related jobs.
- Python (17 mentions) is the second most sought-after skill, reinforcing its dominance in data science.
- SAS (14 mentions) and R (11 mentions) are also in high demand, showing the relevance of statistical programming.
- VBA and Excel (both 9 mentions) highlight the need for spreadsheet automation and financial modeling.
- Oracle (8 mentions) suggests that experience with database management systems is valuable.
- MATLAB (7 mentions) appears, likely relevant to specialized data analysis roles.
- JavaScript and HTML (both 6 mentions) indicate that web-based data applications may be part of certain job roles.



Below is a result in JSON format

[
  {
    "job_id": 567864,
    "job_title": "Junior Data Engineer",
    "salary_year_avg": "115000.0",
    "company_name": "Patterned Learning AI",
    "skills": "sql"
  },
  {
    "job_id": 567864,
    "job_title": "Junior Data Engineer",
    "salary_year_avg": "115000.0",
    "company_name": "Patterned Learning AI",
    "skills": "c#"
  },
  {
    "job_id": 567864,
    "job_title": "Junior Data Engineer",
    "salary_year_avg": "115000.0",
    "company_name": "Patterned Learning AI",
    "skills": "sql server"
  },
  {
    "job_id": 567864,
    "job_title": "Junior Data Engineer",
    "salary_year_avg": "115000.0",
    "company_name": "Patterned Learning AI",
    "skills": "azure"
  },
  {
    "job_id": 567864,
    "job_title": "Junior Data Engineer",
    "salary_year_avg": "115000.0",
    "company_name": "Patterned Learning AI",
    "skills": "flow"
  },
  {
    "job_id": 161651,
    "job_title": "Junior Data Scientist (Remote)",
    "salary_year_avg": "105000.0",
    "company_name": "Trilogy Federal",
    "skills": "sql"
  },
  {
    "job_id": 161651,
    "job_title": "Junior Data Scientist (Remote)",
    "salary_year_avg": "105000.0",
    "company_name": "Trilogy Federal",
    "skills": "python"
  },
  {
    "job_id": 161651,
    "job_title": "Junior Data Scientist (Remote)",
    "salary_year_avg": "105000.0",
    "company_name": "Trilogy Federal",
    "skills": "r"
  },
  {
    "job_id": 153367,
    "job_title": "Junior Data Scientist",
    "salary_year_avg": "105000.0",
    "company_name": "Trilogy Federal",
    "skills": "sql"
  },
  {
    "job_id": 153367,
    "job_title": "Junior Data Scientist",
    "salary_year_avg": "105000.0",
    "company_name": "Trilogy Federal",
    "skills": "python"
  },
  {
    "job_id": 153367,
    "job_title": "Junior Data Scientist",
    "salary_year_avg": "105000.0",
    "company_name": "Trilogy Federal",
    "skills": "r"
  },
  {
    "job_id": 958457,
    "job_title": "Junior Data Scientist",
    "salary_year_avg": "100000.0",
    "company_name": "Morgan Hunter",
    "skills": "sql"
  },
  {
    "job_id": 958457,
    "job_title": "Junior Data Scientist",
    "salary_year_avg": "100000.0",
    "company_name": "Morgan Hunter",
    "skills": "python"
  },
  {
    "job_id": 958457,
    "job_title": "Junior Data Scientist",
    "salary_year_avg": "100000.0",
    "company_name": "Morgan Hunter",
    "skills": "r"
  },
  {
    "job_id": 958457,
    "job_title": "Junior Data Scientist",
    "salary_year_avg": "100000.0",
    "company_name": "Morgan Hunter",
    "skills": "sas"
  },
  {
    "job_id": 958457,
    "job_title": "Junior Data Scientist",
    "salary_year_avg": "100000.0",
    "company_name": "Morgan Hunter",
    "skills": "excel"
  },
  {
    "job_id": 958457,
    "job_title": "Junior Data Scientist",
    "salary_year_avg": "100000.0",
    "company_name": "Morgan Hunter",
    "skills": "tableau"
  },
  {
    "job_id": 958457,
    "job_title": "Junior Data Scientist",
    "salary_year_avg": "100000.0",
    "company_name": "Morgan Hunter",
    "skills": "sas"
  },
  {
    "job_id": 958457,
    "job_title": "Junior Data Scientist",
    "salary_year_avg": "100000.0",
    "company_name": "Morgan Hunter",
    "skills": "spss"
  },
  {
    "job_id": 463381,
    "job_title": "Data Analyst (Junior/Mid/Senior) - Remote - Defense Manpower Data...",
    "salary_year_avg": "82000.0",
    "company_name": "Get It Recruit - Information Technology",
    "skills": "sql"
  },
  {
    "job_id": 463381,
    "job_title": "Data Analyst (Junior/Mid/Senior) - Remote - Defense Manpower Data...",
    "salary_year_avg": "82000.0",
    "company_name": "Get It Recruit - Information Technology",
    "skills": "t-sql"
  },
  {
    "job_id": 463381,
    "job_title": "Data Analyst (Junior/Mid/Senior) - Remote - Defense Manpower Data...",
    "salary_year_avg": "82000.0",
    "company_name": "Get It Recruit - Information Technology",
    "skills": "oracle"
  },
  {
    "job_id": 550113,
    "job_title": "Junior Data Analyst",
    "salary_year_avg": "80000.0",
    "company_name": "Motion Recruitment",
    "skills": "python"
  },
  {
    "job_id": 674136,
    "job_title": "Junior Business Analyst",
    "salary_year_avg": "80000.0",
    "company_name": "Coders Data",
    "skills": "sql"
  },
  {
    "job_id": 674136,
    "job_title": "Junior Business Analyst",
    "salary_year_avg": "80000.0",
    "company_name": "Coders Data",
    "skills": "excel"
  },
  {
    "job_id": 674136,
    "job_title": "Junior Business Analyst",
    "salary_year_avg": "80000.0",
    "company_name": "Coders Data",
    "skills": "power bi"
  },
  {
    "job_id": 674136,
    "job_title": "Junior Business Analyst",
    "salary_year_avg": "80000.0",
    "company_name": "Coders Data",
    "skills": "word"
  },
  {
    "job_id": 674136,
    "job_title": "Junior Business Analyst",
    "salary_year_avg": "80000.0",
    "company_name": "Coders Data",
    "skills": "outlook"
  },
  {
    "job_id": 674136,
    "job_title": "Junior Business Analyst",
    "salary_year_avg": "80000.0",
    "company_name": "Coders Data",
    "skills": "jira"
  },
  {
    "job_id": 674136,
    "job_title": "Junior Business Analyst",
    "salary_year_avg": "80000.0",
    "company_name": "Coders Data",
    "skills": "confluence"
  },
  {
    "job_id": 564679,
    "job_title": "Junior Data Analyst",
    "salary_year_avg": "80000.0",
    "company_name": "Coders Data",
    "skills": "sql"
  },
  {
    "job_id": 564679,
    "job_title": "Junior Data Analyst",
    "salary_year_avg": "80000.0",
    "company_name": "Coders Data",
    "skills": "python"
  },
  {
    "job_id": 564679,
    "job_title": "Junior Data Analyst",
    "salary_year_avg": "80000.0",
    "company_name": "Coders Data",
    "skills": "r"
  },
  {
    "job_id": 564679,
    "job_title": "Junior Data Analyst",
    "salary_year_avg": "80000.0",
    "company_name": "Coders Data",
    "skills": "excel"
  },
  {
    "job_id": 564679,
    "job_title": "Junior Data Analyst",
    "salary_year_avg": "80000.0",
    "company_name": "Coders Data",
    "skills": "tableau"
  },
  {
    "job_id": 564679,
    "job_title": "Junior Data Analyst",
    "salary_year_avg": "80000.0",
    "company_name": "Coders Data",
    "skills": "sharepoint"
  },
  {
    "job_id": 564679,
    "job_title": "Junior Data Analyst",
    "salary_year_avg": "80000.0",
    "company_name": "Coders Data",
    "skills": "jira"
  },
  {
    "job_id": 564679,
    "job_title": "Junior Data Analyst",
    "salary_year_avg": "80000.0",
    "company_name": "Coders Data",
    "skills": "confluence"
  },
  {
    "job_id": 964514,
    "job_title": "Junior Data Scientist - US/Canada",
    "salary_year_avg": "75000.0",
    "company_name": "Patterned Learning AI",
    "skills": "python"
  },
  {
    "job_id": 964514,
    "job_title": "Junior Data Scientist - US/Canada",
    "salary_year_avg": "75000.0",
    "company_name": "Patterned Learning AI",
    "skills": "databricks"
  },
  {
    "job_id": 964514,
    "job_title": "Junior Data Scientist - US/Canada",
    "salary_year_avg": "75000.0",
    "company_name": "Patterned Learning AI",
    "skills": "pandas"
  },
  {
    "job_id": 964514,
    "job_title": "Junior Data Scientist - US/Canada",
    "salary_year_avg": "75000.0",
    "company_name": "Patterned Learning AI",
    "skills": "numpy"
  },
  {
    "job_id": 964514,
    "job_title": "Junior Data Scientist - US/Canada",
    "salary_year_avg": "75000.0",
    "company_name": "Patterned Learning AI",
    "skills": "pyspark"
  },
  {
    "job_id": 964514,
    "job_title": "Junior Data Scientist - US/Canada",
    "salary_year_avg": "75000.0",
    "company_name": "Patterned Learning AI",
    "skills": "matplotlib"
  },
  {
    "job_id": 30665,
    "job_title": "Junior Data Scientist Engineer - US/Canada",
    "salary_year_avg": "75000.0",
    "company_name": "Patterned Learning AI",
    "skills": "sql"
  },
  {
    "job_id": 30665,
    "job_title": "Junior Data Scientist Engineer - US/Canada",
    "salary_year_avg": "75000.0",
    "company_name": "Patterned Learning AI",
    "skills": "python"
  },
  {
    "job_id": 30665,
    "job_title": "Junior Data Scientist Engineer - US/Canada",
    "salary_year_avg": "75000.0",
    "company_name": "Patterned Learning AI",
    "skills": "r"
  },
  {
    "job_id": 30665,
    "job_title": "Junior Data Scientist Engineer - US/Canada",
    "salary_year_avg": "75000.0",
    "company_name": "Patterned Learning AI",
    "skills": "sas"
  },
  {
    "job_id": 30665,
    "job_title": "Junior Data Scientist Engineer - US/Canada",
    "salary_year_avg": "75000.0",
    "company_name": "Patterned Learning AI",
    "skills": "javascript"
  },
  {
    "job_id": 30665,
    "job_title": "Junior Data Scientist Engineer - US/Canada",
    "salary_year_avg": "75000.0",
    "company_name": "Patterned Learning AI",
    "skills": "html"
  },
  {
    "job_id": 30665,
    "job_title": "Junior Data Scientist Engineer - US/Canada",
    "salary_year_avg": "75000.0",
    "company_name": "Patterned Learning AI",
    "skills": "matlab"
  },
  {
    "job_id": 30665,
    "job_title": "Junior Data Scientist Engineer - US/Canada",
    "salary_year_avg": "75000.0",
    "company_name": "Patterned Learning AI",
    "skills": "vba"
  },
  {
    "job_id": 30665,
    "job_title": "Junior Data Scientist Engineer - US/Canada",
    "salary_year_avg": "75000.0",
    "company_name": "Patterned Learning AI",
    "skills": "oracle"
  },
  {
    "job_id": 30665,
    "job_title": "Junior Data Scientist Engineer - US/Canada",
    "salary_year_avg": "75000.0",
    "company_name": "Patterned Learning AI",
    "skills": "sas"
  },
  {
    "job_id": 744300,
    "job_title": "Junior Data Scientist Engineer",
    "salary_year_avg": "75000.0",
    "company_name": "Patterned Learning AI",
    "skills": "sql"
  },
  {
    "job_id": 744300,
    "job_title": "Junior Data Scientist Engineer",
    "salary_year_avg": "75000.0",
    "company_name": "Patterned Learning AI",
    "skills": "python"
  },
  {
    "job_id": 744300,
    "job_title": "Junior Data Scientist Engineer",
    "salary_year_avg": "75000.0",
    "company_name": "Patterned Learning AI",
    "skills": "r"
  },
  {
    "job_id": 744300,
    "job_title": "Junior Data Scientist Engineer",
    "salary_year_avg": "75000.0",
    "company_name": "Patterned Learning AI",
    "skills": "sas"
  },
  {
    "job_id": 744300,
    "job_title": "Junior Data Scientist Engineer",
    "salary_year_avg": "75000.0",
    "company_name": "Patterned Learning AI",
    "skills": "javascript"
  },
  {
    "job_id": 744300,
    "job_title": "Junior Data Scientist Engineer",
    "salary_year_avg": "75000.0",
    "company_name": "Patterned Learning AI",
    "skills": "html"
  },
  {
    "job_id": 744300,
    "job_title": "Junior Data Scientist Engineer",
    "salary_year_avg": "75000.0",
    "company_name": "Patterned Learning AI",
    "skills": "matlab"
  },
  {
    "job_id": 744300,
    "job_title": "Junior Data Scientist Engineer",
    "salary_year_avg": "75000.0",
    "company_name": "Patterned Learning AI",
    "skills": "vba"
  },
  {
    "job_id": 744300,
    "job_title": "Junior Data Scientist Engineer",
    "salary_year_avg": "75000.0",
    "company_name": "Patterned Learning AI",
    "skills": "oracle"
  },
  {
    "job_id": 744300,
    "job_title": "Junior Data Scientist Engineer",
    "salary_year_avg": "75000.0",
    "company_name": "Patterned Learning AI",
    "skills": "sas"
  },
  {
    "job_id": 1351433,
    "job_title": "Junior Data Scientist Engineer - US",
    "salary_year_avg": "75000.0",
    "company_name": "Patterned Learning AI",
    "skills": "sql"
  },
  {
    "job_id": 1351433,
    "job_title": "Junior Data Scientist Engineer - US",
    "salary_year_avg": "75000.0",
    "company_name": "Patterned Learning AI",
    "skills": "python"
  },
  {
    "job_id": 1351433,
    "job_title": "Junior Data Scientist Engineer - US",
    "salary_year_avg": "75000.0",
    "company_name": "Patterned Learning AI",
    "skills": "r"
  },
  {
    "job_id": 1351433,
    "job_title": "Junior Data Scientist Engineer - US",
    "salary_year_avg": "75000.0",
    "company_name": "Patterned Learning AI",
    "skills": "sas"
  },
  {
    "job_id": 1351433,
    "job_title": "Junior Data Scientist Engineer - US",
    "salary_year_avg": "75000.0",
    "company_name": "Patterned Learning AI",
    "skills": "javascript"
  },
  {
    "job_id": 1351433,
    "job_title": "Junior Data Scientist Engineer - US",
    "salary_year_avg": "75000.0",
    "company_name": "Patterned Learning AI",
    "skills": "html"
  },
  {
    "job_id": 1351433,
    "job_title": "Junior Data Scientist Engineer - US",
    "salary_year_avg": "75000.0",
    "company_name": "Patterned Learning AI",
    "skills": "matlab"
  },
  {
    "job_id": 1351433,
    "job_title": "Junior Data Scientist Engineer - US",
    "salary_year_avg": "75000.0",
    "company_name": "Patterned Learning AI",
    "skills": "vba"
  },
  {
    "job_id": 1351433,
    "job_title": "Junior Data Scientist Engineer - US",
    "salary_year_avg": "75000.0",
    "company_name": "Patterned Learning AI",
    "skills": "oracle"
  },
  {
    "job_id": 1351433,
    "job_title": "Junior Data Scientist Engineer - US",
    "salary_year_avg": "75000.0",
    "company_name": "Patterned Learning AI",
    "skills": "sas"
  },
  {
    "job_id": 385688,
    "job_title": "Junior Data Scientist Engineer",
    "salary_year_avg": "75000.0",
    "company_name": "Patterned Learning AI",
    "skills": "sql"
  },
  {
    "job_id": 385688,
    "job_title": "Junior Data Scientist Engineer",
    "salary_year_avg": "75000.0",
    "company_name": "Patterned Learning AI",
    "skills": "python"
  },
  {
    "job_id": 385688,
    "job_title": "Junior Data Scientist Engineer",
    "salary_year_avg": "75000.0",
    "company_name": "Patterned Learning AI",
    "skills": "r"
  },
  {
    "job_id": 385688,
    "job_title": "Junior Data Scientist Engineer",
    "salary_year_avg": "75000.0",
    "company_name": "Patterned Learning AI",
    "skills": "sas"
  },
  {
    "job_id": 385688,
    "job_title": "Junior Data Scientist Engineer",
    "salary_year_avg": "75000.0",
    "company_name": "Patterned Learning AI",
    "skills": "javascript"
  },
  {
    "job_id": 385688,
    "job_title": "Junior Data Scientist Engineer",
    "salary_year_avg": "75000.0",
    "company_name": "Patterned Learning AI",
    "skills": "html"
  },
  {
    "job_id": 385688,
    "job_title": "Junior Data Scientist Engineer",
    "salary_year_avg": "75000.0",
    "company_name": "Patterned Learning AI",
    "skills": "matlab"
  },
  {
    "job_id": 385688,
    "job_title": "Junior Data Scientist Engineer",
    "salary_year_avg": "75000.0",
    "company_name": "Patterned Learning AI",
    "skills": "vba"
  },
  {
    "job_id": 385688,
    "job_title": "Junior Data Scientist Engineer",
    "salary_year_avg": "75000.0",
    "company_name": "Patterned Learning AI",
    "skills": "oracle"
  },
  {
    "job_id": 385688,
    "job_title": "Junior Data Scientist Engineer",
    "salary_year_avg": "75000.0",
    "company_name": "Patterned Learning AI",
    "skills": "sas"
  },
  {
    "job_id": 110465,
    "job_title": "Junior Data Engineer",
    "salary_year_avg": "75000.0",
    "company_name": "Patterned Learning AI",
    "skills": "sql"
  },
  {
    "job_id": 156786,
    "job_title": "Junior Data Analyst",
    "salary_year_avg": "75000.0",
    "company_name": "Patterned Learning AI",
    "skills": "sql"
  },
  {
    "job_id": 156786,
    "job_title": "Junior Data Analyst",
    "salary_year_avg": "75000.0",
    "company_name": "Patterned Learning AI",
    "skills": "excel"
  },
  {
    "job_id": 156786,
    "job_title": "Junior Data Analyst",
    "salary_year_avg": "75000.0",
    "company_name": "Patterned Learning AI",
    "skills": "sheets"
  },
  {
    "job_id": 1170721,
    "job_title": "Junior Data BI Analyst",
    "salary_year_avg": "75000.0",
    "company_name": "Patterned Learning AI",
    "skills": "sql"
  },
  {
    "job_id": 1170721,
    "job_title": "Junior Data BI Analyst",
    "salary_year_avg": "75000.0",
    "company_name": "Patterned Learning AI",
    "skills": "nosql"
  },
  {
    "job_id": 1170721,
    "job_title": "Junior Data BI Analyst",
    "salary_year_avg": "75000.0",
    "company_name": "Patterned Learning AI",
    "skills": "vba"
  },
  {
    "job_id": 1170721,
    "job_title": "Junior Data BI Analyst",
    "salary_year_avg": "75000.0",
    "company_name": "Patterned Learning AI",
    "skills": "oracle"
  },
  {
    "job_id": 1170721,
    "job_title": "Junior Data BI Analyst",
    "salary_year_avg": "75000.0",
    "company_name": "Patterned Learning AI",
    "skills": "hadoop"
  },
  {
    "job_id": 1170721,
    "job_title": "Junior Data BI Analyst",
    "salary_year_avg": "75000.0",
    "company_name": "Patterned Learning AI",
    "skills": "excel"
  },
  {
    "job_id": 1170721,
    "job_title": "Junior Data BI Analyst",
    "salary_year_avg": "75000.0",
    "company_name": "Patterned Learning AI",
    "skills": "tableau"
  },
  {
    "job_id": 1707474,
    "job_title": "Junior Data Scientist Engineer-US",
    "salary_year_avg": "75000.0",
    "company_name": "Patterned Learning AI",
    "skills": "sql"
  },
  {
    "job_id": 1707474,
    "job_title": "Junior Data Scientist Engineer-US",
    "salary_year_avg": "75000.0",
    "company_name": "Patterned Learning AI",
    "skills": "python"
  },
  {
    "job_id": 1707474,
    "job_title": "Junior Data Scientist Engineer-US",
    "salary_year_avg": "75000.0",
    "company_name": "Patterned Learning AI",
    "skills": "r"
  },
  {
    "job_id": 1707474,
    "job_title": "Junior Data Scientist Engineer-US",
    "salary_year_avg": "75000.0",
    "company_name": "Patterned Learning AI",
    "skills": "sas"
  },
  {
    "job_id": 1707474,
    "job_title": "Junior Data Scientist Engineer-US",
    "salary_year_avg": "75000.0",
    "company_name": "Patterned Learning AI",
    "skills": "javascript"
  },
  {
    "job_id": 1707474,
    "job_title": "Junior Data Scientist Engineer-US",
    "salary_year_avg": "75000.0",
    "company_name": "Patterned Learning AI",
    "skills": "html"
  },
  {
    "job_id": 1707474,
    "job_title": "Junior Data Scientist Engineer-US",
    "salary_year_avg": "75000.0",
    "company_name": "Patterned Learning AI",
    "skills": "matlab"
  },
  {
    "job_id": 1707474,
    "job_title": "Junior Data Scientist Engineer-US",
    "salary_year_avg": "75000.0",
    "company_name": "Patterned Learning AI",
    "skills": "vba"
  },
  {
    "job_id": 1707474,
    "job_title": "Junior Data Scientist Engineer-US",
    "salary_year_avg": "75000.0",
    "company_name": "Patterned Learning AI",
    "skills": "oracle"
  },
  {
    "job_id": 1707474,
    "job_title": "Junior Data Scientist Engineer-US",
    "salary_year_avg": "75000.0",
    "company_name": "Patterned Learning AI",
    "skills": "sas"
  },
  {
    "job_id": 1321085,
    "job_title": "Junior Data Analyst - US/Canada",
    "salary_year_avg": "75000.0",
    "company_name": "Patterned Learning AI",
    "skills": "sql"
  },
  {
    "job_id": 1321085,
    "job_title": "Junior Data Analyst - US/Canada",
    "salary_year_avg": "75000.0",
    "company_name": "Patterned Learning AI",
    "skills": "excel"
  },
  {
    "job_id": 1321085,
    "job_title": "Junior Data Analyst - US/Canada",
    "salary_year_avg": "75000.0",
    "company_name": "Patterned Learning AI",
    "skills": "sheets"
  },
  {
    "job_id": 68288,
    "job_title": "Junior Data Engineer",
    "salary_year_avg": "75000.0",
    "company_name": "Patterned Learning AI",
    "skills": "sql"
  },
  {
    "job_id": 1806181,
    "job_title": "Junior Data Scientist - US/Canada",
    "salary_year_avg": "75000.0",
    "company_name": "Patterned Learning AI",
    "skills": "python"
  },
  {
    "job_id": 1806181,
    "job_title": "Junior Data Scientist - US/Canada",
    "salary_year_avg": "75000.0",
    "company_name": "Patterned Learning AI",
    "skills": "databricks"
  },
  {
    "job_id": 1806181,
    "job_title": "Junior Data Scientist - US/Canada",
    "salary_year_avg": "75000.0",
    "company_name": "Patterned Learning AI",
    "skills": "pandas"
  },
  {
    "job_id": 1806181,
    "job_title": "Junior Data Scientist - US/Canada",
    "salary_year_avg": "75000.0",
    "company_name": "Patterned Learning AI",
    "skills": "numpy"
  },
  {
    "job_id": 1806181,
    "job_title": "Junior Data Scientist - US/Canada",
    "salary_year_avg": "75000.0",
    "company_name": "Patterned Learning AI",
    "skills": "pyspark"
  },
  {
    "job_id": 1806181,
    "job_title": "Junior Data Scientist - US/Canada",
    "salary_year_avg": "75000.0",
    "company_name": "Patterned Learning AI",
    "skills": "matplotlib"
  },
  {
    "job_id": 856480,
    "job_title": "Junior Data Scientist Engineer",
    "salary_year_avg": "75000.0",
    "company_name": "Patterned Learning AI",
    "skills": "sql"
  },
  {
    "job_id": 856480,
    "job_title": "Junior Data Scientist Engineer",
    "salary_year_avg": "75000.0",
    "company_name": "Patterned Learning AI",
    "skills": "python"
  },
  {
    "job_id": 856480,
    "job_title": "Junior Data Scientist Engineer",
    "salary_year_avg": "75000.0",
    "company_name": "Patterned Learning AI",
    "skills": "r"
  },
  {
    "job_id": 856480,
    "job_title": "Junior Data Scientist Engineer",
    "salary_year_avg": "75000.0",
    "company_name": "Patterned Learning AI",
    "skills": "sas"
  },
  {
    "job_id": 856480,
    "job_title": "Junior Data Scientist Engineer",
    "salary_year_avg": "75000.0",
    "company_name": "Patterned Learning AI",
    "skills": "javascript"
  },
  {
    "job_id": 856480,
    "job_title": "Junior Data Scientist Engineer",
    "salary_year_avg": "75000.0",
    "company_name": "Patterned Learning AI",
    "skills": "html"
  },
  {
    "job_id": 856480,
    "job_title": "Junior Data Scientist Engineer",
    "salary_year_avg": "75000.0",
    "company_name": "Patterned Learning AI",
    "skills": "matlab"
  },
  {
    "job_id": 856480,
    "job_title": "Junior Data Scientist Engineer",
    "salary_year_avg": "75000.0",
    "company_name": "Patterned Learning AI",
    "skills": "vba"
  },
  {
    "job_id": 856480,
    "job_title": "Junior Data Scientist Engineer",
    "salary_year_avg": "75000.0",
    "company_name": "Patterned Learning AI",
    "skills": "oracle"
  },
  {
    "job_id": 856480,
    "job_title": "Junior Data Scientist Engineer",
    "salary_year_avg": "75000.0",
    "company_name": "Patterned Learning AI",
    "skills": "sas"
  },
  {
    "job_id": 432310,
    "job_title": "Junior Business/Data Analyst",
    "salary_year_avg": "72000.0",
    "company_name": "Get It Recruit - Transportation",
    "skills": "sql"
  },
  {
    "job_id": 432310,
    "job_title": "Junior Business/Data Analyst",
    "salary_year_avg": "72000.0",
    "company_name": "Get It Recruit - Transportation",
    "skills": "nosql"
  },
  {
    "job_id": 1264889,
    "job_title": "Junior Reporting Data Analyst",
    "salary_year_avg": "70000.0",
    "company_name": "Get It Recruit - Information Technology",
    "skills": "sql"
  },
  {
    "job_id": 1264889,
    "job_title": "Junior Reporting Data Analyst",
    "salary_year_avg": "70000.0",
    "company_name": "Get It Recruit - Information Technology",
    "skills": "python"
  },
  {
    "job_id": 1264889,
    "job_title": "Junior Reporting Data Analyst",
    "salary_year_avg": "70000.0",
    "company_name": "Get It Recruit - Information Technology",
    "skills": "vba"
  },
  {
    "job_id": 1264889,
    "job_title": "Junior Reporting Data Analyst",
    "salary_year_avg": "70000.0",
    "company_name": "Get It Recruit - Information Technology",
    "skills": "excel"
  },
  {
    "job_id": 1264889,
    "job_title": "Junior Reporting Data Analyst",
    "salary_year_avg": "70000.0",
    "company_name": "Get It Recruit - Information Technology",
    "skills": "tableau"
  },
  {
    "job_id": 1264889,
    "job_title": "Junior Reporting Data Analyst",
    "salary_year_avg": "70000.0",
    "company_name": "Get It Recruit - Information Technology",
    "skills": "sharepoint"
  },
  {
    "job_id": 153583,
    "job_title": "Junior Data Scientist",
    "salary_year_avg": "65000.0",
    "company_name": "EMG Acquisitions",
    "skills": "sql"
  },
  {
    "job_id": 153583,
    "job_title": "Junior Data Scientist",
    "salary_year_avg": "65000.0",
    "company_name": "EMG Acquisitions",
    "skills": "datarobot"
  },
  {
    "job_id": 1441940,
    "job_title": "Junior Data Analyst",
    "salary_year_avg": "65000.0",
    "company_name": "Get It Recruit - Information Technology",
    "skills": "sql"
  },
  {
    "job_id": 1441940,
    "job_title": "Junior Data Analyst",
    "salary_year_avg": "65000.0",
    "company_name": "Get It Recruit - Information Technology",
    "skills": "visual basic"
  },
  {
    "job_id": 1441940,
    "job_title": "Junior Data Analyst",
    "salary_year_avg": "65000.0",
    "company_name": "Get It Recruit - Information Technology",
    "skills": "vba"
  },
  {
    "job_id": 1441940,
    "job_title": "Junior Data Analyst",
    "salary_year_avg": "65000.0",
    "company_name": "Get It Recruit - Information Technology",
    "skills": "excel"
  },
  {
    "job_id": 1441940,
    "job_title": "Junior Data Analyst",
    "salary_year_avg": "65000.0",
    "company_name": "Get It Recruit - Information Technology",
    "skills": "tableau"
  },
  {
    "job_id": 1441940,
    "job_title": "Junior Data Analyst",
    "salary_year_avg": "65000.0",
    "company_name": "Get It Recruit - Information Technology",
    "skills": "power bi"
  },
  {
    "job_id": 1441940,
    "job_title": "Junior Data Analyst",
    "salary_year_avg": "65000.0",
    "company_name": "Get It Recruit - Information Technology",
    "skills": "word"
  },
  {
    "job_id": 1441940,
    "job_title": "Junior Data Analyst",
    "salary_year_avg": "65000.0",
    "company_name": "Get It Recruit - Information Technology",
    "skills": "powerpoint"
  },
  {
    "job_id": 1441940,
    "job_title": "Junior Data Analyst",
    "salary_year_avg": "65000.0",
    "company_name": "Get It Recruit - Information Technology",
    "skills": "ms access"
  },
  {
    "job_id": 931611,
    "job_title": "Junior Data Scientist",
    "salary_year_avg": "62500.0",
    "company_name": "DonorSearch",
    "skills": "sql"
  },
  {
    "job_id": 931611,
    "job_title": "Junior Data Scientist",
    "salary_year_avg": "62500.0",
    "company_name": "DonorSearch",
    "skills": "python"
  },
  {
    "job_id": 1111802,
    "job_title": "Junior Data Scientist",
    "salary_year_avg": "62000.0",
    "company_name": "DonorSearch",
    "skills": "sql"
  },
  {
    "job_id": 1111802,
    "job_title": "Junior Data Scientist",
    "salary_year_avg": "62000.0",
    "company_name": "DonorSearch",
    "skills": "python"
  },
  {
    "job_id": 616124,
    "job_title": "Junior Data Analyst",
    "salary_year_avg": "60000.0",
    "company_name": "Get It Recruit - Finance",
    "skills": "sql"
  },
  {
    "job_id": 616124,
    "job_title": "Junior Data Analyst",
    "salary_year_avg": "60000.0",
    "company_name": "Get It Recruit - Finance",
    "skills": "excel"
  },
  {
    "job_id": 616124,
    "job_title": "Junior Data Analyst",
    "salary_year_avg": "60000.0",
    "company_name": "Get It Recruit - Finance",
    "skills": "tableau"
  },
  {
    "job_id": 616124,
    "job_title": "Junior Data Analyst",
    "salary_year_avg": "60000.0",
    "company_name": "Get It Recruit - Finance",
    "skills": "power bi"
  },
  {
    "job_id": 1426370,
    "job_title": "Junior Data Engineer",
    "salary_year_avg": "60000.0",
    "company_name": "ThinkCX Technologies Inc",
    "skills": "sql"
  },
  {
    "job_id": 1426370,
    "job_title": "Junior Data Engineer",
    "salary_year_avg": "60000.0",
    "company_name": "ThinkCX Technologies Inc",
    "skills": "python"
  },
  {
    "job_id": 1426370,
    "job_title": "Junior Data Engineer",
    "salary_year_avg": "60000.0",
    "company_name": "ThinkCX Technologies Inc",
    "skills": "r"
  },
  {
    "job_id": 1426370,
    "job_title": "Junior Data Engineer",
    "salary_year_avg": "60000.0",
    "company_name": "ThinkCX Technologies Inc",
    "skills": "matlab"
  },
  {
    "job_id": 1426370,
    "job_title": "Junior Data Engineer",
    "salary_year_avg": "60000.0",
    "company_name": "ThinkCX Technologies Inc",
    "skills": "azure"
  },
  {
    "job_id": 1426370,
    "job_title": "Junior Data Engineer",
    "salary_year_avg": "60000.0",
    "company_name": "ThinkCX Technologies Inc",
    "skills": "aws"
  },
  {
    "job_id": 1426370,
    "job_title": "Junior Data Engineer",
    "salary_year_avg": "60000.0",
    "company_name": "ThinkCX Technologies Inc",
    "skills": "redshift"
  },
  {
    "job_id": 1426370,
    "job_title": "Junior Data Engineer",
    "salary_year_avg": "60000.0",
    "company_name": "ThinkCX Technologies Inc",
    "skills": "pandas"
  }
]
*/