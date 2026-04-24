# 📊 Sales Analysis — Sport Store

## 🚀 Sumário Executivo
Este projeto destaca três pontos-chave:

- Forte **concentração de receita na categoria Equipment**, impulsionada por produtos premium como a EcoRide E-Bike e a RoadRacer 700  
- **Crescimento consistente** tanto na receita como na base de clientes entre 2022 e 2024  
- Uma **base de clientes estável e diversificada**, com uma distribuição equilibrada entre géneros  

👉 Estes resultados indicam um negócio em expansão, mas também revelam uma **dependência de um pequeno grupo de produtos de alto valor**.



## 📌 Project Overview
Este projeto analisa o desempenho de vendas, produtos e clientes de uma loja de artigos desportivos ao longo de 2022, 2023 e 2024.

O objetivo foi desenvolver uma análise end-to-end, desde a **transformação de dados em SQL** até à **criação de um dashboard interativo em Power BI**, focado em insights de negócio.



## 🎯 Business Objectives
- Analisar tendências de receita e lucro ao longo do tempo  
- Identificar produtos e categorias com melhor desempenho  
- Compreender segmentos de clientes e comportamento de compra  
- Monitorizar métricas-chave:
  - Receita  
  - Lucro  
  - Encomendas  
  - Unidades vendidas  
  - Taxa de devolução  



## 🛠️ Tools & Technologies
- **SQL Server** → limpeza, transformação e modelação de dados  
- **Power BI** → visualização, dashboard interativo e storytelling  



## 🧠 Data Preparation (SQL)
Foi criado um esquema dedicado **Analytics** sobre os dados brutos (**Store**) para separar dados operacionais de dados analíticos.

### Principais transformações:
- Limpeza e padronização de dados de cliente (nome, género, estado civil, etc.)  
- Expansão de valores codificados (ex: *M → Married*, *Y → Yes*)  
- Cálculo de métricas como **Product Profit (Preço − Custo)**  
- Unificação das vendas (2022–2024) numa única view:  
  `Vw_Fact_Sales` com coluna `Sales_Year`  
- Enriquecimento temporal:
  - Ano  
  - Trimestre  
  - Mês  
  - Nome do mês  

👉 Resultado: dataset estruturado e otimizado para análise de negócio.



## 📊 Dashboard

### Overview
- KPIs principais: Receita, Lucro, Encomendas, Taxa de devolução  
- Tendência de receita ao longo do tempo  
- Encomendas por categoria  
- Top produtos com taxa de devolução  
- KPIs mensais com comparação ao mês anterior  

### Product Analysis
- Top produtos por receita, lucro e unidades vendidas  
- Distribuição de receita por categoria  
- Tendência de performance ao longo do tempo  
- Destaque do produto com maior receita  

### Customer Analysis
- Clientes únicos e receita por cliente  
- Crescimento de clientes ao longo do tempo  
- Top 100 clientes por receita  
- Análise por segmento de rendimento  
- Métodos de pagamento  
- Distribuição por género  



## 📸 Dashboard Preview

### Overview
<!-- adicionar imagem aqui -->
![Overview](Images/overview.png)

### Product Analysis
<!-- adicionar imagem aqui -->
![Product Analysis](Images/product.png)

### Customer Analysis
<!-- adicionar imagem aqui -->
![Customer Analysis](Images/customer.png)



## 💡 Key Insights

📈 A receita cresceu de forma consistente entre 2022 e 2024, atingindo **€4,6M**, indicando uma trajetória de expansão sólida  

🚴 A categoria **Equipment domina a receita**, evidenciando forte dependência de produtos premium e potencial risco de concentração  

🎯 Um pequeno grupo de produtos gera a maioria das vendas, reforçando a necessidade de diversificação do portefólio  

👥 O segmento **Average (Médio)** lidera em volume e receita, funcionando como principal motor de crescimento  
➡️ O segmento **High (Alto)** contribui significativamente para valor por cliente  

💳 O **Cartão de Crédito** é o método de pagamento dominante, seguido pelo PayPal  

🔁 A taxa de devolução é baixa (**2,72%**), embora produtos como **Leggings** apresentem maior incidência  



## ⚠️ Limitations
- Dataset simulado (dados sintéticos)  
- Não inclui fatores externos (marketing, promoções, sazonalidade)  
- Dados de devolução sem detalhe de motivo  



## 🚀 Next Steps
- Implementar segmentação de clientes (RFM Analysis)  
- Analisar rentabilidade e margem por produto  
- Explorar performance geográfica (país/região)  
- Desenvolver modelos de previsão para receita futura  



## 📂 Project Structure

Dataset/  
SQL_Analysis/  
Power_BI/  
├── SportStore_Sales_Analysis.pbix  
└── Images/  
README.md



## 👤 Author
Projeto desenvolvido por João com foco em análise de dados end-to-end e tomada de decisão baseada em dados.
