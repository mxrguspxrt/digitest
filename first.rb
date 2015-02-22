text = "found %{total_ones_count} bits set to 1
found %{total_zeros_count} bits set to 0\n"

file_path = ARGV[0]
file = File.new(file_path)

total_ones_count = 0
total_zeros_count = 0

table_for_count_of_ones = (0..255).map do |number|
  binary = "%b" % number
  byte_ones_count = binary.split("").select{|x| x=="1" }.count
end

begin
  while byte = file.readbyte
    byte_ones_count = table_for_count_of_ones[byte]
    byte_zeros_count = 8-byte_ones_count

    total_ones_count += byte_ones_count
    total_zeros_count += byte_zeros_count
  end
rescue EOFError
end

puts text % {total_ones_count: total_ones_count, total_zeros_count: total_zeros_count}