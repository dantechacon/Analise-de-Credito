/* O gênero é um critério de avaliação para eligibilidade de cartão de crédito? */
SELECT 
CASE 
    when gender = 0 then 'masculino' 
    when gender = 1 then 'feminino'
    end as genero,
    target,
    COUNT(*) AS quantidade
FROM 
    credito_experimento
WHERE 
    target = 1 AND (gender = 1 OR gender = 0)
GROUP BY 
    gender, target;
/* Resultados: 471 pessoas elegíveis para o cartão de crédito são do gênero feminino, enquanto 812 pessoas são do gênero masculino. 
Pode não ser um critério, mas podemos direcionar as análises entendendo que os hábitos de consumo/vida do público feminino estão influenciando negativamente na elegibilidade do cartão de crédito. */

/* Qual o cenário de empregabilidade do público feminino? Quantas mulheres estão desempregadas atualmente? */

SELECT 
CASE 
    when gender = 0 then 'masculino' 
    when gender = 1 then 'feminino'
    end as genero,
    unemployed,
    COUNT(*) AS quantidade
FROM 
    credito_experimento
WHERE 
    target = 1 AND gender = 1
GROUP BY 
    gender, unemployed;
/* Somente 7,21% das mulheres está desempregada no momento, contudo, se olhamos para as fontes de renda dessas pessoas, 
percebemos que menos de 1% não possui fonte de renda expressiva, sendo classificada como estudante: */
SELECT 
CASE 
    when gender = 0 then 'masculino' 
    when gender = 1 then 'feminino'
    end as genero,
    income_type,
    COUNT(*) AS quantidade
FROM 
    credito_experimento
WHERE 
    target = 1 AND gender = 1
GROUP BY 
    gender, income_type;
/* Resultado: 1 mulher é estudante. */

/* Será que a baixa elegibilidade de cartão entre as mulheres se relaciona a uma baixa quantidade de propriedades (por propriedade, levamos em consideração as colunas own_property e own_car para essa análise) */
WITH car_counts AS (
    SELECT 
        COUNT(*) AS car_count
    FROM 
        credito_experimento
    WHERE 
        own_car = 1
), property_counts AS (
    SELECT 
        COUNT(*) AS property_count
    FROM 
        credito_experimento
    WHERE 
        own_property = 1
), total_count AS (
    SELECT 
        COUNT(*) AS total
    FROM 
        credito_experimento
),
gender_counts AS (
    SELECT 
        gender,
        COUNT(*) AS count
    FROM 
        credito_experimento
    GROUP BY 
        gender
)
SELECT 
    car_counts.car_count * 1.0 / total_count.total AS car_proportion,
    property_counts.property_count * 1.0 / total_count.total AS property_proportion,
    CASE 
        WHEN gender = 0 THEN 'masculino' 
        WHEN gender = 1 THEN 'feminino'
    END AS genero
FROM 
    car_counts, 
    property_counts, 
    total_count,
    gender_counts
WHERE 
    gender_counts.gender = 1;
/* Resultado: 36.77% das pessoas com carro são mulheres, e 67.15% das pessoas com propriedade são mulheres. Em linhas gerais, a detenção de propriedade não se mostra um item relevante, mas sim, a de pessoas com carro.*/
/* A quantidade de tempo empregada é um determinante positivo para elegibilidade do cartão? */
SELECT 
    CASE 
        WHEN gender = 0 THEN 'masculino' 
        WHEN gender = 1 THEN 'feminino'
    END AS genero,
    AVG(years_employed) AS media_anos_trabalhados,
    COUNT(*) AS quantidade
FROM 
    credito_experimento
WHERE 
    target = 1 AND gender = 1 AND unemployed = 0
GROUP BY 
    gender;
/* Resultado: A média de tempo empregada dentre as 434 mulheres que trabalham atualmente é 5.74 anos, cerca de 16% menor do que o tempo médio do público geral. 
Ainda assim, há uma clara estabilidade entre o público feminino, acompanhada de uma renda média alta, o que nos possibilita pensar que essas pessoas são um público ainda pouco explorado na oferta de crédito. */
/* Por fim, vale investigar a quantidade de pessoas do gênero feminino que possuem ao menos 1 criança, e a representatividade disso em relação ao público masculino.
Essa análise, nos possibilitará entender o potencial de uso do crédito que pode ser explorada de forma benéfica com a utilização de diversos produtos financeiros atrelados ao cartão de crédito, tais como empréstimo, seguros, conta para menores, etc */

SELECT 
    SUM(CASE WHEN gender = 1 AND num_children >= 1 THEN 1 ELSE 0 END) * 1.0 / SUM(CASE WHEN gender = 1 THEN 1 ELSE 0 END) AS representatividade
FROM 
    credito_experimento;
/* Resultado: 33.60% das mulheres possui um ou mais filhos, o que nos leva a entender que é um público com baixo número de dependentes, apesar de ter uma renda média bem alta, possibilitando, assim, um baita potencial de gastos a ser explorado com abertura de crédito. */
