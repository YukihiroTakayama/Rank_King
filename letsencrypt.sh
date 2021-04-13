docker run --rm \
  -p 443:443 -p 80:80 --name letsencrypt \
  -v "rank_king_certs:/etc/letsencrypt" \
  -v "rank_king_certs-data:/var/lib/letsencrypt" \
  certbot/certbot certonly -n \
  -m "takayamayukihiro@gmail.com" \
  -d rankingking.net \
  --standalone --agree-tos