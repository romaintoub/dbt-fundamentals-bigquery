{% set database = target.database %}
{% set schema = target.schema %}

select
    table_type,
    table_schema,
    table_name,
    creation_time,
    'DROP ' || IF( table_type = 'VIEW', table_type, 'TABLE') || ' `{{ database }}`.' || table_schema || '.' || table_name as drop_statement
from
    `{{ database }}`.{{ schema }}.INFORMATION_SCHEMA.TABLES
where
    table_schema = '{{schema}}'
order by creation_time desc
