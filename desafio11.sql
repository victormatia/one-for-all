-- Active: 1666721960658@@127.0.0.1@3307
SELECT track_name AS nome_musica,
CASE
  WHEN track_name LIKE '%Bard%' THEN 'The QA’s Song'
  WHEN track_name LIKE '%Amar%' THEN 'O Medo de Code Review é o Medo de Ser Livre'
  WHEN track_name LIKE '%Pais%' THEN 'Como Nossos Pull Requests'
  WHEN track_name LIKE '%SOUL%' THEN 'BREAK MY CODE'
  WHEN track_name LIKE '%SUPERSTAR%' THEN 'ALIEN SUPERDEV'
END AS novo_nome
FROM SpotifyClone.tracks
WHERE track_name LIKE '%Bard%'
OR track_name LIKE '%Amar%'
OR track_name LIKE '%Pais%'
OR track_name LIKE '%SOUL%'
OR track_name LIKE '%SUPERSTAR%'
ORDER BY track_name DESC;
