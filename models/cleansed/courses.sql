SELECT 
	{{ dbt_utils.surrogate_key(['code_module', 'code_presentation']) }}
		AS id_course,
	LEFT(code_presentation, 4) :: INTEGER AS year,
	CASE
		WHEN RIGHT(code_presentation, 1) = 'B' THEN 'FEBRUARY'
		WHEN RIGHT(code_presentation, 1) = 'J' THEN 'OCTOBER'
	END AS month,
	module_presentation_length as days
FROM 
	{{ source('UNI_BRONZE', 'courses')}}