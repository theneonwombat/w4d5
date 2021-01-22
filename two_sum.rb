
# def bad_two_sum?(arr, target)

#     arr.each_with_index do |ele1,idx1|
#         arr.each_with_index do |ele2, idx2|

#         end
#     end
# end


def okay_two_sum?(arr, target)
    arr.sort! # O(n*log(n))
    arr.each_with_index do |ele, i| #O(n)
        new_target = target - ele #O(1)
        # new_array = arr[0...i]+ arr[i+1..-1] #O(n)
        
        found? = bsearch(arr, new_target)  
        return true if found?
    end
    false
end

def bsearch(arr, target)

    mid  = arr.length/2   #O(1)
    return true if arr[mid] == target   #O(1)
    return false if arr.empty?      #O(1)
    
    left = arr[0...mid]
    right = arr[mid+1..-1]
    if target < mid
        bsearch(left, target)
    else
        bsearch(right, target)
    end


end