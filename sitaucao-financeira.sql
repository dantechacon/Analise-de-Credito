--Descobrir a média de renda total dos indivíduos.
SELECT avg(total_income)
FROM credito_experimento;
--Resultado: R$181.228,00

--Qual a distribuição dos tipos de renda nesse conjunto de dados?
SELECT 
    income_type,
    COUNT(*) AS count
FROM 
    credito_experimento
GROUP BY 
    income_type;

/* Resultado: Working = 4960; Commercial associate = 2312; Pensioner = 1712; State servant = 722; Student = 3 */

/* Qual a proporção dos tipos de renda nesse conjunto de dados? 
Deve ser criada uma primeira subquery determinando a quantidade de indivíduos em cada tipo de renda (income_type); 
Em seguida, você deve verificar quantas pessoas constam no dataser para definirmos a base da propoção. 
Por fim, a proporção na query final levará em consideração as duas qtds calculadas. */

WITH income_counts AS (
    SELECT 
        income_type,
        COUNT(*) AS count
    FROM 
        credito_experimento
    GROUP BY 
        income_type
), total_count AS (
    SELECT 
        COUNT(*) AS total
    FROM 
        credito_experimento
)
SELECT 
    ic.income_type,
    ic.count,
    ic.count * 1.0 / tc.total AS proportion
FROM 
    income_counts ic,
    total_count tc;

/* Resultado:
Working tem 4960 registros e apresenta uma proporção de 51.08%; Commercial associate tem 2312 registros e apresenta uma proporção de 23.81%;
Pensioner apresenta um total de 1712 registros e uma proporção de 17.63%; State servant apresenta um total de 722 registros e uma proporção de 7.43%. 
Por fim, studens apresenta um total de 3 registros e uma proporção de 0.000308%. */
