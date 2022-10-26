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
GROUP BY t.track_name
ORDER BY t.track_name;

SELECT * FROM `SpotifyClone`.subscription_plans;