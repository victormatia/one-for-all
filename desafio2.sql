SELECT COUNT(DISTINCT t.track_id) AS cancoes,
COUNT(DISTINCT a.artist_id) AS artistas,
COUNT(DISTINCT al.album_id) AS albuns
FROM SpotifyClone.tracks AS t
INNER JOIN SpotifyClone.artists AS a
INNER JOIN SpotifyClone.albums AS al
ON al.album_id = t.album_id
AND a.artist_id = al.artist_id;