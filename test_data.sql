insert into cities values ("Agadir ");
insert into cities values ("Albufeira");
insert into cities values ("Amadora");
insert into cities values ("Arezzo");
insert into cities values ("Aabenraa");
insert into cities values ("Aachen");
insert into cities values ("Aalborg");
insert into cities values ("Aalen");
insert into cities values ("Aalsmeer");
insert into cities values ("Aalst");

insert into show_category values ("Movies");
insert into show_category values ("Shows");
insert into show_category values ("Art Shows");
insert into show_category values ("Plays");


insert into shows (category_name, show_name, description, year_produced, show_length) values ("Movies", "The Godfather", "Drama/Crime", 1972, "2:58");
insert into shows (category_name, show_name, description, year_produced, show_length) values ("Movies", "Life Of Pi", "Drama/Fantasy", 2012, "2:07");
insert into shows (category_name, show_name, description, year_produced, show_length) values ("Movies", "Citizen Kane", "Drama/Mystery", 1941, "1:59");
insert into shows (category_name, show_name, description, year_produced, show_length) values ("Movies", "BA:BO", "Drama", 1950, "2:18");
insert into shows (category_name, show_name, description, year_produced, show_length) values ("Movies", "BaadAsssss Cinema", "Drama", 1950, "2:18");
insert into shows (category_name, show_name, description, year_produced, show_length) values ("Movies", "BAADASSSSS!", "Drama", 1950, "2:18");
insert into shows (category_name, show_name, description, year_produced, show_length) values ("Movies", "The Baader Meinhof Complex", "Drama", 1950, "2:18");
insert into shows (category_name, show_name, description, year_produced, show_length) values ("Movies", "Baadshah", "Drama", 1950, "2:18");
insert into shows (category_name, show_name, description, year_produced, show_length) values ("Movies", "Baazi", "Drama", 1950, "2:18");
insert into shows (category_name, show_name, description, year_produced, show_length) values ("Movies", "Baazigar", "Drama", 1950, "2:18");
insert into shows (category_name, show_name, description, year_produced, show_length) values ("Movies", "The Babe ", "Drama", 1950, "2:18");
insert into shows (category_name, show_name, description, year_produced, show_length) values ("Movies", "Babe", "Drama", 1950, "2:18");
insert into shows (category_name, show_name, description, year_produced, show_length) values ("Movies", "Cabaret", "Drama/Crime", 1972, "2:58");
insert into shows (category_name, show_name, description, year_produced, show_length) values ("Movies", "Cabaret Balkan", "Drama/Crime", 1972, "2:58");
insert into shows (category_name, show_name, description, year_produced, show_length) values ("Movies", "Cabaret Paradis", "Drama/Crime", 1972, "2:58");
insert into shows (category_name, show_name, description, year_produced, show_length) values ("Movies", "Cabin Boy", "Drama/Crime", 1972, "2:58");
insert into shows (category_name, show_name, description, year_produced, show_length) values ("Movies", "The Cabin in the Cotton", "Drama/Crime", 1972, "2:58");
insert into shows (category_name, show_name, description, year_produced, show_length) values ("Movies", "The Cabin Crew ", "Drama/Crime", 1972, "2:58");
insert into shows (category_name, show_name, description, year_produced, show_length) values ("Movies", "Cabin in the Sky", "Drama/Crime", 1972, "2:58");
insert into shows (category_name, show_name, description, year_produced, show_length) values ("Movies", "The Cabin in the Woods", "Drama/Crime", 1972, "2:58");


insert into users (user_id, password, user_name) values ("user1", "pass1", "Israel");
insert into users (user_id, password, user_name) values ("user2", "pass2", "Meir");
insert into users (user_id, password, user_name) values ("user3", "pass3", "Zvi");
insert into users (user_id, password, user_name) values ("user4", "pass4", "Ephraim");
insert into users (user_id, password, user_name, city_name) values ("user5", "pass5", "Ahron", "Aalst");
insert into users (user_id, password, user_name, city_name) values ("user6", "pass6", "Sarha", "Aalst");
insert into users (user_id, password, user_name, city_name) values ("user7", "pass7", "An", "Aachen");
insert into users (user_id, password, permission, user_name, city_name) values ("user8", "pass8", "admin", "Hieu", "Aachen");
insert into users (user_id, password, permission, user_name, city_name) values ("user9", "pass9", "admin", "Chau", "Aachen");

insert into theaters values (1, "theater1", "address1", "phone1", "website1", "Aachen");
insert into theaters values (2, "theater2", "address2", "phone2", "website2", "Aachen");
insert into theaters values (3, "theater3", "address3", "phone3", "website3", "Aalst");
insert into theaters values (4, "theater4", "address4", "phone4", "website4", "Aalst");

insert into events values (1, "2018-09-26", "20:20", 1, 1);
insert into events values (2, "2018-09-26", "09:20", 3, 1);
insert into events values (3, "2018-09-26", "08:20", 2, 1);
insert into events values (4, "2018-09-27", "21:20", 1, 2);
insert into events values (5, "2018-09-27", "22:20", 2, 2);
insert into events values (6, "2018-09-27", "23:20", 3, 2);

insert into seats (theater_code, row, seat) values (1, 1, 1);
insert into seats (theater_code, row, seat) values (1, 1, 2);
insert into seats (theater_code, row, seat) values (1, 1, 3);
insert into seats (theater_code, row, seat) values (1, 2, 1);
insert into seats (theater_code, row, seat) values (1, 2, 2);
insert into seats (theater_code, row, seat) values (1, 2, 3);
insert into seats (theater_code, row, seat) values (1, 3, 1);
insert into seats (theater_code, row, seat) values (1, 3, 2);
insert into seats (theater_code, row, seat) values (1, 3, 3);
insert into seats (theater_code, row, seat) values (1, 4, 1);
insert into seats (theater_code, row, seat) values (1, 4, 2);
insert into seats (theater_code, row, seat) values (1, 4, 3);

insert into tickets (event_code, user_id, seat_id, price) values (1, "user1", 1, 29.99);
insert into tickets (event_code, user_id, seat_id, price) values (1, "user1", 2, 29.99);
insert into tickets (event_code, user_id, seat_id, price) values (1, "user1", 3, 99.00);
insert into tickets (event_code, user_id, seat_id, price) values (1, "user2", 4, 99.00);
insert into tickets (event_code, user_id, seat_id, price) values (1, "user2", 5, 99.00);
insert into tickets (event_code, user_id, seat_id, price) values (1, "user2", 6, 99.00);

insert into tickets (event_code, user_id, assigned, seat_id, price) values (2, "user1", "yes", 1, 29.99);
insert into tickets (event_code, user_id, assigned, seat_id, price) values (2, null, "no", 2, 29.99);
insert into tickets (event_code, user_id, assigned, seat_id, price) values (2, "user1", "no", 3, 99.00);
insert into tickets (event_code, user_id, assigned, seat_id, price) values (2, null, "no", 4, 99.00);
insert into tickets (event_code, user_id, assigned, seat_id, price) values (2, null, "yes", 5, 99.00);
insert into tickets (event_code, user_id, assigned, seat_id, price) values (2, null, "yes", 6, 99.00);

insert into reviews (show_code, review, user_id) values (1, "review1", "user1");
insert into reviews (show_code, review, user_id) values (1, "review2", "user2");
insert into reviews (show_code, review, user_id) values (1, "review3", "user3");
insert into reviews (show_code, review, user_id) values (1, "review4", "user4");




