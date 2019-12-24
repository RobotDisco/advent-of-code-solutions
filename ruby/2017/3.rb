input = 361527

def next_coord(lastcoord, lastdir)
  x = lastcoord[0]
  y = lastcoord[1]
  layer = [x.abs, y.abs].max
  
  if x.abs == y.abs
    if x > 0 && y < 0
      nextcoord = lastcoord.zip([1, 0]).map { |n| n[0] + n[1] }
      lastdir = [0, 1]
    elsif x > 0 && y > 0
      nextcoord = lastcoord.zip([-1, 0]).map { |n| n[0] + n[1] }
      lastdir = [-1, 0]
    elsif x < 0 && y > 0
      nextcoord = lastcoord.zip([0, -1]).map { |n| n[0] + n[1] }
      lastdir = [0, -1]
    else
      nextcoord = lastcoord.zip([1, 0]).map { |n| n[0] + n[1] }
      lastdir = [1, 0]
    end
  else
    nextcoord = lastcoord.zip(lastdir).map { |n| n[0] + n[1] }    
  end

  return [nextcoord, lastdir]
end

def compute_val(coord, grid)
  sum = 0

  [[-1, -1], [-1, 0], [-1, 1], [0, -1], [0, 1], [1, -1], [1, 0], [1,1]].each do |e|
    newcoord = coord.zip(e).map { |n| n[0] + n[1] }
    sum += grid[newcoord] if grid.has_key? newcoord
  end

  sum
end

def question3b input
  lastcoord = [1, 0]
  lastdir = [0,1]
  lastval = 1
  grid = {}
  grid[[0,0]] = 1
  grid[[1,0]] = 1

  until grid[lastcoord] > input
    val = next_coord(lastcoord, lastdir)
    lastcoord = val[0]
    lastdir = val[1]
    grid[lastcoord] = compute_val(lastcoord, grid)
    p grid[lastcoord]
  end
end

question3b input
