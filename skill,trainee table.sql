USE Marchdb

CREATE TABLE Skill (
    id INT identity (200,1)not null,
    skillname VARCHAR(100) NOT NULL
);
CREATE TABLE Trainee (
    trainee_id INT identity (200,1)not null,
    name VARCHAR(100) NOT NULL,
    skill_id INT not null,
    trainee_skill varchar(50),
    constraint pk_tsid primary key (trainee_id,skill_id)
);
INSERT INTO Skill (skillname) VALUES 
('Java'),
('Python'),
('SQL'),
('JavaScript');

INSERT INTO Trainee (name, skill_id, trainee_skill) VALUES
('Alice', 200, 'Java'),   
('Bob', 201, 'Python'),          
('Charlie', 202, 'SQL'),      
('David', 203, 'JavaScript'),      
('Emma', 200, 'Java'),
('john',201,'Python'),
('sam',203,'JavaScript'),
('virat',200,'Java')
;      

SELECT * FROM Skill;
SELECT * FROM Trainee;