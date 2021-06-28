CREATE TABLE usuarios (
	idUsuario SERIAL PRIMARY KEY,
	nome VARCHAR NOT NULL
);

CREATE TABLE filmes (
	idFilme SERIAL PRIMARY KEY,
	nomeFilme VARCHAR NOT NULL,	
	imagemUrl VARCHAR,
	ano INT,
	orcamento DECIMAL(10,2),
	idUsuario INT NOT NULL REFERENCES usuarios (idUsuario) 
);
DROP TABLE filmes

CREATE TABLE personagens (
	idPersonagem SERIAL PRIMARY KEY,
	nomePersonagem VARCHAR NOT NULL,
	imagem VARCHAR
);

CREATE TABLE filmesPersonagens (
	idFIlme INT NOT NULL REFERENCES filmes(idFilme),
	idPersonagem INT NOT NULL REFERENCES personagens (idPersonagem),
	PRIMARY KEY (idFilme, idPersonagem)
);


