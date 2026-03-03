-- Measure Query (run this once)
EXPLAIN ANALYZE -- we use EXPLAIN ANALYZE to explain the output in plain english
SELECT *
FROM users
WHERE email = 'randomvalue@example.com';
-- 
-- Add Index (uncomment and run this after running the first EXPLAIN ANALYZE command)
CREATE INDEX idx_users_email ON users(email);
-- 
-- Measure Query again (run this after successfully adding the index)
-- EXPLAIN ANALYZE
-- SELECT *
-- FROM users
-- WHERE email = 'randomvalue@example.com';