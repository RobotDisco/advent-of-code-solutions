steptxt = File.read('./11.txt')[0...-1].split(',')

steptxt = ['se', 'sw', 'se', 'sw', 'sw']
steps = steptxt.map do |i|
  case i
  when 'n'
    [0, 1]
  when 's'
    [0, -1]
  when 'ne'
    [1, 1]
  when 'nw'
    [1, -1]
  when 'se'
    [-1, 1]
  when 'sw'
    [-1, -1]
  else
    puts i
    exit 1
  end
end

finalpos = steps.reduce([0, 0]) do |acc, s|
  [acc[0] + s[0], acc[1] + s[1]]
end

puts finalpos
