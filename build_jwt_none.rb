require 'jwt'

exp = Time.now.to_i + (5*60)

payload = { "iss": "fusionauth.io", 
            "exp": exp, 
            "aud": "238d4793-70de-4183-9707-48ed8ecd19d9",
            "sub": "19016b73-3ffa-4b26-80d8-aa9287738677",
            "name": "Dan Moore",
            "favoriteTeam": "Chiefs",
            "roles": ["RETRIEVE_TODOS"]
}

token = JWT.encode payload, nil, 'none'

puts token

decoded_token = JWT.decode token, nil, false

puts decoded_token
