require 'set'

class Program
  attr_reader :name, :weight, :tops, :total_weight
  attr_accessor :parent
  def initialize(line)
    regex = /^([[:alpha:]]+) \(([[:digit:]]+)\)(?: -> (.*))?$/
    match = line.match regex

    @name = match[1]
    @weight = match[2].to_i
    @tops = if match[3].nil?
              []
            else
              match[3].split(', ')
            end
    @total_weight = nil
  end

  def make_tree progs
    @tops = @tops.map do |t|
      prog = progs[t].make_tree progs
      prog.parent = self
      prog
    end

    self
  end

  def total_weight
    return @total_weight unless @total_weight.nil?
    
    if tops.nil?
      @total_weight = weight
    else
      @total_weight = weight + @tops.map(&:total_weight).sum
    end

    @total_weight
  end

  def find_mismatch
    return tops[0].find_mismatch if tops.size = 1
  end

end

progs = {}
named = Set.new
topped = Set.new

File.read('7.txt').each_line do |l|
  prog = Program.new(l)
  progs[prog.name] = prog
  named << prog.name
  prog.tops.each { |t| topped << t }
end

bottom = progs[(named - topped).to_a[0]]
puts bottom.name

bottom = bottom.make_tree progs

mismatch = progs.select do |_k, v|
  v.tops.map(&:total_weight).uniq.size <= 1 && v.parent.tops.map(&:total_weight).uniq.size > 1
end

mismatch.to_a[0][1].parent.tops.each do |t|
  puts t.total_weight - mismatch.to_a[0][1].total_weight
end

puts mismatch.to_a[0][1].weight
