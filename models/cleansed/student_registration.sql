SELECT 
  {{ dbt_utils.surrogate_key(['code_module', 'code_presentation']) }}
    AS id_course,
  id_student,
  date_registration,
  date_unregistration
FROM 
  {{ source('UNI_BRONZE', 'student_registration')}}