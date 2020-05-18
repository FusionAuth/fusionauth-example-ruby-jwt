require 'jwt'

hmac_secret = 'helloKCRuby!##'

token = 'eyJhbGciOiJIUzI1NiJ9.RyJpc3MiOiJmdXNpb25hdXRoLmlvIiwiZXhwIjoxNTg5ODQ0MjY1LCJhdWQiOiIyMzhkNDc5My03MGRlLTQxODMtOTcwNy00OGVkOGVjZDE5ZDkiLCJzdWIiOiIxOTAxNmI3My0zZmZhLTRiMjYtODBkOC1hYTkyODc3Mzg2NzciLCJuYW1lIjoiRGFuIE1vb3JlIiwicm9sZXMiOlsiUkVUUklFVkVfVE9ET1MiXX0.ABBPlZ6gDG2HfvPQqN7VQ8GGh-60x9mmxiLIyc5gj6A'

puts token

decoded_token = JWT.decode token, hmac_secret, true, { algorithm: 'HS256' }

puts decoded_token
