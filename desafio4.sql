SELECT
  u.user_name AS usuario,
CASE
  WHEN MAX(YEAR(h.playback_date)) >= 2021 THEN 'Usuário ativo'
  ELSE 'Usuário inativo'
  END AS status_usuario
FROM 
  SpotifyClone.playback_historic AS h
INNER JOIN 
  SpotifyClone.users AS u
ON u.user_id = h.user_id
GROUP BY h.user_id
ORDER BY u.user_name;