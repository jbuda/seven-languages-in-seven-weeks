# output "Hello world"

puts "Hello world"


# find the index of the world "Ruby"

str = "Hello, Ruby"
idx = str.index("Ruby")
puts "Index of 'Ruby' is : #{idx}"


# output name 10 times

10.times do
  puts "janusz"
end


# output sentence 10 times incrementing the iterator from 1-10

10.times do |idx|
  puts "This is the sentence number #{idx+1}"
end


# pick a number between 1 and 100 and try and get the correct answer

n = rand(100)
input = gets.chomp.to_i
while (input != n) do
  puts (input < n) ? "Too low" : "Too high"
  input = gets.chomp.to_i
end
puts "Correct! The answer was #{n}"
