# Analise-de-Credito

Desafio de Análise de Dados com SQL: Determinando a Elegibilidade para Cartão de Crédito, utilizando dataset do Kaggle (Credit Card Eligibillity).

Neste desafio, foram realizadas diversas consultas por meio do SQL (no Athena - AWS) para determinar os fatores que influenciam a elegibilidade de um indivíduo para um cartão de crédito. Foram usadas as informações disponíveis para explorar diferentes aspectos dos dados e identificar padrões significativos.

### Tarefas do Desafio:

1. **Análise Demográfica:**
   - Calcular a média de idade dos indivíduos no conjunto de dados.
   - Determinar a proporção de indivíduos masculinos e femininos.

2. **Situação Financeira:**
   - Descubrir a média de renda total dos indivíduos.
   - Identificar a distribuição de tipos de renda (Income_type) no conjunto de dados.

3. **Status de Emprego:**
   - Quantos indivíduos estão desempregados?
   - Calcular a média de anos de emprego dos que estão empregados.

4. **Relacionamento e Família:**
   - Qual é a média de filhos por família?
   - Descubrir a proporção de indivíduos que possuem carro e propriedade.

5. **Elegibilidade para Cartão de Crédito:**
   - Quantos indivíduos são elegíveis para um cartão de crédito?
   - Analisar a correlação entre a elegibilidade para cartão de crédito e outras variáveis, como idade, renda total, e tipo de ocupação.

### Dataset:
[CC Analysis](https://www.kaggle.com/datasets/rohit265/credit-card-eligibility-data-determining-factors)

### Conclusões:
- Há uma baixa representatividade de mulheres dentre as pessoas com acesso ao cartáo de crédito.
- A renda média dos públicos feminino e masculino é bem similar, assim como a situação empregatícia.
- Há fortes indícios demográficos de que o público feminino, atualmente, pouco explorado, pode apresentar um alto índice de uso do crédito e produtos financeiros como seguro (para propriedades) e investimentos (devido à alta renda média), por exemplo.
