# frozen_string_literal: true

# Part 1
def sum(arr)
  total = 0
  for i in arr do
    total += i
  end
  total
end

def max_2_sum(arr)
  if arr.length() > 1 then
    max1 = arr[0]
    max1_pos = 0
    current_pos = 0
    for i in arr do
      if i > max1 then 
        max1 = i
        max1_pos = current_pos  
      end
      current_pos = current_pos + 1
    end
    arr.delete_at(max1_pos)

    max2 = arr[0]
    max2_pos = 0
    current_pos = 0
    for i in arr do
      if i > max2 then
        max2 = i
        max2_pos = current_pos  
      end
      current_pos += 1
    end
    max1+max2
  elsif arr.length == 1 then
    arr[0]
  else 
    0
  end
end

def sum_to_n?(arr, number)
  if arr.length <= 1 then
    false
  else 
    subs = {}
    for i in arr do
      subs.merge!({i => number - i})
    end

    num_found = false
    subs.each do |key,value|
      sub_less = subs
      sub_less.delete(key)
      if sub_less.key?(value) then
        num_found = true
        break
      end
    end
    num_found
  end
end

# Part 2
def hello(name)
  "Hello, #{name}"
end

def starts_with_consonant?(string)
  vowels = {'a' => 1,'e'=> 1,'i'=> 1,'o'=> 1,'u'=> 1}
  ret_val = false
  if string.length > 0 && string[0].downcase.match(/[a-z]/) then
    if !(vowels.assoc(string[0].downcase)) then
      ret_val = true
    end
  end
  ret_val
end

def binary_multiple_of_4?(string)
  string_arr = string.split(//)
  for i in string_arr do
    if i != '0' && i != '1' then
      return false
    end
  end 

  len = string_arr.length()
  if string_arr[len-1] == "0" && string_arr[len-1] == "0" then
    return true
  end
end

# Part 3
# Object representing a book
class BookInStock
  attr_accessor :isbn
  attr_accessor :price

  def initialize(isbn,price)
    if isbn.length == 0 then
      raise ArgumentError.new("ISBN cannot be an empty string")
    end
    if price <= 0 then
      raise ArgumentError.new("Price cannot be less <= 0")
    end
    @isbn = isbn
    @price= price
  end

  def price_as_string()
    return "$#{'%.2f' % @price}"  
  end
end
