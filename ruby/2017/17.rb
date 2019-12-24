def question16a(steps)
  buffer = [0]
  currentpos = 0

  (1..2017).each do |i|
    currentpos = (currentpos + steps) % buffer.size
    buffer.insert(currentpos + 1, i)
    currentpos += 1
  end
  
  buffer[(currentpos + 1) % buffer.size]
end

def question16b(steps)
  currentpos = 0
  zeropos = 0
  bufsize = 1
  latestone = nil

  (1..50_000_000).each do |i|
    currentpos = (currentpos + steps) % bufsize
    bufsize += 1
    currentpos += 1
    latestone = i if currentpos == 1
  end
  latestone
end

puts question16a 3
puts question16a 359
puts question16b 359
