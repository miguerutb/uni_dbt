SELECT 
  id_assessment,
  id_student,
  date_submitted,
  CASE
    WHEN is_banked = 0 THEN FALSE
    WHEN is_banked = 1 THEN TRUE
  END AS is_banked,
  score
FROM 
  {{ source('UNI_BRONZE', 'student_assessment')}}