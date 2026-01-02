-- Overall churn rate
SELECT
  AVG(CASE WHEN Churn = 'Yes' THEN 1.0 ELSE 0.0 END) AS churn_rate
FROM telco_churn;

-- Churn rate by contract type
SELECT
  Contract,
  AVG(CASE WHEN Churn = 'Yes' THEN 1.0 ELSE 0.0 END) AS churn_rate
FROM telco_churn
GROUP BY Contract
ORDER BY churn_rate DESC;

-- Churn rate by tenure group
SELECT
  CASE
    WHEN tenure <= 12 THEN '0–12'
    WHEN tenure <= 24 THEN '12–24'
    WHEN tenure <= 36 THEN '24–36'
    WHEN tenure <= 48 THEN '36–48'
    WHEN tenure <= 60 THEN '48–60'
    ELSE '60+'
  END AS TenureGroup,
  AVG(CASE WHEN Churn = 'Yes' THEN 1.0 ELSE 0.0 END) AS churn_rate
FROM telco_churn
GROUP BY TenureGroup
ORDER BY
  CASE TenureGroup
    WHEN '0–12' THEN 1
    WHEN '12–24' THEN 2
    WHEN '24–36' THEN 3
    WHEN '36–48' THEN 4
    WHEN '48–60' THEN 5
    ELSE 6
  END;

-- Churn rate by contract and tenure group
SELECT
  Contract,
  CASE
    WHEN tenure <= 12 THEN '0–12'
    WHEN tenure <= 24 THEN '12–24'
    WHEN tenure <= 36 THEN '24–36'
    WHEN tenure <= 48 THEN '36–48'
    WHEN tenure <= 60 THEN '48–60'
    ELSE '60+'
  END AS TenureGroup,
  AVG(CASE WHEN Churn = 'Yes' THEN 1.0 ELSE 0.0 END) AS churn_rate
FROM telco_churn
GROUP BY Contract, TenureGroup
ORDER BY Contract, TenureGroup;
