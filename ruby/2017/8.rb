REGEX = /^([[:alpha:]]+) (inc|dec) (-?[[:digit:]]+) if ([[:alpha:]]+) (>|<|>=|<=|==|!=) (-?[[:digit:]]+)$/
ACTIONMAP = {
  'inc' => :+,
  'dec' => :-
}
regs = Hash.new(0)
max = 0

File.read('./8.txt').each_line do |l|
  match = REGEX.match(l)

  reg = match[1]
  action = match[2]
  val = match[3].to_i
  condreg = match[4]
  condval = regs[condreg]
  condtestfn = match[5].to_sym
  condtestval = match[6].to_i

  if condval.send(condtestfn, condtestval)
    regs[reg] = regs[reg].send(ACTIONMAP[action], val)
    max = [max, regs[reg]].max
  end
end

puts regs.values.max
puts max
