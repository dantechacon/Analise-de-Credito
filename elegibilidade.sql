/*Quantos indivíduos são elegíveis para um cartão de crédito? Target é a coluna a ser utilizada. (0 para não elegível, 1 para elegível).*/
SELECT 
target,
COUNT(*) AS eligible_count
FROM credito_experimento
WHERE target = 1 OR target = 0
GROUP BY target
/* Selecionei também a quantidade de pessoas não elegíveis para o cartão de crédito, de forma a analisar a discrepância de proporção entre elegíveis e não elegíveis.
Resultado: eligible_count 1 = 1283; eligible_count 0 = 8426 */

/* Qual a renda média das pessoas que são elegíveis para um cartão de crédito, e das que não são elegíveis? */
SELECT 
    AVG(total_income) AS media_renda,
    target
FROM 
    credito_experimento
WHERE 
    target = 1 OR target = 0
GROUP BY 
    target;
/* Resultado: As pessoas elegíveis possuem uma renda média de R$186.000, enquanto as pessoas não elegíveis possuem uma renda média de R$180.000. 
Os resultados sugerem que não há uma grande relevânca da renda média para a definição de elegibilidade de um cartão, visto que o intervalo entre uma média e outra é ínfimo. */
