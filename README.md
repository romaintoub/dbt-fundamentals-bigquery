# Welcome to my new dbt project with Big Query!

This project is completed alongside the dbt Learn courses available online.
The practices provided in the 2 new courses (Advanced Techniques & Advanced Deployment with dbt Cloud) are included in this code.

### Using the starter project

Try running the following commands:
- dbt deps
- dbt build

### Notes
After running `dbt build` you should see 2 warning in test:

    - 19 results for `dbt_expectations_expect_column_values_to_be_between_fct_orders_amount__5__order_id_is_not_null__True`
    - 17 results for `dbt_utils_expression_is_true_fct_orders_amount_5`
    - Test failures for the 17 results stored in the `<your-project>`.`<target-schema>_test_failures`.`dbt_utils_expression_is_true_fct_orders_amount_5` table.

### Resources:
- Learn more about dbt [in the docs](https://docs.getdbt.com/docs/introduction)
- Check out [Discourse](https://discourse.getdbt.com/) for commonly asked questions and answers
- Join the [chat](https://community.getdbt.com/) on Slack for live discussions and support
- Find [dbt events](https://events.getdbt.com) near you
- Check out [the blog](https://blog.getdbt.com/) for the latest news on dbt's development and best practices
