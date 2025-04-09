DROP TABLE IF EXISTS famille ;
CREATE TABLE famille (id_famille_famille INT(20) AUTO_INCREMENT NOT NULL, 
nom_famille VARCHAR(30),
prenom_famille VARCHAR(30), 
date_de_creation_famille DATE, 
id_membre_membre **NOT FOUND**(20), 
id_compte_compte **NOT FOUND**(20), 
id_budget_budget **NOT FOUND**(20), 
PRIMARY KEY (id_famille_famille)) ENGINE=InnoDB;  

DROP TABLE IF EXISTS membre ; 
CREATE TABLE membre (id_membre_membre INT(20) AUTO_INCREMENT NOT NULL, 
nom_membre VARCHAR(30), 
premon_membre VARCHAR(30), 
email_membre VARCHAR(30), 
mot_de_passe_membre VARCHAR(30), 
fonction_membre VARCHAR(20), 
#id_famille_membre VARCHAR(20), 
id_transaction_transaction **NOT FOUND**(20), 
PRIMARY KEY (id_membre_membre)) ENGINE=InnoDB;  

DROP TABLE IF EXISTS categorie ; 
CREATE TABLE categorie (id_categorie_categorie INT(20) AUTO_INCREMENT NOT NULL, 
nom_categorie VARCHAR(30), 
icone_categorie VARCHAR(20), 
description_categorie VARCHAR(30), 
id_transaction_transaction **NOT FOUND**(20), 
PRIMARY KEY (id_categorie_categorie)) ENGINE=InnoDB;  

DROP TABLE IF EXISTS compte ; 
CREATE TABLE compte (id_compte_compte INT(20) AUTO_INCREMENT NOT NULL, 
nom_compte VARCHAR(30), 
solde_initial_compte VARCHAR(30), 
devise_compte VARCHAR(30), 
#id_famille_compte VARCHAR(20), 
id_transaction_transaction **NOT FOUND**(20), 
PRIMARY KEY (id_compte_compte)) ENGINE=InnoDB;  

DROP TABLE IF EXISTS transaction ; 
CREATE TABLE transaction (id_transaction_transaction INT(20) AUTO_INCREMENT NOT NULL, 
montant_transaction VARCHAR(30), 
date_transaction DATE, 
description_transaction VARCHAR(50), 
type_transaction VARCHAR(30), 
#id_compte_transaction INT(20), 
#id_categorie_transaction INT(20), 
#id_membre_transaction INT(20), 
PRIMARY KEY (id_transaction_transaction)) ENGINE=InnoDB;  

DROP TABLE IF EXISTS budget ; 
CREATE TABLE budget (id_budget_budget INT(20) AUTO_INCREMENT NOT NULL, 
montant_budget VARCHAR(30), 
periode_budget VARCHAR(30), 
#id_categorie_budget VARCHAR(20), 
#id_famille_budget INT(20), 
categorie_id_categorie_categorie INT(20), 
PRIMARY KEY (id_budget_budget)) ENGINE=InnoDB;  

ALTER TABLE famille ADD CONSTRAINT FK_famille_id_membre_membre FOREIGN KEY (id_membre_membre) REFERENCES membre (id_membre_membre); 
ALTER TABLE famille ADD CONSTRAINT FK_famille_id_compte_compte FOREIGN KEY (id_compte_compte) REFERENCES compte (id_compte_compte); 
ALTER TABLE famille ADD CONSTRAINT FK_famille_id_budget_budget FOREIGN KEY (id_budget_budget) REFERENCES budget (id_budget_budget); 
ALTER TABLE membre ADD CONSTRAINT FK_membre_id_transaction_transaction FOREIGN KEY (id_transaction_transaction) REFERENCES transaction (id_transaction_transaction); 
ALTER TABLE categorie ADD CONSTRAINT FK_categorie_id_transaction_transaction FOREIGN KEY (id_transaction_transaction) REFERENCES transaction (id_transaction_transaction); 
ALTER TABLE compte ADD CONSTRAINT FK_compte_id_transaction_transaction FOREIGN KEY (id_transaction_transaction) REFERENCES transaction (id_transaction_transaction); 
ALTER TABLE budget ADD CONSTRAINT FK_budget_categorie_id_categorie_categorie FOREIGN KEY (categorie_id_categorie_categorie) REFERENCES categorie (id_categorie_categorie); 