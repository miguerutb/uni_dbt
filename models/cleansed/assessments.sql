SELECT 
  {{ dbt_utils.surrogate_key(['code_module', 'code_presentation']) }}
    AS id_course, 
  id_assessment, 
  assessment_type, 
  date, 
  weight 
FROM 
  {{source('UNI_BRONZE', 'assessments')}}