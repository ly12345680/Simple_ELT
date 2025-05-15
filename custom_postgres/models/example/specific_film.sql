{% set film = 'Jurassic Park' %}
SELECT *
FROM {{ ref('films')}}
where title = '{{film}}'

