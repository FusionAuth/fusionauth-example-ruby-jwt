require 'jwt'

# the todo API

hmac_secret = 'helloRuby!##'

token = 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJmdXNpb25hdXRoLmlvIiwiZXhwIjoxNTk0MzI5OTY3LCJhdWQiOiIyMzhkNDc5My03MGRlLTQxODMtOTcwNy00OGVkOGVjZDE5ZDkiLCJzdWIiOiIxOTAxNmI3My0zZmZhLTRiMjYtODBkOC1hYTkyODc3Mzg2NzciLCJuYW1lIjoiRGFuIE1vb3JlIiwicm9sZXMiOlsiUkVUUklFVkVfVE9ET1MiXX0.C5xpJG3Z2TxopB9mTTsJtlkY7Kr8xrgEs1k8bZoN4VU'

puts token

decoded_token = JWT.decode token, hmac_secret, true, { algorithm: 'HS256' }

puts decoded_token
