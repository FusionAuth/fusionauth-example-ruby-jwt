require 'jwt'

exp = Time.now.to_i + (5*60)

payload = { "iss": "fusionauth.io", 
            "exp": exp, 
            "aud": "238d4793-70de-4183-9707-48ed8ecd19d9",
            "sub": "19016b73-3ffa-4b26-80d8-aa9287738677",
            "name": "Dan Moore",
            "roles": ["RETRIEVE_TODOS"]
}

ecdsa_key = OpenSSL::PKey::EC.new 'prime256v1'
ecdsa_key.generate_key
ecdsa_public = OpenSSL::PKey::EC.new ecdsa_key
ecdsa_public.private_key = nil

token = JWT.encode payload, ecdsa_key, 'ES256', {"typ": "JWT"}

puts token

decoded_token = JWT.decode token, ecdsa_public, true, { algorithm: 'ES256' }

puts decoded_token
