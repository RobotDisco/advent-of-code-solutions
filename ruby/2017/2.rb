#!/bin/ruby

require 'csv'

def question1
  sum = 0

  tsv = CSV.read('./2.txt')

  tsv.each do |row|
    ints = row.map(&:to_i)

    min = ints.min
    max = ints.max

    sum += (max - min)
  end

  puts sum
end

def question2
  sum = 0

  tsv = CSV.read('./2.txt')

  tsv.each do |row|
    ints = row.map(&:to_i)

    for i in 0...ints.size
      for j in (i + 1)...ints.size
        sum += ints[i] / ints[j] if (ints[i] % ints[j]).zero?
        sum += ints[j] / ints[i] if (ints[j] % ints[i]).zero?
      end
    end
  end

  puts sum
end

question1
question2
