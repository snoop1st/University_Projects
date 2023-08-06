import psycopg2
import numpy as np
import matplotlib.pyplot as plt
from mpl_toolkits.mplot3d import axes3d

conn = psycopg2.connect(user = "examiner@tsesok", password = "examiner_password", host = "tsesok.postgres.database.azure.com", port = "5432", database = "postgres")

print("Connection established")

cursor = conn.cursor()

# movies per year
cursor.execute("SELECT substring (CAST(release_date AS VARCHAR(255)),1,4) AS year,\
				COUNT (*) AS movieyear\
				FROM movie\
				WHERE release_date IS NOT NULL\
				GROUP BY substring (CAST (release_date AS VARCHAR(255)),1, 4)\
				ORDER BY YEAR")
rows = cursor.fetchall()

x=[]
y=[]

for row in rows:
	x.append(row[0])
	y.append(row[1])

plt.xlabel('x year')
plt.ylabel('y movie_count')
plt.xticks(rotation = 90)
plt.bar(x,y)
plt.show()
	
x.clear()
y.clear()

#movies per genre
cursor.execute("SELECT COUNT(movie_genres.movie_id) as movies, genre.name as genres\
				FROM movie_genres\
				INNER JOIN genre\
				ON genre.id = movie_genres.genre_id \
				GROUP BY name")
rows = cursor.fetchall()

for row in rows:
	print(row[0], row[1])
	x.append(str(row[1]))
	y.append(row[0])

plt.xlabel('x genre')
plt.ylabel('y movie_count')
plt.xticks(rotation = 90)
plt.bar(x,y)
plt.show()

x.clear()
y.clear()

#count genre ana etos
z = []
cursor.execute("SELECT genre.name as genres, substring (CAST(release_date AS VARCHAR(255)),1,4) AS year,\
				COUNT (*) AS movieyear\
				FROM movie_genres\
				INNER JOIN movie\
				ON movie.id = movie_genres.movie_id\
				INNER JOIN genre\
				ON genre.id = movie_genres.genre_id \
				WHERE release_date IS NOT NULL\
				GROUP BY name, substring (CAST (release_date AS VARCHAR(255)),1, 4)\
				ORDER BY year")
rows = cursor.fetchall()

for row in rows:
	print(row[0], row[1], row[2])
	x.append(row[0])
	
	y.append(int(row[1]))
	z.append(row[2])
 
fig = plt.figure()
ax1 = fig.add_subplot(111, projection='3d')
ax1.set_facecolor((1.0, 1.0, 1.0))
xCategories = x
i=0
xDict = {}
xr = []
for category in xCategories:
  if category not in xDict:
    xDict[category]=i
    xr.append(i)
    i+=1
  else:
    xr.append(xDict[category])
# Defining the starting position of each bar (x is already defined)
zr = np.zeros(len(xr))
# Defining the length/width/height of each bar.
dx = np.ones(len(xr))*0.1
dy = np.ones(len(xr))
dz = z
ax1.bar3d(xr, y, zr, dx, dy, dz)
ax1.set_zlim([0, max(z)])
plt.xticks(range(len(xDict.values())), xDict.keys())
plt.xlabel('x genre')
plt.ylabel('y year')
ax1.set_zlabel('z mouvie_count')

plt.show()

x.clear()
y.clear()


#max budget ana year
cursor.execute("SELECT substring (CAST(release_date AS VARCHAR(255)),1,4) AS year, MAX(budget)\
				FROM movie\
				WHERE release_date IS NOT NULL\
				GROUP BY year\
				ORDER BY year")	
rows = cursor.fetchall()
for row in rows:
	print(row[0], row[1])
	x.append(row[0])
	y.append(row[1])

plt.xlabel('x year')
plt.ylabel('y budget')
plt.xticks(rotation = 90)
plt.bar(x,y)
plt.show()		

x.clear()
y.clear() 

#Brad Pitt revenue per year
cursor.execute("SELECT substring (CAST(release_date AS VARCHAR(255)),1,4) AS year, SUM(revenue)\
				FROM movie\
				INNER JOIN movie_cast ON\
				movie_cast.movie_id = movie.id\
				INNER JOIN person ON \
				person.id = movie_cast.person_id\
				WHERE name = 'Brad Pitt'\
				GROUP BY year")
rows = cursor.fetchall()

for row in rows:
	print(row[0], row[1])
	x.append(row[0])
	y.append(row[1])

plt.xlabel('x year')
plt.ylabel('y revenue')
plt.xticks(rotation = 90)
plt.bar(x,y)
plt.show()

x.clear()
y.clear()


#average ratings ana xristi

cursor.execute("SELECT AVG(rating), user_id\
				FROM ratings\
				GROUP BY user_id")
rows = cursor.fetchall()

for row in rows:
	print(row[0], row[1])
	x.append(row[1])
	
	y.append(row[0])

plt.xlabel('user')
plt.ylabel('avg_ratings')
plt.scatter(x, y,s=1)
plt.yticks([0,1, 2, 3, 4, 5])
plt.show()

x.clear()
y.clear()

#count ratings ana xristi
cursor.execute("SELECT COUNT(rating), user_id\
				FROM ratings\
				GROUP BY user_id")
rows = cursor.fetchall()

for row in rows:
	print(row[0], row[1])
	x.append(row[1])
	
	y.append(row[0])

plt.xlabel('user')
plt.ylabel('count_ratings')
plt.scatter(x, y,s=1)

plt.show()
x.clear()
y.clear()

#average rating ana genre
cursor.execute("SELECT genre.name as genres, AVG(rating)\
				FROM movie_genres\
				INNER JOIN ratings ON\
				ratings.movie_id = movie_genres.movie_id\
				INNER JOIN genre\
				ON genre.id = movie_genres.genre_id \
				GROUP BY genre.name")
rows = cursor.fetchall()

for row in rows:
	print(row[0], row[1])
	x.append(str(row[0]))
	y.append(row[1])

plt.xlabel('x genre')
plt.ylabel('y rating')
plt.xticks(rotation = 90)
plt.bar(x,y)
plt.show()


conn.commit()
cursor.close()
conn.close()
