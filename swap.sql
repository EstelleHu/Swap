DROP DATABASE if EXISTS swap;
CREATE DATABASE swap; USE swap;
CREATE TABLE utilisateur (
	id INT(4) PRIMARY KEY AUTO_INCREMENT,
	nom VARCHAR(30) NOT NULL,
	prenom VARCHAR(30) NOT NULL,
	dateNaissance DATE NOT NULL,
	mail VARCHAR(50) NOT NULL,
	mdp VARCHAR(30) NOT NULL,
	addresse VARCHAR(50) NOT NULL,
	codePostal VARCHAR(5) NOT NULL,
	ville VARCHAR(30) NOT NULL,
	telephone VARCHAR(10) NOT NULL,
	photo VARCHAR(300)
) ENGINE = INNODB;

CREATE TABLE message (
	id INT(4) PRIMARY KEY AUTO_INCREMENT,
	idDestinataire INT(4) NOT NULL,
	idReceveur INT(4) NOT NULL,
	texte VARCHAR(300),
	dateMsg DATETIME NOT NULL, FOREIGN KEY (idDestinataire) REFERENCES utilisateur(id), FOREIGN KEY (idReceveur) REFERENCES utilisateur(id)
) ENGINE = INNODB;
CREATE TABLE echange (
	id INT(4) PRIMARY KEY AUTO_INCREMENT,
	idDestinataire INT(4) NOT NULL,
	idReceveur INT(4) NOT NULL,
	idObjetDest INT(4) NOT NULL,
	idObjetRec INT(4) NOT NULL,
	dateEchange DATE NOT NULL,
	etat VARCHAR(30) NOT NULL, FOREIGN KEY (idDestinataire) REFERENCES utilisateur(id), FOREIGN KEY (idReceveur) REFERENCES utilisateur(id)
) ENGINE = INNODB;
CREATE TABLE objet (
	id INT(4) PRIMARY KEY AUTO_INCREMENT,
	idUtilisateur INT(4) NOT NULL,
	nom VARCHAR(30) NOT NULL,
	prix FLOAT(2) NOT NULL,
	photo VARCHAR(300) NOT NULL,
	categorie VARCHAR(30) NOT NULL,
	sousCategorie VARCHAR(30),
	description VARCHAR(300),
	etat VARCHAR(30) NOT NULL,
	disponibilité BOOLEAN NOT NULL,
	objetRecherche VARCHAR(30), FOREIGN KEY (idUtilisateur) REFERENCES utilisateur(id)
) ENGINE = INNODB;
CREATE TABLE favoris (
	id INT(4) PRIMARY KEY AUTO_INCREMENT,
	idUtilisateur INT(4) NOT NULL,
	idObjet INT(4) NOT NULL, FOREIGN KEY (idUtilisateur) REFERENCES utilisateur(id), FOREIGN KEY (idObjet) REFERENCES objet(id)
) ENGINE = INNODB;
CREATE TABLE evaluation (
	idUtilisateur INT(4) NOT NULL,
	idUtilisateurNoteur INT(4) NOT NULL,
	commentaire VARCHAR(300) NOT NULL,
	note INT NOT NULL,
	dateCommentaire DATE NOT NULL, FOREIGN KEY (idUtilisateur) REFERENCES utilisateur(id), FOREIGN KEY (idUtilisateurNoteur) REFERENCES utilisateur(id)
) ENGINE = INNODB;
INSERT INTO utilisateur (id,nom,prenom, dateNaissance,mail,mdp,addresse,codePostal,ville,telephone) VALUES (1,"Cousin","Clémence","1998-04-14","clemence.cousin@test.com","test","1 rue du Test",00000,"TestVille",0603500638);
INSERT INTO utilisateur (id,nom,prenom, dateNaissance,mail,mdp,addresse,codePostal,ville,telephone) VALUES (2,"Auboisdormant","Abel","1985-09-14","testonsswap@test.com","test","1 rue du Test",00000,"TestVille",0101010101);
INSERT INTO objet (idUtilisateur,nom,prix,photo,categorie,sousCategorie,description,etat,disponibilité) VALUES (1,"La promesse de l'aube",10, "docs/img/la-promesse-de-l-aube.jpg","Livres","Classique","RAS","Très bon état", 1);
INSERT INTO objet (idUtilisateur,nom,prix,photo,categorie,sousCategorie,description,etat,disponibilité) VALUES (2,"Mario Kart",30.50,"docs/img/Mario-Kart.jpg","Jeux","Jeux vidéos","RAS","Très bon état", 1);
INSERT INTO objet (idUtilisateur,nom,prix,photo,categorie,sousCategorie,description,etat,disponibilité) VALUES (1,"Os à macher",8.50,"docs/img/os.jpeg","Animaux","Jeux","RAS","Bon état", 1);
INSERT INTO objet (idUtilisateur,nom,prix,photo,categorie,sousCategorie,description,etat,disponibilité) VALUES (2,"Collier",0.50,"docs/img/collier-pour-chien-fireworks-camel-jaune.jpg","Animaux","Accessoires","RAS","A bien vécu", 1);
INSERT INTO objet (idUtilisateur,nom,prix,photo,categorie,sousCategorie,description,etat,disponibilité) VALUES (1,"Miroir de poche",13,"docs/img/miroir-de-poche-en-liege.jpg","Beaute","Accessoires","En liege","Bon état", 1);
INSERT INTO objet (idUtilisateur,nom,prix,photo,categorie,sousCategorie,description,etat,disponibilité) VALUES (2,"Rouge à lèvres",30,"docs/img/rouge-coco-chanel-396e7564a96c33d3c9b810f6b9bfb2dc.jpg","Beaute","Maquillage","Chanel, jamais utilisé","Comme neuf", 1);
INSERT INTO objet (idUtilisateur,nom,prix,photo,categorie,sousCategorie,description,etat,disponibilité) VALUES (1,"Lisseur",60,"docs/img/bfr_overlay.jpg","Beaute","Electromenager","J'ai déjà les cheveux lisses","Très bon état", 1);
INSERT INTO objet (idUtilisateur,nom,prix,photo,categorie,sousCategorie,description,etat,disponibilité) VALUES (2,"Ecran d'ordi",100,"docs/img/philips_243v7qdsb_s1706124332849A_093445481.jpg","Electromenager","Bureau","RAS","Bon état", 1);
INSERT INTO objet (idUtilisateur,nom,prix,photo,categorie,sousCategorie,description,etat,disponibilité) VALUES (1,"Batteur",10,"docs/img/batteur.jpg","Electromenager","Cuisine","RAS","Bon état", 1);
INSERT INTO objet (idUtilisateur,nom,prix,photo,categorie,sousCategorie,description,etat,disponibilité) VALUES (2,"Télévision rétro",30,"docs/img/Braun_HF_1.jpg","Electromenager","Salon","Vintage","Très bon état", 1);
INSERT INTO objet (idUtilisateur,nom,prix,photo,categorie,sousCategorie,description,etat,disponibilité) VALUES (1,"Taille haie",30,"docs/img/locaforce-taille-haie-double.jpg","Jardin","Outils","RAS","Très bon état", 1);
INSERT INTO objet (idUtilisateur,nom,prix,photo,categorie,sousCategorie,description,etat,disponibilité) VALUES (2,"Pot de fleurs",5,"docs/img/51FGqEljNQL._AC_SX425_.jpg","Jardin","Accessoires","RAS","Très bon état", 1);
INSERT INTO objet (idUtilisateur,nom,prix,photo,categorie,sousCategorie,description,etat,disponibilité) VALUES (1,"Cactus",5,"docs/img/6be9f9a1921f05129278981b3b6e.jpeg","Jardin","Plantes","RAS","Très bon état", 1);
INSERT INTO objet (idUtilisateur,nom,prix,photo,categorie,sousCategorie,description,etat,disponibilité) VALUES (2,"Les sims 4",30,"docs/img/the-sims-4-v2_large.webp","Jeux","Jeux PC","RAS","Très bon état", 1);
INSERT INTO objet (idUtilisateur,nom,prix,photo,categorie,sousCategorie,description,etat,disponibilité) VALUES (1,"Monopoly",15,"docs/img/81qy+MXuxDL._AC_SL1392_.jpg","Jeux","Jeux de societe","RAS","Très bon état", 1);
INSERT INTO objet (idUtilisateur,nom,prix,photo,categorie,sousCategorie,description,etat,disponibilité) VALUES (2,"Twilight",15,"docs/img/41YCFiM5ZAL._SX310_BO1,204,203,200_.jpg","Livres","Romance","RAS","Très bon état", 1);
INSERT INTO objet (idUtilisateur,nom,prix,photo,categorie,sousCategorie,description,etat,disponibilité) VALUES (1,"Tintin",10,"docs/img/81TveXgGnXL.jpg","Livres","BD","RAS","Très bon état", 1);
INSERT INTO objet (idUtilisateur,nom,prix,photo,categorie,sousCategorie,description,etat,disponibilité) VALUES (2,"Homme d'action",30,"docs/img/homme-daction-livre-julien-b-brice-pocheveux-autre.webp","Livres","Action","RAS","Très bon état", 1);
INSERT INTO objet (idUtilisateur,nom,prix,photo,categorie,sousCategorie,description,etat,disponibilité) VALUES (1,"Moliere",3,"docs/img/Le-medecin-malgre-lui.jpg","Livres","Theatre","RAS","Très bon état", 1);
INSERT INTO objet (idUtilisateur,nom,prix,photo,categorie,sousCategorie,description,etat,disponibilité) VALUES (2,"Montaigne",3,"docs/img/Les-Eais.jpg","Livres","Essais","RAS","Très bon état", 1);
INSERT INTO objet (idUtilisateur,nom,prix,photo,categorie,sousCategorie,description,etat,disponibilité) VALUES (1,"Ile au tresor",10,"docs/img/livre-enfant-recto-ile-au-trsor-scaled.jpg","Livres","Enfants","RAS","Très bon état", 1);
INSERT INTO objet (idUtilisateur,nom,prix,photo,categorie,sousCategorie,description,etat,disponibilité) VALUES (2,"Stephen King",20,"docs/img/livre-thriller-2018-outsider-stephen-king.jpg","Livres","Thriller","RAS","Très bon état", 1);
INSERT INTO objet (idUtilisateur,nom,prix,photo,categorie,sousCategorie,description,etat,disponibilité) VALUES (1,"TOEIC",40,"docs/img/Tests-complets-pour-le-ToeIC.jpg","Livres","Scolaire","RAS","Très bon état", 1);
INSERT INTO objet (idUtilisateur,nom,prix,photo,categorie,sousCategorie,description,etat,disponibilité) VALUES (2,"Couverture alpage",150,"docs/img/alpaga-12.jpg","Maison","Chambre","RAS","Très bon état", 1);
INSERT INTO objet (idUtilisateur,nom,prix,photo,categorie,sousCategorie,description,etat,disponibilité) VALUES (1,"Assiettes",15,"docs/img/71pA3DodayL._AC_SX450_.jpg","Maison","Cuisine","RAS","Très bon état", 1);
INSERT INTO objet (idUtilisateur,nom,prix,photo,categorie,sousCategorie,description,etat,disponibilité) VALUES (2,"Tapis sdb",5,"docs/img/TAPIS-DE-BAIN-PICUS-26543123-Z-1.jpg","Maison","Salle de bain","RAS","Très bon état", 1);
INSERT INTO objet (idUtilisateur,nom,prix,photo,categorie,sousCategorie,description,etat,disponibilité) VALUES (1,"Nike",30,"docs/img/-bleu.jpg","Vetements","Chaussures","RAS","Très bon état", 1);
INSERT INTO objet (idUtilisateur,nom,prix,photo,categorie,sousCategorie,description,etat,disponibilité) VALUES (1,"Robe rouge",20,"docs/img/h_robe-maille-affinites-BRIQUE-front-80.jpg","Vetements","Femme","RAS","Très bon état", 1);
INSERT INTO objet (idUtilisateur,nom,prix,photo,categorie,sousCategorie,description,etat,disponibilité) VALUES (2,"Corona",10,"docs/img/deguisement-bouteille-de-biere-corona-adulte.jpg","Vetements","Deguisement","RAS","Très bon état", 1);
INSERT INTO objet (idUtilisateur,nom,prix,photo,categorie,sousCategorie,description,etat,disponibilité) VALUES (1,"Sac cabas",10,"docs/img/ori-sac-cabas-classe-noir-4915.jpg","Vetements","Sac","RAS","Très bon état", 1);
INSERT INTO objet (idUtilisateur,nom,prix,photo,categorie,sousCategorie,description,etat,disponibilité) VALUES (2,"Coussin",5,"docs/img/housse-de-coussin-wax-fleur-bleu-40x40cm-330909_330909_DEB_WEB.JPG","Maison","Salon","RAS","Très bon état", 1);