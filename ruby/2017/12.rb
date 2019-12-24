require 'set'

pipes = {}
REGEX = /^(\d+) <-> (.*)$/

File.read('./12.txt').each_line do |l|
  match = l.match(REGEX)
  pipes[match[1].to_i] = match[2].split(', ').map(&:to_i)
end

def question12a pipes
  group = Set.new

  lookat = pipes[0].clone
  until lookat.empty?
    lookat1 = lookat.clone
    lookat.clear
    lookat1.each do |l|
      next if group.member? l
      group << l
      lookat << pipes[l]
    end
    lookat.flatten!
  end

  puts group.size
end

def question12b pipes
  pipes1 = pipes.clone
  count = 0

  until pipes1.empty?
    group = Set.new

    selection = pipes1.keys.sample
    lookat = pipes1[selection]
    pipes1.delete selection
    until lookat.empty?
      lookat1 = lookat.clone
      lookat.clear
      lookat1.each do |l|
        next if group.member? l
        group << l
        lookat << pipes1[l]
        pipes1.delete(l)
      end
      lookat.flatten!
    end
    count += 1
  end

  puts count
end

question12a pipes
question12b pipes
