require './lib/enigma'


encrypted_file = File.open(ARGV[0], "r")
encrypted_message = encrypted_file.read.chomp

enigma = Enigma.new()
decryption = enigma.decrypt(encrypted_message, ARGV[2], ARGV[3])

file2 = File.open(ARGV[1], "w")
file2.write(decryption[:decryption])

print "Created #{ARGV[1]} with the key #{ARGV[2]} and date #{ARGV[3]}\n"
