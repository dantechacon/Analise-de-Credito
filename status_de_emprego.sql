/* Quantos indivíduos estão desempregados? 0 para não, 1 para sim. Para maior clareza na análise, utilizar case when para definir "legendas" para cada resultado. */
SELECT 
    CASE 
        WHEN unemployed = 0 THEN 'Trabalhando' 
        WHEN unemployed = 1 THEN 'Desempregado'
    END AS desemprego,
    COUNT(*) AS count
FROM 
    credito_experimento
WHERE 
    unemployed IN (0, 1)
GROUP BY 
    unemployed;

/* Resultado: Desempregado: 1696; Trabalhando: 8013. */


/* Calcular a média de anos de emprego dos que estão empregados. */

SELECT avg(years_employed) AS media_anos_trabalhando
FROM credito_experimento
WHERE unemployed = 0;

/* Resultado: media_anos_trabalhando = 6.8637047 */
