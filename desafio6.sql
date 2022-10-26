-- Active: 1666721960658@@127.0.0.1@3307@SpotifyClone
SELECT
  MIN(p.price) AS faturamento_minimo,
  MAX(p.price) AS faturamento_maximo,
  ROUND(AVG(p.price), 2) AS faturamento_medio,
  ROUND(SUM(p.price), 2) AS faturamento_total
FROM SpotifyClone.subscription_plans AS p
INNER JOIN `SpotifyClone`.plan_per_users AS pu
ON p.plan_id = pu.plan_id;