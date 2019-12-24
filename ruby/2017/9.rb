garbage = false
ignore = true
stacklevel = 1
stacktotal = 0
garbagecount = 0

File.read('./9.txt').each_char do |c|
  if ignore
    ignore = false
  elsif garbage && c == '>'
    garbage = false
  elsif garbage && c == '!'
    ignore = true
  elsif garbage
    garbagecount += 1
  elsif !garbage && c == '<'
    garbage = true
  elsif !garbage && c == '}'
    stacktotal += stacklevel
    stacklevel -= 1
  elsif !garbage && c == '{'
    stacklevel += 1
  end
end

puts stacklevel
puts stacktotal
puts garbagecount
