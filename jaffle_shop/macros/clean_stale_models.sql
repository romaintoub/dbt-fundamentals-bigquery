{#  
    The goals of this macro are the following:
    1. queries the information schema of a database
    2. finds objects that are > 1 week old (no longer maintained)
    3. generates automated drop statements
    4. has the ability to execute those drop statements

    $  dbt run-operation clean_stale_models --args '{dry_run: False}'
#}

{% macro clean_stale_models(database = target.database, schema = target.schema, days = 7, dry_run = True) %}

    {% set get_drop_commands_query %}
        select
            'DROP ' || IF( table_type = 'VIEW', table_type, 'TABLE') || ' `{{ database }}`.' || table_schema || '.' || table_name as drop_statement
        from
            `{{ database }}`.{{ schema }}.INFORMATION_SCHEMA.TABLES
        where
            table_schema = '{{schema}}'
            and cast( creation_time as date) < date_add( CURRENT_DATE(), interval - {{ days }} DAY)
      
    {% endset %}

    {{ log('\nGenerating cleanup queries...\n', info=True) }}
    {% set drop_queries = run_query(get_drop_commands_query).columns[0].values() %}

    {% for query in drop_queries %}
        {% if dry_run %}
            {{ log(query, info=True) }}
        {% else %}
            {{ log('Dropping object with command: ' ~ query, info=True)}}
            {% do run_query(query) %}
        {% endif %}
        
    {% endfor %}
  
{% endmacro %}
