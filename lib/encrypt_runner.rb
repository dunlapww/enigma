require './lib/enigma'

file1 = File.open(ARGV[0], "r")
message = file1.read.chomp

enigma = Enigma.new()
encryption = enigma.encrypt(message)

file2 = File.open(ARGV[1], "w")
file2.write(encryption[:encryption])

print "Created #{ARGV[1]} with the key #{encryption[:key]} and date #{encryption[:date]}\n"
