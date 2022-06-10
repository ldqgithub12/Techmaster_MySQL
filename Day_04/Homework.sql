
-- Sử dụng database blog, thực hiện lấy thông tin cho một bài viết gồm tiêu đề, ngày viết, tag, nội dung bài, 
-- người viết bài (tên, số lượng bài đã viết), bình luận(người bl, thời gian bình luận, nội dung)
SELECT p.title,p.create_at,JSON_ARRAYAGG(t.name) as 'tag',p.content, 
(
	SELECT JSON_ARRAYAGG(
			JSON_OBJECT( 'comment_user', a.name ,
						 'comment_content', d.comment, 
						 'comment_date', d.create_at 
			))
	FROM discuss d INNER JOIN author a 
	ON d.id_author = a.id
	WHERE d.id_post = p.id 
) as comment,
(
	SELECT JSON_OBJECT('name',b.name,'so bai viet', COUNT(p.id))
    FROM post p 
    RIGHT JOIN author b ON
    p.id_author =b.id 
    WHERE b.id  = a.id
    GROUP BY (b.id)
) AS 'author'

FROM post p INNER JOIN author a 
ON p.id_author = a.id
INNER JOIN post_tag pt ON p.id = pt.id_post
INNER JOIN tag t ON t.id = pt.id_tag
WHERE p.id = 1