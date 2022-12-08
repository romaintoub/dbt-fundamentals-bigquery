{% test unique( model, column_name ) %}
select *
from (

   select
       {{ column_name }}

   from {{ model }}
   where {{ column_name }} is not null and cast( {{ column_name }} as string) !='00000'
   group by {{ column_name }}
   having count(*) > 1

) validation_errors
{% endtest %}