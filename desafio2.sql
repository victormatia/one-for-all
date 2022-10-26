SELECT
  COUNT(DISTINCT t.track_id) AS cancoes,
  COUNT(DISTINCT a.artist_id) AS artistas,
  COUNT(DISTINCT al.album_id) AS albuns
FROM
  SpotifyClone.tracks AS t,
  SpotifyClone.artists AS a,
  SpotifyClone.albums AS al;
