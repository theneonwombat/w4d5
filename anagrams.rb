require 'byebug'

def first_anagram?(str1,str2) #O(n!) due to permution
    possible_anas = str1.split("").permutation.to_a
    possible_anas.map! { |ws| ws.join }
    possible_anas.include?(str2)
end

p first_anagram?("gismo", "sally")
puts
p first_anagram?("lives", "elvis")

def second_anagram?(str1, str2) # O(n)
    return false unless str1.length == str2.length # O(1)

    str1.each_char do |char| # O(n)
        idx = str2.index(char) # O(n)
        if idx == nil
            return false
        else
            str2 = str2[0...idx] + str2[idx+1..-1] # O(n) or O(1)???
        end
    end
    true
end

puts
p second_anagram?("gismo", "sally")
puts
p second_anagram?("lives", "elvis")