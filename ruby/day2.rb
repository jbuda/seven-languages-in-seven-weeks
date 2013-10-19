# print the contents of an array of sixteen numbers, fours numbers at a times using each and each_slice

# using each

values = []
[*(1..16)].each do |i|
  values.push(i)
  
  if (values.length == 4)
    puts values.join(",")
    values = []
  end
end

# using each_slice

[*(1..16)].each_slice(4) do |i|
  puts i.join(",")
end
