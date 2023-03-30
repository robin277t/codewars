def next_bigger(n)
  array = n.to_s.chars.map(&:to_i)
  i = array.length - 2
  i -= 1 while i >= 0 && array[i] >= array[i+1]
  return -1 if i < 0
  j = array.length - 1
  j -= 1 while array[j] <= array[i]
  array[i], array[j] = array[j], array[i]
  array[i+1..-1] = array[i+1..-1].sort
  return array.join.to_i
end
