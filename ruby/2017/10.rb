lengths = File.read('./10.txt').split('')[0...-1].map(&:ord)
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

puts densehash.map { |i| i.to_s 16 }.join
