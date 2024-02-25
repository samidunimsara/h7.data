#!/bin/bash

API_KEY="apikey"
API_URL="https://tls.bufferover.run/dns?q=."

read -p "Enter domain name or list of domains (separated by spaces): " input_domains

IFS=' ' read -ra domains <<< "$input_domains"

for domain in "${domains[@]}"; do
    
    query_url="${API_URL}${domain}"

    result=$(curl -s "$query_url" -H "x-api-key:$API_KEY" | jq -r '.Results[] | split(",")[4]' | sort -u)

    output_file="${domain}_result.txt"
    echo "$result" > "$output_file"

    echo "result for $domain saved to $output_file"
done
