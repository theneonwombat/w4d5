require 'byebug'

def first_anagram?(str1,str2) #O(n!) due to permution
    possible_anas = str1.split("").permutation.to_a
    possible_anas.map! { |ws| ws.join }
    possible_anas.include?(str2)
end

p first_anagram?("gismo", "sally")
puts
p first_anagram?("lives", "elvis")

def second_anagram?(str1, str2) # O(n^2)
    return false unless str1.length == str2.length # O(1)

    str1.each_char do |char| # O(n)
        idx = str2.index(char) # O(n)
        if idx == nil
            return false
        else
            str2 = str2[0...idx] + str2[idx+1..-1] # O(n) 
        end
    end
    true
end

puts
p second_anagram?("gismo", "sally")
puts
p second_anagram?("lives", "elvis")


def third_anagram?(str1,str2)# O(n*log(n)) due to Array#sort
    str1.chars.sort.join.downcase == str2.chars.sort.join.downcase
end

puts
p third_anagram?("gismo", "sally")
puts
p third_anagram?("lives", "elvis")



def fourth_anagram?(str1,str2)  #O(n), each_char is dominant, everything else is constant
    hash1 = Hash.new(0)  #constant
    hash2 = Hash.new(0)  #constant

    str1.each_char do |char|  # O(n)
        hash1[char]+=1  #both O(1)
    end
    str2.each_char do |char|   #O(n)
        hash2[char]+=1  #both O(1)
    end

    hash1 == hash2  # O(1)
end