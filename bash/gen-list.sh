true >result.txt

# Loop through each user in users.txt
for user in $(cat users.txt); do
	# Loop through each password in passwords.txt
	for password in $(cat passwords.txt); do
		# Write the user-password pair to the result file
		echo "$user:$password" >>result.txt
	done
done
