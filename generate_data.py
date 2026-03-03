import random
import string
import psycopg2

conn = psycopg2.connect("dbname=db_name user=your_username password=your_password")
cur = conn.cursor()

for _ in range(1_000_000):
    email = ''.join(random.choices(string.ascii_lowercase, k=10)) + "@example.com"
    age = random.randint(18, 60)
    cur.execute("INSERT INTO users (email, age) VALUES (%s, %s)", (email, age))

conn.commit()
cur.close()
conn.close()