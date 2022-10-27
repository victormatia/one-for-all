-- Active: 1666721960658@@127.0.0.1@3307@SpotifyClone
SELECT
  t.track_name AS nome,
  COUNT(h.user_id) AS reproducoes
FROM
  `SpotifyClone`.playback_historic AS h
INNER JOIN
  `SpotifyClone`.tracks AS t
INNER JOIN `SpotifyClone`.users AS u
ON t.track_id = h.track_id
AND h.user_id = u.user_id
WHERE u.plan_id = 1 OR u.plan_id = 3
GROUP BY t.track_name
ORDER BY t.track_name;