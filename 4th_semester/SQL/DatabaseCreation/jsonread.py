import csv, ast

userinput = input("Input file's name e.g. keywords.csv : \n") 							# ask for input -> choose file keywords or credits to generate the according file
print()

try: 																					# try -> else file's not found -> throw exception
																						
		file = open(userinput, 'r', encoding= 'UTF8') 									# open userinput file with read parameter and encoding UTF8
		csvreader = csv.reader(file)
		header = next(csvreader) 														# skip header

		b = open('movie_id_keyword_id.csv', 'w', encoding='UTF8', newline='') 			# open new file movie_id_keyword_id.csv with write parameter, encoding UTF8, and newline=''
		bwriter = csv.writer(b) 														
		bwriter.writerow(['movie_id', 'keyword_id']) 									# write header in the csv file, two columns movie_id and keyword_id

		c = open('id_name.csv', 'w', encoding='UTF8', newline='')						# open new file id_name.csv with write parameter, encoding UTF8, and newline=''
		cwriter = csv.writer(c)
		cwriter.writerow(['id', 'name'])												# write header in the csv file, two columns id, name

		for row in csvreader: 															# for every row in user's input file
			jsonString = row[1] 														# jsonString equals to the JSON 
			data = ast.literal_eval(jsonString) 										# data is a list with every nested JSON from jsonString

			for j in data: 																# for every nested json from data
				
				dl = [row[0], j['id']] 													# create a new list (dl) with movie_id and data[j]['id'] == j['id']
				bwriter.writerow(dl)													# write the contents of dl list to movie_idkeyword_id.csv
				
				ndl = [j['id'], j['name']] 												# create a new list (ndl) with data[j]['id'] and data[j]['name']
				cwriter.writerow(ndl)													# write the contents of ndl list to id_name.csv

		file.close()																	# close file from userinput
		b.close()																		# close file movie_id_keyword_id.csv
		c.close() 																		# close file id_name.csv

		print('Generated movie_id, keyword_id in movie_id_keyword_id.csv & \
 id, name in id_name.csv csv tables successfuly.')										# let the user know that the script ended successfuly

except IOError: 																		# file not found in the directory, print message to show that the script failed to generate the csv's
	print('Exitting with message:\t Failed to find the file\
 specified in this directory! Please run the script again \
 with the correct file.')														