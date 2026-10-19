use DW_systemeTransport;
CREATE TABLE Dim_Date (
    id_date INT PRIMARY KEY,
    date_complete DATE NOT NULL,
    jour INT,
    nom_jour VARCHAR(20),
    mois INT,
    nom_mois VARCHAR(20),
    trimestre INT,
    annee INT
);
--creation de la dimension dim_chauuffeur

CREATE TABLE Dim_Chauffeur (
    id_chauffeur INT IDENTITY(1,1) PRIMARY KEY,
    code_chauffeur VARCHAR(50),
    nom_chauffeur VARCHAR(150),
    site_chauffeur VARCHAR(50)
);

--creation de la dimension dim_camion

CREATE TABLE Dim_Camion (
    id_camion INT IDENTITY(1,1) PRIMARY KEY,
    immatriculation VARCHAR(50),
    capacite DECIMAL(10,2),
    site_camion VARCHAR(50)
);

---creation de dim_site
CREATE TABLE Dim_Site (
    id_site INT IDENTITY(1,1) PRIMARY KEY,
    code_site VARCHAR(50)
);

--creation de dim_type_voyage
CREATE TABLE Dim_Type_Voyage (
    id_type_voyage INT IDENTITY(1,1) PRIMARY KEY,
    type_tournee VARCHAR(100),
    type_transport VARCHAR(50)
);




--creation de la table de fait fact_voyage
CREATE TABLE Fact_Voyage (
    id_voyage INT IDENTITY(1,1) PRIMARY KEY,

    VOYCLE VARCHAR(50) NOT NULL,

    id_date INT,
    id_chauffeur INT,
    id_camion INT,
    id_site INT,
    id_type_voyage INT,

    date_depart DATE,
    heure_depart TIME,
    date_fin DATE,
    heure_fin TIME,

    nb_references INT DEFAULT 0,

    present_mobility BIT DEFAULT 0,
    nb_evenements INT DEFAULT 0,
    nb_evenements_sans_temps INT DEFAULT 0,

    delai_saisie_moyen DECIMAL(10,2),

    voyage_sans_evenement BIT DEFAULT 0,
    nb_anomalies INT DEFAULT 0,

    CONSTRAINT FK_Fact_Date
        FOREIGN KEY (id_date)
        REFERENCES Dim_Date(id_date),

    CONSTRAINT FK_Fact_Chauffeur
        FOREIGN KEY (id_chauffeur)
        REFERENCES Dim_Chauffeur(id_chauffeur),

    CONSTRAINT FK_Fact_Camion
        FOREIGN KEY (id_camion)
        REFERENCES Dim_Camion(id_camion),

    CONSTRAINT FK_Fact_Site
        FOREIGN KEY (id_site)
        REFERENCES Dim_Site(id_site),

    CONSTRAINT FK_Fact_Type_Voyage
        FOREIGN KEY (id_type_voyage)
        REFERENCES Dim_Type_Voyage(id_type_voyage)
);