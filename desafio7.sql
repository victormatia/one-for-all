SELECT
  a.artist_name AS artista,
  al.album_name AS album,
  COUNT(af.user_id) AS seguidores
FROM 
  `SpotifyClone`.artists AS a
INNER JOIN
  `SpotifyClone`.albums AS al
INNER JOIN
  `SpotifyClone`.artists_followers AS af
ON al.artist_id = a.artist_id
AND af.artist_id = a.artist_id
GROUP BY
  al.album_name,
  a.artist_name
ORDER BY
  seguidores DESC,
  a.artist_name ASC,
  al.album_name;