CREATE DATABASE db_space_invaders;

USE db_space_invaders;


CREATE TABLE t_gun(
   gun_fk INT AUTO_INCREMENT,
   name VARCHAR(24) NOT NULL,
   description VARCHAR(155),
   price DECIMAL(4,2),
   strength INT,
   cartridge_capacity INT,
   PRIMARY KEY(gun_fk),
   UNIQUE(name)
);

CREATE TABLE t_player(
   player_fk INT AUTO_INCREMENT,
   pseudo VARCHAR(50),
   total_points INT,
   PRIMARY KEY(player_fk)
);

CREATE TABLE t_order(
   order_fk INT AUTO_INCREMENT,
   order_date DATE,
   player_fk INT NOT NULL,
   PRIMARY KEY(order_fk),
   FOREIGN KEY(player_fk) REFERENCES t_player(player_fk)
);

CREATE TABLE t_contain(
   gun_fk INT,
   order_fk INT,
   quantity INT,
   PRIMARY KEY(gun_fk, order_fk),
   FOREIGN KEY(gun_fk) REFERENCES t_gun(gun_fk),
   FOREIGN KEY(order_fk) REFERENCES t_order(order_fk)
);

CREATE TABLE t_has(
   gun_fk INT,
   player_fk INT,
   remaining_capacity INT,
   PRIMARY KEY(gun_fk, player_fk),
   FOREIGN KEY(gun_fk) REFERENCES t_gun(gun_fk),
   FOREIGN KEY(player_fk) REFERENCES t_player(player_fk)
);
