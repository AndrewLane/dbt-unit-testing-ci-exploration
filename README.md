# dbt-unit-testing-ci-exploration
Exploring how one might have CI checks that run your dbt unit tests against Snowflake

# Method
This repo uses the [EqualExperts dbt-unit-testing package](https://github.com/EqualExperts/dbt-unit-testing) to allow for "unit" tests.
These are not true unit tests as the compute is happening inside of Snowflake.  However, the desire is to allow ELT/ETL
developers to demonstrate correct functionality of their transformations via mocked data and expected outcomes.

A [Github Action](.github/workflows/unit_tests.yml) is used to a) clone the repository b) install dbt-snowflake via pip
c) install dbt dependencies (for dbt-unit-testing mentioned above) d) pull the connection info for Snowflake from a
secret stored in Github and write to a profiles.yml file e) execute the appropriate "dbt test" command.

The PROFILES_YML secret is shown below:
![PROFILES_YML secret](/assets/images/update_profiles_yml_secret.jpg)

# Demonstration of failing test

See here: https://github.com/AndrewLane/dbt-unit-testing-ci-exploration/pull/2

![Failing test](/assets/images/failing_test.jpg)