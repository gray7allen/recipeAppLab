CREATE TABLE users(
  user_id SERIAL PRIMARY KEY,
  username VARCHAR(30),
  email_address VARCHAR(50)
);

CREATE TABLE user_password(
  user_password_id SERIAL PRIMARY KEY,
  user_id INT NOT NULL REFERENCES users(user_id),
  password VARCHAR(100)
);

CREATE TABLE recipes(
  recipe_id SERIAL PRIMARY KEY,
  user_id INT NOT NULL REFERENCES users(user_id),
  recipe_instructions VARCHAR(1000),
  recipe_image TEXT,
  ingredients VARCHAR(1000)
);

CREATE TABLE ingredients(
  recipe_id INT NOT NULL REFERENCES recipes(recipe_id),
  ingredient_id SERIAL PRIMARY KEY,
  name_of_ingredient VARCHAR(30),
  quantity_of_ingredient INT
);

CREATE TABLE grocery_list(
  user_id INT NOT NULL REFERENCES users(user_id),
  recipe_id INT NOT NULL REFERENCES recipes(recipe_id),
  ingredient_id INT NOT NULL REFERENCES ingredients(ingredient_id),
  name_of_ingredient VARCHAR(30),
  quantity_of_ingredient INT
);

CREATE TABLE occasions(
  occasions_id SERIAL PRIMARY KEY,
  occasion_name_id INT NOT NULL REFERENCES occasion_name(occasion_name_id),
  user_id INT NOT NULL REFERENCES users(user_id)
);

CREATE TABLE occasion_name(
  occasion_name_id SERIAL PRIMARY KEY,
  occasion_name VARCHAR(50),
  recipe_id INT NOT NULL REFERENCES recipes(recipe_id)
);