depths = {}

File.read('./13.txt').each_line do |l|
  match = l.match(/^(\d+): (\d+)$/)
  depths[match[1].to_i] = match[2].to_i
end

def question13a(depths)
  scannerpos = Hash.new(1)
  scannerdir = Hash.new(1)
  severity = 0
  (0..depths.keys.max).each do |i|
    severity += i * depths[i] if depths.key?(i) && scannerpos[i] == 1
    depths.keys.each do |j|
      scannerpos[j] = (scannerpos[j] + scannerdir[j])
      scannerdir[j] = -1 if scannerpos[j] == depths[j]
      scannerdir[j] = 1 if scannerpos[j] == 1
    end
  end

  severity
end

require 'set'

def question13b(depths)
  forbiddentimes = depths.map do |entry|
    [entry[0], entry[1] * 2 - 2]
  end.to_h
  sorteddepths = forbiddentimes.to_a.sort_by do |e|
    e[1]
  end
  sorteddepths = sorteddepths.map { |e| e[0] }

  delay = 1
  loop do
    sorteddepths.each do |d|
      puts delay
      if ((delay + d) % forbiddentimes[d]).zero?
        delay += 1
        next 2
      end
    end
  end
  delay
end

puts question13a depths
#puts question13b depths
puts question13b(0 => 3, 1 => 2, 4 => 4, 6 => 4) # depths
