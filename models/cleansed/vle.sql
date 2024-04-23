SELECT 
  {{ dbt_utils.surrogate_key(['code_module', 'code_presentation']) }}
    AS id_course,
  id_site,
  activity_type,
  week_from,
  week_to
FROM 
  {{source('UNI_BRONZE', 'vle')}}