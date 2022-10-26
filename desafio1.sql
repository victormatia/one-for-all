-- Active: 1666721960658@@127.0.0.1@3307
DROP DATABASE IF EXISTS SpotifyClone;

  CREATE DATABASE IF NOT EXISTS SpotifyClone;

  CREATE TABLE SpotifyClone.subscription_plans(
      plan_id INT AUTO_INCREMENT,
      plan_name VARCHAR(50) NOT NULL,
      price DOUBLE DEFAULT 00.00,
      CONSTRAINT PRIMARY KEY (plan_id)
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.users(
      user_id INT AUTO_INCREMENT,
      user_name VARCHAR(50) NOT NULL,
      birth_date DATE NOT NULL,
      plan_id INT NOT NULL,
      CONSTRAINT PRIMARY KEY (user_id),
      FOREIGN KEY (plan_id) REFERENCES subscription_plans (plan_id)
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.artists(
      artist_id INT AUTO_INCREMENT,
      artist_name VARCHAR(50) NOT NULL,
      CONSTRAINT PRIMARY KEY (artist_id)
  ) engine = InnoDB;


  CREATE TABLE SpotifyClone.albums(
    album_id INT AUTO_INCREMENT,
    album_name VARCHAR(50) NOT NULL,
    release_year DATE NOT NULL,
    artist_id INT NOT NULL,
    CONSTRAINT PRIMARY KEY (album_id),
    FOREIGN KEY (artist_id) REFERENCES artists (artist_id)
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.tracks(
    track_id INT AUTO_INCREMENT,
    track_name VARCHAR(70) NOT NULL,
    length INT NOT NULL,
    album_id INT NOT NULL,
    CONSTRAINT PRIMARY KEY (track_id),
    FOREIGN KEY (album_id) REFERENCES albums (album_id)
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.playback_historic(
    track_id INT NOT NULL,
    user_id INT NOT NULL,
    playback_date DATETIME NOT NULL,
    CONSTRAINT PRIMARY KEY (track_id, user_id),
    FOREIGN KEY (track_id) REFERENCES tracks (track_id),
    FOREIGN KEY (user_id) REFERENCES users (user_id)
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.plan_per_users(
    plan_id INT NOT NULL,
    user_id INT NOT NULL,
    subscribe_date DATE NOT NULL,
    CONSTRAINT PRIMARY KEY (plan_id, user_id),
    FOREIGN KEY (plan_id) REFERENCES subscription_plans (plan_id),
    FOREIGN KEY (user_id) REFERENCES users (user_id)
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.artists_followers(
    artist_id INT NOT NULL,
    user_id INT NOT NULL,
    CONSTRAINT PRIMARY KEY (artist_id, user_id),
    FOREIGN KEY (artist_id) REFERENCES artists (artist_id),
    FOREIGN KEY (user_id) REFERENCES users (user_id)
  ) engine = InnoDB;

  INSERT INTO SpotifyClone.subscription_plans (plan_name, price)
  VALUES
    ('gratuito', 00.00),
    ('universitário', 05.99),
    ('pessoal', 06.99),
    ('familiar', 7.99);

  INSERT INTO SpotifyClone.users (user_name, birth_date, plan_id)
  VALUES
    ('Barbara Liskov', '1940-01-01', 1),
    ('Robert Cecil Martin', '1964-01-01', 1),
    ('Martin Fowler', '1985-01-01', 4),
    ('Ada Lovelace', '1976-01-01', 4),
    ('Sandi Metz', '1964-01-01', 4),
    ('Paulo Freire', '2003-01-01', 2),
    ('Bell Hooks', '1996-01-01', 2),
    ('Christopher Alexander', '1937-01-01', 3),
    ('Judith Butler', '1977-01-01', 3),
    ('Jorge Amado', '1964-01-01', 3);

  INSERT INTO SpotifyClone.artists (artist_name)
  VALUES
    ('Beyoncé'),
    ('Queen'),
    ('Elis Regina'),
    ('Baco Exu do Blues'),
    ('Blind Guardian'),
    ('Nina Simone');

  INSERT INTO SpotifyClone.albums (album_name, release_year, artist_id)
  VALUES
    ('Renaissance', '2022-01-01', 1),
    ('Jazz', '1978-01-01', 2),
    ('Hot Space', '1982-01-01', 2),
    ('Falso Brilhante', '1998-01-01', 3),
    ('Vento de Maio', '2001-01-01', 3),
    ('QVVJFA?', '2003-01-01', 4),
    ('Somewhere Far Beyond', '2007-01-01', 5),
    ('I Put A Spell On You', '2012-01-01', 6);

  INSERT INTO SpotifyClone.tracks (track_name, length, album_id)
  VALUES
    ('BREAK MY SOUL', 279, 1),
    ('VIRGOS GROOVE', 369, 1),
    ('ALIEN SUPERSTAR', 116, 1),
    ('Dont Stop Me Now', 203, 2),
    ('Under Pressure', 152, 3),
    ('Como Nossos Pais', 105, 4),
    ('O Medo de Amar é o Medo de Ser Livre', 207, 5),
    ('Samba em Paris', 267, 6),
    ('The Bards Song', 244, 7),
    ('Feeling Good', 100, 8);

  INSERT INTO SpotifyClone.playback_historic (track_id, user_id, playback_date)
  VALUES
    (8, 1, '2022-02-28 10:45:55'),
    (2, 1, '2020-05-02 05:30:35'),
    (10, 1, '2020-03-06 11:22:33'),
    (10, 2, '2022-08-05 08:05:17'),
    (7, 2, '2020-01-02 07:40:33'),
    (10, 3, '2020-11-13 16:55:13'),
    (2, 3, '2020-12-05 18:38:30'),
    (8, 4, '2021-08-15 17:10:10'),
    (8, 5, '2022-01-09 01:44:33'),
    (5, 5, '2020-08-06 15:23:43'),
    (7, 6, '2017-01-24 00:31:17'),
    (1, 6, '2017-10-12 12:35:20'),
    (4, 7, '2011-12-15 22:30:49'),
    (4, 8, '2012-03-17 14:56:41'),
    (9, 9, '2022-02-24 21:14:22'),
    (3, 10, '2015-12-13 08:30:22');

INSERT INTO SpotifyClone.plan_per_users (plan_id, user_id, subscribe_date)
VALUES
  (1, 1, '2019-10-20'),
  (1, 2, '2017-01-06'),
  (4, 3, '2017-12-30'),
  (4, 4, '2017-01-17'),
  (4, 5, '2018-04-29'),
  (2, 6, '2018-02-14'),
  (2, 7, '2018-01-05'),
  (3, 8, '2019-06-05'),
  (3, 9, '2020-05-13'),
  (3, 10, '2017-02-17');

INSERT INTO SpotifyClone.artists_followers (artist_id, user_id)
VALUES
  (1, 1),
  (2, 1),
  (3, 1),
  (1, 2),
  (3, 2),
  (2, 3),
  (4, 4),
  (5, 5),
  (6, 5),
  (6, 6),
  (1, 6),
  (6, 7),
  (3, 9),
  (2, 10);