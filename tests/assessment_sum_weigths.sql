{{ 
  config(
    severity = 'warn', 
    error_if = '>50', 
    warn_if = '>10'
  ) 
}}

-- Sum of non exam assessments should be 100
select id_course, sum(weight) as sum_weight
from {{ref('assessments')}}
where assessment_type != 'Exam'
group by id_course
having sum_weight != 100

