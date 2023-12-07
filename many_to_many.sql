CREATE TABLE users (
  id SERIAL UNIQUE PRIMARY KEY,
  email text,
  name text,
  password text,
  rights text
);

CREATE TABLE servers (
  id SERIAL UNIQUE PRIMARY KEY,
  name text,
  privacy text
);

CREATE TABLE channels (
  id SERIAL UNIQUE PRIMARY KEY,
  name text, 
  privacy text
);

CREATE TABLE users_in_servers (
  user text references users(id),
  server text references servers(id)
);

CREATE TABLE channels_in_servers (
  servers text references servers(id),
  channels text references channels(id)
);

CREATE TABLE users_in_channels (
  user text references users(id),
  channel text references channels(id),
  rights text
);


INSERT INTO users (email, name, password, rights) VALUES ('irevoire@tamo.cool', 'tamo', 'secret', 'user');
INSERT INTO users (email, name, password, rights) VALUES ('luna@tamo.cool', 'luna', 'topsecret', 'admin');
INSERT INTO users (email, name, password, rights) VALUES ('topi@tamo.cool', 'sophie', 'supersecret', 'moderator');
INSERT INTO users (email, name, password, rights) VALUES ('gomez@tamo.cool', 'gomez', 'supertopsecret', 'user');
INSERT INTO users (email, name, password, rights) VALUES ('pampa@tamo.cool', 'pampa', 'secret4eva', 'admin');

INSERT INTO servers (name, privacy) VALUES ('cats are the best', 'public');
INSERT INTO servers (name, privacy) VALUES ('dogs are the best', 'public');
INSERT INTO servers (name, privacy) VALUES ('I love both honestly', 'private');

INSERT INTO channels (name, privacy) VALUES ('pictures', 'public');
INSERT INTO channels (name, privacy) VALUES ('videos', 'public');
INSERT INTO channels (name, privacy) VALUES ('gatherings', 'private');
INSERT INTO channels (name, privacy) VALUES ('contests', 'public');
INSERT INTO channels (name, privacy) VALUES ('games', 'private');
INSERT INTO channels (name, privacy) VALUES ('breeds', 'private');
INSERT INTO channels (name, privacy) VALUES ('adoption centers', 'public');

INSERT INTO users_in_servers (user, server) VALUES ((SELECT id FROM users WHERE name = 'luna'), (SELECT id FROM servers WHERE name = 'cats are the best'));
INSERT INTO users_in_servers (user, server) VALUES ((SELECT id FROM users WHERE name = 'gomez'), (SELECT id FROM servers WHERE name = 'cats are the best'));
INSERT INTO users_in_servers (user, server) VALUES ((SELECT id FROM users WHERE name = 'luna'), (SELECT id FROM servers WHERE name = 'dogs are the best'));
INSERT INTO users_in_servers (user, server) VALUES ((SELECT id FROM users WHERE name = 'pampa'), (SELECT id FROM servers WHERE name = 'dogs are the best'));
INSERT INTO users_in_servers (user, server) VALUES ((SELECT id FROM users WHERE name = 'luna'), (SELECT id FROM servers WHERE name = 'I love both honestly'));
INSERT INTO users_in_servers (user, server) VALUES ((SELECT id FROM users WHERE name = 'tamo'), (SELECT id FROM servers WHERE name = 'I love both honestly'));
INSERT INTO users_in_servers (user, server) VALUES ((SELECT id FROM users WHERE name = 'sophie'), (SELECT id FROM servers WHERE name = 'I love both honestly'));

INSERT INTO channels_in_servers (servers, channels) VALUES ((SELECT id FROM servers WHERE name = 'cats are the best'), (SELECT id FROM channels WHERE name = 'videos'));
INSERT INTO channels_in_servers (servers, channels) VALUES ((SELECT id FROM servers WHERE name = 'cats are the best'), (SELECT id FROM channels WHERE name = 'pictures'));
INSERT INTO channels_in_servers (servers, channels) VALUES ((SELECT id FROM servers WHERE name = 'cats are the best'), (SELECT id FROM channels WHERE name = 'breeds'));
INSERT INTO channels_in_servers (servers, channels) VALUES ((SELECT id FROM servers WHERE name = 'cats are the best'), (SELECT id FROM channels WHERE name = 'games'));
INSERT INTO channels_in_servers (servers, channels) VALUES ((SELECT id FROM servers WHERE name = 'dogs are the best'), (SELECT id FROM channels WHERE name = 'videos'));
INSERT INTO channels_in_servers (servers, channels) VALUES ((SELECT id FROM servers WHERE name = 'dogs are the best'), (SELECT id FROM channels WHERE name = 'pictures'));
INSERT INTO channels_in_servers (servers, channels) VALUES ((SELECT id FROM servers WHERE name = 'dogs are the best'), (SELECT id FROM channels WHERE name = 'adoption centers'));
INSERT INTO channels_in_servers (servers, channels) VALUES ((SELECT id FROM servers WHERE name = 'dogs are the best'), (SELECT id FROM channels WHERE name = 'gatherings'));
INSERT INTO channels_in_servers (servers, channels) VALUES ((SELECT id FROM servers WHERE name = 'I love both honestly'), (SELECT id FROM channels WHERE name = 'videos'));
INSERT INTO channels_in_servers (servers, channels) VALUES ((SELECT id FROM servers WHERE name = 'I love both honestly'), (SELECT id FROM channels WHERE name = 'games'));
INSERT INTO channels_in_servers (servers, channels) VALUES ((SELECT id FROM servers WHERE name = 'I love both honestly'), (SELECT id FROM channels WHERE name = 'contests'));

