SELECT 
  {{ dbt_utils.surrogate_key(['code_module', 'code_presentation']) }}
    AS id_course,
  id_student,
  id_site,
  date,
  sum_click
FROM 
  {{ source('UNI_BRONZE', 'student_vle')}}