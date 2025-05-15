
  
    

  create  table "destination_db"."public"."specific_film__dbt_tmp"
  as (
    
SELECT *
FROM "destination_db"."public"."films"
where title = 'Jurassic Park'
  );
  