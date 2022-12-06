{% macro cents_to_dollars(amount, decimal_places=2) -%}
    ROUND( amount / 100, {{ decimal_places }})

{%- endmacro %}