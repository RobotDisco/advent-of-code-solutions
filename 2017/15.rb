SEEDA = 699
SEEDB = 124
FACTORA = 16_807
FACTORB = 48_271
# SEEDA = 65
# SEEDB = 8921

def gennext(factor, prev)
  (prev * factor) % 2_147_483_647
end

def genseq(factor, seed)
  res = []
  res << gennext(factor, seed)
  (2..40_000_000).each do |_|
    res << gennext(factor, res[-1])
  end
  res.map { |i| i.to_s(2) }
end

def genseq2(factor, seed, multiple)
  res = []
  curr = seed
  res << seed if (seed % multiple).zero?
  until res.size == 5_000_000
    curr = gennext(factor, curr)
    res << curr if (curr % multiple).zero?
  end
  res.map { |i| i.to_s(2) }
end

def question15a
  as = genseq(FACTORA, SEEDA)
  bs = genseq(FACTORB, SEEDB)

  abs = as.zip(bs)
  abs.select { |i| i[0][-16..-1] == i[1][-16..-1] }.size
end

def question15b
  as = genseq2(FACTORA, SEEDA, 4)
  bs = genseq2(FACTORB, SEEDB, 8)

  abs = as.zip(bs)
  abs.select { |i| i[0][-16..-1] == i[1][-16..-1] }.size
end

#puts question15a
puts question15b
