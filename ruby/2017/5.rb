prg = File.open('5.txt').map(&:to_i)

pc = 0
steps = 0

until pc < 0 || pc >= prg.size
  steps += 1
  old_pc = pc
  pc += prg[pc]
  prg[old_pc] += if prg[old_pc] >= 3
                 then
                   -1
                 else
                   1
                 end
end

puts pc
puts steps
