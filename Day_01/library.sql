CREATE TABLE author 
( 
    id INT PRIMARY KEY AUTO_INCREMENT,
    fullname VARCHAR(100) NOT NULL,
    dob DATE,
    pob TEXT,
    description TEXT,
    avatar TEXT
);
CREATE TABLE publisher 
( 
    id INT PRIMARY KEY AUTO_INCREMENT,
    name_publisher VARCHAR(50) NOT NULL,
    address TEXT,
    phone VARCHAR(10), email VARCHAR(50),
    director VARCHAR(50),
    website VARCHAR(50) 
);
CREATE TABLE book_type 
( 
    id INT PRIMARY KEY AUTO_INCREMENT,
    name_type VARCHAR(50) NOT NULL,
    type_description TEXT 
);
CREATE TABLE book_language 
( 
    id INT PRIMARY KEY AUTO_INCREMENT,
    language_name VARCHAR(50) NOT NULL 
);
CREATE TABLE book 
( 
    id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(100) NOT NULL, 
    page_number INT, 
    realease DATE, 
    book_description TEXT, 
    cost INT NOT NULL, 
    book_size VARCHAR(100), 
    book_number INT, 
    translator VARCHAR(100), 
    id_NXB INT, 
    id_NN INT, 
    FOREIGN KEY(id_NXB) REFERENCES publisher(id), 
    FOREIGN KEY(id_NN) REFERENCES book_language(id) 
);
CREATE TABLE book_author 
( 
    id_book int, 
    id_author int, 
    PRiMARY KEY(id_book, id_author), 
    FOREIGN KEY(id_book) REFERENCES book(id), 
    FOREIGN KEY(id_author) REFERENCES author(id) 
);
CREATE TABLE sach_theloai 
( 
    id_book int, 
    id_type int, 
    PRiMARY KEY(id_book, id_type), 
    FOREIGN KEY(id_book) REFERENCES book(id), 
    FOREIGN KEY(id_type) REFERENCES book_type(id) 
);