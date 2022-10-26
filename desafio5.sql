SELECT
  t.track_name AS cancao,
  COUNT(h.user_id) AS reproducoes
FROM
  SpotifyClone.playback_historic AS h
INNER JOIN
  `SpotifyClone`.tracks AS t
ON h.track_id = t.track_id
GROUP BY t.track_name
ORDER BY
  reproducoes DESC,
  t.track_name ASC
LIMIT 2;