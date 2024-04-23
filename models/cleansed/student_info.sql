SELECT 
  {{ dbt_utils.surrogate_key(['code_module', 'code_presentation']) }}
    AS id_course,
  id_student,
  gender,
  region,
  CASE
    WHEN highest_education = 'No Formal quals' THEN 0
    WHEN highest_education = 'Lower Than A Level' THEN 1
    WHEN highest_education = 'A Level or Equivalent' THEN 2
    WHEN highest_education = 'HE Qualification' THEN 3
    WHEN highest_education = 'Post Graduate Qualification' THEN 4
  END AS highest_education,
  CAST(LEFT(imd_band, 1) AS integer) 
    AS imd, -- transform 90-100% as 9
  CASE
    WHEN age_band = '55<=' THEN 'SENIOR'
    WHEN age_band = '35-55' THEN 'ADULT'
    WHEN age_band = '0-35' THEN 'YOUNG'
  END AS age, -- transform age band as category
  num_of_prev_attempts,
  studied_credits,
  CASE
    WHEN disability = 'N' THEN FALSE
    WHEN disability = 'Y' THEN TRUE
  END AS disability,
  final_result
FROM 
  {{source('UNI_BRONZE', 'student_info')}}