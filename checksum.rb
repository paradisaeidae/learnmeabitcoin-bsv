require 'digest'

# Checksums use dbl_256 (where data is hashed twice through sha256)
def dbl_256(hex)
 binary = [hex].pack("H*")
 hash1 = Digest::SHA256.digest(binary)
 hash2 = Digest::SHA256.digest(hash1)
 result = hash2.unpack("H*")[0]
 return result end

# Checksums are used when creating addresses
def checksum(hex)
 hash = dbl_256(hex) # Hash the data through SHA256 twice
 return hash[0...8] end # Return the first 4 bytes (8 characters)

# Example
puts checksum('00662ad25db00e7bb38bc04831ae48b4b446d12698') #=> 17d515b6
