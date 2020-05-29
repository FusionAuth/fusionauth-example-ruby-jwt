require 'jwt'
require 'benchmark'

hmac_secret = 'helloRuby!##'

exp = Time.now.to_i + (5*60)

payload = { "iss": "fusionauth.io", 
            "exp": exp, 
            "aud": "238d4793-70de-4183-9707-48ed8ecd19d9",
            "sub": "19016b73-3ffa-4b26-80d8-aa9287738677",
            "name": "Dan Moore",
            "roles": ["RETRIEVE_TODOS"]
}

repeat_x_times = 50_000

puts "hmac encode"
puts Benchmark.measure {
  repeat_x_times.times do
    JWT.encode payload, hmac_secret, 'HS256', {"typ": "JWT"}
  end
}

token = JWT.encode payload, hmac_secret, 'HS256', {"typ": "JWT"}

puts "hmac decode"
puts Benchmark.measure {
  repeat_x_times.times do
    JWT.decode token, hmac_secret, true, { algorithm: 'HS256' }
  end
}



rsa_private = OpenSSL::PKey::RSA.generate 2048 # but really you're going to get this from somewhere else
rsa_public = rsa_private.public_key

puts "rsa encode"
puts Benchmark.measure {
  repeat_x_times.times do
    JWT.encode payload, rsa_private, 'RS256', {"typ": "JWT"}
  end
}

token = JWT.encode payload, rsa_private, 'RS256', {"typ": "JWT"}

puts "rsa decode"
puts Benchmark.measure {
  repeat_x_times.times do
    JWT.decode token, rsa_public, true, { algorithm: 'RS256' }
  end
}



ecdsa_key = OpenSSL::PKey::EC.new 'prime256v1'
ecdsa_key.generate_key
ecdsa_public = OpenSSL::PKey::EC.new ecdsa_key
ecdsa_public.private_key = nil

puts "ecc encode"
puts Benchmark.measure {
  repeat_x_times.times do
    JWT.encode payload, ecdsa_key, 'ES256', {"typ": "JWT"}
  end
}

token = JWT.encode payload, ecdsa_key, 'ES256', {"typ": "JWT"}

puts "ecc decode"
puts Benchmark.measure {
  repeat_x_times.times do
    JWT.decode token, ecdsa_public, true, { algorithm: 'ES256' }
  end
}

