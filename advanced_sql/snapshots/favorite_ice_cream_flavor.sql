{% snapshot favorite_ice_cream_flavors %}
 
{{ config(
      target_schema='dbt_leonwichette',
      unique_key='github_username',
      strategy='timestamp',
      updated_at='updated_at',
 ) }}
 
select
    *
 
-- maybe we should be using a source here 😉
 from {{ source ('advanced_dbt_examples', 'favorite_ice_cream_flavors' )}}
 
{% endsnapshot %}