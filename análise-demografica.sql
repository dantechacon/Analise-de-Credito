/* Calcular a média de idade dos indivíduos no conjunto de dados. */

SELECT avg(age)
FROM credito_experimento;
--Resultado: 43.784092

/* Determinar a proporção de indivíduos masculinos e femininos. 0 para masculino, 1 para feminino. 
  Primeiro, devemos contabilizar quantas pessoas são do gênero feminino, e quantas pessoas são do gênero masculino. */

SELECT 
    gender,
    COUNT(*) AS count
FROM 
    credito_experimento
WHERE 
    gender IN (0, 1)
GROUP BY 
    gender;
--Resultado: Gender 1 = 3386; Gender 0 = 6323

/* Agora, calculamos as proporções em relação ao total de pessoas do dataset. 
  Para isso, vamos criar duas subqueries, uma (gender_counts) que contabiliza indivíduos por gênero, como foi feito na query acima.
  Outra subquery que levanta o total de indivíduos do dataset. E, por fim, uma query final que determina a proporção (proportion) */

WITH gender_counts AS (
    SELECT 
        gender,
        COUNT(*) AS count
    FROM 
        credito_experimento
    WHERE 
        gender IN (0, 1)
    GROUP BY 
        gender
), total_count AS (
    SELECT 
        COUNT(*) AS total
    FROM 
        credito_experimento
    WHERE 
        gender IN (0, 1)
)
SELECT 
    gc.gender,
    gc.count,
    gc.count * 1.0 / tc.total AS proportion
FROM 
    gender_counts gc,
    total_count tc;

/* Resultado: Gender 1 possui 3386 registros, numa proporção de 34.87% do dataset. Gender 0 possui 6323 registros, numa proporção de 65.12% do dataset./*
