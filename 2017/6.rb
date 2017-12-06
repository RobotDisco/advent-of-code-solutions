require 'csv'
require 'set'

banks = File.read('./6.txt').split(/\t/).map(&:to_i)

configs = Set.new
configs << banks.clone
# Because I'm lazy I will just store the cycle # when I first encountered each bank layout.
dumbhack = {}

count = 0

while true
  maxbank = banks.index(banks.max)
  blocksleft = banks.max
  banks[maxbank] = 0
  fillbank = (maxbank + 1) % banks.size

  until blocksleft.zero?
    blocks_distributed = [[blocksleft / banks.size, 1].max, blocksleft].min
    banks[fillbank] += blocks_distributed
    blocksleft -= blocks_distributed
    fillbank = (fillbank + 1) % banks.size
  end

  count += 1
  break if configs.member? banks
  configs << banks.clone
  dumbhack[banks.clone] = count
end

puts count
# From first round cycle entry was discovered to now, when cycle entry is
# discovered again, that is the number of cycles required to get into a loop.
puts count - dumbhack[banks.clone]
