require 'jwt'

exp = Time.now.to_i + (5*60)

payload = { "iss": "fusionauth.io", 
            "exp": exp, 
            "aud": "238d4793-70de-4183-9707-48ed8ecd19d9",
            "sub": "19016b73-3ffa-4b26-80d8-aa9287738677",
            "name": "Dan Moore",
            "roles": ["RETRIEVE_TODOS"]
}

rsa_private = OpenSSL::PKey::RSA.generate 2048 # but really you're going to get this from somewhere else
rsa_public = rsa_private.public_key

token = JWT.encode payload, rsa_private, 'RS256'

puts token

decoded_token = JWT.decode token, rsa_public, true, { algorithm: 'RS256' }

puts decoded_token