INSERT INTO users_in_channels (user, channel, rights) VALUES ((SELECT id FROM users WHERE name = 'luna'), (SELECT id FROM channels WHERE name = 'videos'), 'read');
INSERT INTO users_in_channels (user, channel, rights) VALUES ((SELECT id FROM users WHERE name = 'luna'), (SELECT id FROM channels WHERE name = 'pictures'), 'read');
INSERT INTO users_in_channels (user, channel, rights) VALUES ((SELECT id FROM users WHERE name = 'luna'), (SELECT id FROM channels WHERE name = 'games'), 'read');
INSERT INTO users_in_channels (user, channel, rights) VALUES ((SELECT id FROM users WHERE name = 'pampa'), (SELECT id FROM channels WHERE name = 'contests'), 'post');
INSERT INTO users_in_channels (user, channel, rights) VALUES ((SELECT id FROM users WHERE name = 'tamo'), (SELECT id FROM channels WHERE name = 'videos'), 'post');
INSERT INTO users_in_channels (user, channel, rights) VALUES ((SELECT id FROM users WHERE name = 'sophie'), (SELECT id FROM channels WHERE name = 'videos'), 'read');
INSERT INTO users_in_channels (user, channel, rights) VALUES ((SELECT id FROM users WHERE name = 'gomez'), (SELECT id FROM channels WHERE name = 'breeds'), 'post');
INSERT INTO users_in_channels (user, channel, rights) VALUES ((SELECT id FROM users WHERE name = 'gomez'), (SELECT id FROM channels WHERE name = 'gatherings'), 'read');
INSERT INTO users_in_channels (user, channel, rights) VALUES ((SELECT id FROM users WHERE name = 'pampa'), (SELECT id FROM channels WHERE name = 'games'), 'post');
INSERT INTO users_in_channels (user, channel, rights) VALUES ((SELECT id FROM users WHERE name = 'tamo'), (SELECT id FROM channels WHERE name = 'pictures'), 'read');
INSERT INTO users_in_channels (user, channel, rights) VALUES ((SELECT id FROM users WHERE name = 'sophie'), (SELECT id FROM channels WHERE name = 'games'), 'post');
INSERT INTO users_in_channels (user, channel, rights) VALUES ((SELECT id FROM users WHERE name = 'luna'), (SELECT id FROM channels WHERE name = 'breeds'), 'post');
INSERT INTO users_in_channels (user, channel, rights) VALUES ((SELECT id FROM users WHERE name = 'tamo'), (SELECT id FROM channels WHERE name = 'adoption centers'), 'moderate');
INSERT INTO users_in_channels (user, channel, rights) VALUES ((SELECT id FROM users WHERE name = 'sophie'), (SELECT id FROM channels WHERE name = 'adoption centers'), 'moderate');


-- SELECT * FROM channels

-- SELECT * FROM users

-- SELECT * FROM servers

-- SELECT * FROM users_in_servers

-- SELECT * FROM channels_in_servers

-- SELECT * FROM users_in_channels

-- Trouver tous les serveurs qui ont des channels prives
-- SELECT servers.name
--  FROM servers 
--    JOIN channels_in_servers ON servers.id = channels_in_servers.servers
--    JOIN channels ON channels.id = channels_in_servers.channels
--      WHERE channels.privacy = 'private'

-- trouver tous les utilisateurs qui ont des droits de post
-- SELECT users.name
--  FROM users
--    JOIN users_in_channels ON users_in_channels.user = users.id
--      WHERE users_in_channels.rights = 'post'

-- trouver tous les servers ou les gens ont des droits de mod
-- SELECT servers.name
--  FROM servers
--    JOIN channels_in_servers ON channels_in_servers.servers = servers.id
--    JOIN users_in_channels ON channels_in_servers.channels = users_in_channels.channel
--      WHERE users_in_channels.rights = 'moderate'