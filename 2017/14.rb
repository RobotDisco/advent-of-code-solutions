testinput = 'flqrgnkx'
input = 'ljoxqyyw'

def knothash(input)
  lengths = input.split('').map(&:ord)
  lengths << 17 << 31 << 73 << 47 << 23

  ribbon = (0..255).to_a
  skip = 0
  rotations = 0

  64.times do |_|
    lengths.each do |l|
      continue if l > ribbon.size
      # puts ribbon.to_s

      ribbon[0...l] = ribbon[0...l].reverse
      ribbon.rotate!(l + skip)
      rotations += (l + skip)
      skip += 1
    end
  end

  ribbon.rotate!(-1 * rotations)
  densehash = []

  ribbon.each_slice(16) do |s|
    densehash << s.reduce { |a, v| a ^ v }
  end

  unpadded = densehash.map { |i| i.to_s 16 }
  unpadded.map do |c|
    if c.size < 2
      '0' << c
    else
      c
    end
  end.join
end

def question14a key
  grid = (0..127).map do |i|
    input = "#{key}-#{i}"
    knothash(input).hex.to_s(2).split('')
  end
  grid.flatten.select { |i| i == '1' }.size
end

def question14b(key)
  grid = (0..127).map do |i|
    input = "#{key}-#{i}"
    binrow = knothash(input).split('').map do |char|
      binstring = char.hex.to_s(2)
      binstring.prepend('0') until binstring.size == 4
      binstring
    end
    binrow.join.split('').map do |j|
      if j == '1'
        true
      else
        false
      end
    end
  end

  flatgrid = grid.flatten
  count = 0
  loop do
    firstunallocated = flatgrid.find_index true
    break if firstunallocated.nil?

    count += 1
    neighbours = [firstunallocated]
    until neighbours.empty?
      lookat = neighbours.shift
      next unless flatgrid[lookat]
      if flatgrid[lookat] != true && count != flatgrid[lookat]
        puts "WTF #{count} #{flatgrid[lookat]}"
        exit 1
      end
      next unless flatgrid[lookat] == true
      flatgrid[lookat] = count
      candidates = []
      candidates << -1 unless (lookat % 128).zero?
      candidates << 1 unless (lookat % 128) == 127 || (lookat % 128) == -1
      candidates << 128 unless lookat + 128 >= 128**2
      candidates << -128 unless lookat - 128 < 0
      candidates.each do |i|
        newlookat = lookat + i
        neighbours << newlookat
      end
    end
  end

  count
end

puts question14a input
puts question14b input
