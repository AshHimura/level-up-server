CREATE VIEW GAMES_BY_USER AS
SELECT
    g.id,
    g.title,
    g.maker,
    g.game_type_id,
    g.number_of_players,
    g.skill_level,
    u.id user_id,
    u.first_name || ' ' || u.last_name AS full_name
FROM
    levelupapi_game g
JOIN
    levelupapi_gamer gr ON g.gamer_id = gr.id
JOIN
    auth_user u ON gr.user_id = u.id
;

CREATE VIEW EVENTS_BY_USER AS
SELECT
    e.id,
    e.description,
    e.date,
    e.time,
    e.organizer_id,
    e.game_id,
    eg.gamer_id,
    g.title game_title,
    u.first_name || ' ' || u.last_name AS full_name
FROM
    levelupapi_event e
JOIN
    levelupapi_game g ON  g.id = e.game_id
JOIN
    levelupapi_eventgamer eg ON e.organizer_id = eg.gamer_id
JOIN
    auth_user u ON g.gamer_id = u.id
;

DROP VIEW EVENTS_BY_USER

INSERT INTO levelupapi_eventgamer
VALUES (1, 1, 1);