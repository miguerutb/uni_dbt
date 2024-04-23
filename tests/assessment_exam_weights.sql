-- Exams should have a weight of 100
select id_course, weight
from {{ ref('assessments')}}
where assessment_type = 'Exam' and weight != 100
