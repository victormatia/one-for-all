-- Active: 1666721960658@@127.0.0.1@3307@SpotifyClone
SELECT
  u.user_name AS usuario,
  COUNT(h.track_id) AS qt_de_musicas_ouvidas,
  SUM(ROUND(t.length / 60, 2)) AS total_minutos
FROM
  SpotifyClone.users AS u
INNER JOIN
  SpotifyClone.playback_historic AS h
INNER JOIN
  SpotifyClone.tracks AS t
ON
  u.user_id = h.user_id
  AND
    h.track_id = t.track_id
GROUP BY u.user_name
ORDER BY u.user_name;