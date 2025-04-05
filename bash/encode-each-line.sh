cat result.txt | while read -r line; do echo -n "$line" | base64; done >encoded.txt
