-- Lấy ra thông tin tất cả các quyển sách thuộc thể loại comedy hoặc drama
SELECT book.id,title,description,page_number,image,id_publisher,year_of_publication 
FROM book 
INNER JOIN book_category ON book.id = book_category.id_book 
INNER JOIN category ON category.id = book_category.id_category 
WHERE category.name = 'Comedy' OR category.name = 'Drama';
-- Lấy ra id_book, title, author, category của quyển sách được xuất bản từ năm 1800 đến 1900
SELECT book.id,title,author.full_name AS 'author',category.name AS 'Category'
FROM book 
INNER JOIN book_category ON book.id = book_category.id_book 
INNER JOIN category ON category.id = book_category.id_category 
INNER JOIN book_author ON book.id = book_author.id_book
INNER JOIN author ON author.id = book_author.id_author
WHERE book.year_of_publication BETWEEN 1800 AND 1900;
-- Đếm số sách dựa theo nhà xuất bản (Hiển thị tên nhà xuất bản và số sách thuộc nhà xuất bản đó)
SELECT COUNT(book.id),publisher.name
FROM book
INNER JOIN publisher ON book.id_publisher = publisher.id
GROUP BY id_publisher