require './lib/enigma'

encrypted_file = File.open(ARGV[0], 'r')
encrypted_message = encrypted_file.read.chomp

date = ARGV[2]

enigma = Enigma.new()
crack = enigma.crack(encrypted_message, date)

cracked_file = file.open(ARGV[1], 'w')
cracked_message = cracked_file.write(crack[:decryption])

print "Created #{ARGV[1]} with the cracked key #{crack[:key]} and date #{crack[:date]}\n"
