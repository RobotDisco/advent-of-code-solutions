DANCERS = ('a'..'p').to_a
#DANCERS = ('a'..'e').to_a
SWITCHRGX = %r{x(\d+)/(\d+)}
PARTNERRGX = %r{p(.)/(.)}
ALPHANUM = ('a'..'z').zip(0...26).to_h
NUMALPHA = (0...26).zip('a'..'z').to_h

def question16a(dancers, moves)
  dancers1 = dancers.clone
  moves.split(',').each do |i|
    case i[0]
    when 's'
      val = i[1..-1].to_i
      dancers1 = dancers1.rotate!(-1 * val)
    when 'x'
      match = i.match SWITCHRGX
      x = match[1].to_i
      y = match[2].to_i
      temp = dancers1[x]
      dancers1[x] = dancers1[y]
      dancers1[y] = temp
    when 'p'
      match = i.match PARTNERRGX
      x = dancers1.find_index(match[1])
      y = dancers1.find_index(match[2])
      temp = dancers1[x]
      dancers1[x] = dancers1[y]
      dancers1[y] = temp
    end
  end
  dancers1
end

def question16b
  rounds ||= [] << DANCERS
  firstfound = nil
  lastfound = nil

  (1..1_000_000_000).each do |i|
    round = question16a(rounds[-1], File.read('./16.txt'))
    if rounds.member? round
      lastfound = i
      firstfound = (rounds.find_index round)
      #puts "Firstfound: #{firstfound} - Lastfound: #{lastfound}"
      #puts rounds.map { |r| r.join('') }.to_s
      #puts round
      #puts rounds[40].join('')
      break
    else
      rounds << round
    end
  end
  if lastfound.nil?
    puts 'Holy Crap!'
    puts rounds[-1]
    exit 0
  end

  whereincycle = (1_000_000_000 - firstfound) % (lastfound - firstfound)
  rounds[firstfound + whereincycle]
end

#puts (question16a 's1,x3/4,pe/b').join('')
puts (question16a(DANCERS, File.read('./16.txt'))).join('')
puts question16b().join('')
