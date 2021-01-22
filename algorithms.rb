require "byebug"

list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
# my_min(list)  # =>  -5

# Phase I

# First, write a function that compares each element to every other element of the list. Return the element if all other elements in the array are larger.
# What is the time complexity for this function?

def my_min(list)
  list.each_with_index do |ele, i|
    num = ele
    if list.all? { |l| num <= l }
      return num
    end
  end
end

p my_min(list)

# Phase II

# Now rewrite the function to iterate through the list just once while keeping track of the minimum. What is the time complexity?

def my_min2(list)
  min = list.first
  list.each do |e|
    if e < min
      min = e
    end
  end
  min
end

p my_min2(list)

# list = [5, 3, -7]
#     largest_contiguous_subsum(list) # => 8

#     # possible sub-sums
#     [5]           # => 5
#     [5, 3]        # => 8 --> we want this one
#     [5, 3, -7]    # => 1
#     [3]           # => 3
#     [3, -7]       # => -4
#     [-7]          # => -7

def largest_contiguous_subsum(list)
  sub_arr_arr = []
  (0...list.length).each do |i|
    (i...list.length).each do |j|
      sub_arr_arr << list [i..j]
    end
  end
  sum_arr = sub_arr_arr.map { |e| e.sum }
  sum_arr.max
end


p largest_contiguous_subsum(other_list1)

# Keep a running tally of the largest sum. 
# To accomplish this efficient space complexity, consider using two variables. 
# One variable should track the largest sum so far 
# and another to track the current sum.

def largest_contiguous_subsum2(other_list)
  largest = other_list.first
  other_list.inject do |current, ele|
    # debugger
    current = current + ele
    if current > largest
      largest = current
    else
      what = current - largest
      if what > largest
        largest = what
      end
      current
    end
  end
  largest
end

other_list1 = [2, 3, -6, 7, -6, 7] # 8
other_list2 = [5, 3, -7] # 8
other_list3 = [-5, -1, -3] # -1

p largest_contiguous_subsum2(other_list1)
p largest_contiguous_subsum2(other_list2)
p largest_contiguous_subsum2(other_list3)
