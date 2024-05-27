*/ Qual é a média de filhos por família? */
SELECT avg(num_children) AS media_filhos
FROM credito_experimento;
*/ Resultado: 0.4228035843032238 /*

*/ Descubrir a proporção de indivíduos que possuem carro e propriedade. */
  
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
)
SELECT 
    car_counts.car_count * 1.0 / total_count.total AS car_proportion,
    property_counts.property_count * 1.0 / total_count.total AS property_proportion
FROM 
    car_counts, 
    property_counts, 
    total_count;
  
*/ A mesmoa lógica das proporções anteriores foi utilizada aqui. Deve-se, inicialmente, 
  medir a quantidade de pessoas que possuem propriedades, assim como a quantidade de pessoas que possuem carro. 
Após isso, levanta-se a quantidade de pessoas no dataset. 
A proporção é calcula separadamente, primeiro definindo a propoção de pessoas com carro e, após isso, a proporção de pessoas com propriedade. 
Resultado: car_proportion = 0.36770007209805333 (36.77%); property_proportion = 0.671541868369554 (67.15%).
  */
