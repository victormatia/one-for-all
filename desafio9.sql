SELECT
  COUNT(h.track_id) AS quantidade_musicas_no_historico
FROM
  `SpotifyClone`.playback_historic AS h
INNER JOIN
  `SpotifyClone`.users AS u
ON u.user_id = h.user_id
GROUP BY u.user_name
HAVING u.user_name = 'Barbara Liskov';