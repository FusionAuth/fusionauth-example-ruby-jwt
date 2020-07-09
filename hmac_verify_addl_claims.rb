require 'jwt'

# user API
hmac_secret = 'helloRuby!##'

exp = Time.now.to_i + (5*60)

payload = { "iss": "hacked.fusionauth.io", 
            "exp": exp, 
            "aud": "238d4793-70de-4183-9707-48ed8ecd19d9",
            "sub": "19016b73-3ffa-4b26-80d8-aa9287738677",
            "name": "Dan Moore",
            "roles": ["RETRIEVE_TODOS"]
}

token = JWT.encode payload, hmac_secret, 'HS256'

puts token


# todo API
expected_iss = "fusionauth.io"

decoded_token = JWT.decode token, hmac_secret, true, {  verify_iss: true, iss: expected_iss, algorithm: 'HS256' }

puts decoded_token
