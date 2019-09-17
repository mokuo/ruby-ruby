i = 0
while i < 100
  i = i + 1

  if i % 15 == 0
    print('FizzBuzz')
  elsif i % 3 == 0
    print('Fizz')
  elsif i % 5 == 0
    print('Buzz')
  else
    print(i)
  end
end
