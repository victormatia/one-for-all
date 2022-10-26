SELECT
  a.artist_name AS artista,
  al.album_name AS album
FROM
  SpotifyClone.albums AS al
INNER JOIN
  SpotifyClone.artists AS a
ON al.artist_id = a.artist_id
WHERE artist_name = 'Elis Regina'
ORDER BY al.album_name;