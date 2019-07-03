# ******************************
# Two Sum 
# ******************************
def two_sum(nums, target)
    # hash = {}
    # nums.each_with_index do |i, index|
    #     secondIdx = hash[target - i]
    #     unless secondIdx.nil?
    #         if secondIdx != index
    #             return [secondIdx, index]
    #         end
    #     end
    #     hash[i] = index
    # end

#---------------------------------------------

    for i in 0..(nums.length - 1)
        for j in (i+1)..(nums.length)
            if (nums[i] + nums[j]) == target 
                return [i, j]
            end
        end
    end
end

# ******************************
# container with most water
# ******************************
def max_area(height)
    max = 0
    i = 0
    j = height.length - 1
    
  while i < j
    area = (j - i) * [height[i], height[j]].min
    max = [max, area].max
    height[i] > height[j] ? j -= 1 : i += 1
  end
  max
end

# ******************************
# Add Two Numbers
# ******************************
def add_two_numbers(l1, l2)
  dummy = current = ListNode.new(0)
  carry = 0
  while l1 || l2 || carry > 0
      if l1
          carry += l1.val
          l1 = l1.next
      end
      if l2
          carry += l2.val
          l2 = l2.next
      end
      current.next = ListNode.new(carry % 10)
      current = current.next
      carry = (carry / 10).floor
  end
  dummy.next
end

# ******************************
# Longest Substring Without Repeating Characters
# ******************************
def length_of_longest_substring(s)
  # s.chars.uniq.count { |char| s.count(char) > 1 }
  
  stack = []
  high_count = 0
  s.each_char do |i|
      unless index = stack.index(i)
          stack.push(i)
      else
          stack.push(i)
          (index + 1).times {stack.shift}
      end
      high_count = stack.length if stack.length > high_count
  end
  high_count
end
# ******************************
# Median of Two Sorted Arrays
# ******************************
def find_median_sorted_arrays(nums1, nums2)
  combined_arr = []
  while !nums1.empty? && !nums2.empty?
      if nums1[0] <= nums2[0]
          combined_arr << nums1.shift
      else
          combined_arr << nums2.shift
      end
  end
  done = nums1.length <= nums2.length ? 1 : 2
  if done == 1
      combined_arr += nums2
  else
      combined_arr += nums1
  end
  median(combined_arr)
end


def median(combined_arr)
  l = combined_arr.length - 1
  half_i = l / 2
  if l % 2 == 0 
      combined_arr[half_i]
  else 
      (combined_arr[half_i] + combined_arr[half_i + 1]) / 2.0  
  end
end
# ******************************
# Longest Palindromic Substring
# ******************************
def longest_palindrome(s)
  r_s = s.reverse
  c_lists = {}
  index = 0
  answer = ''
  s.each_char do |c|
      c_lists[c] ||= []
      c_lists[c] << index
      c_lists[c].each do |i|
          if s[i..index] == r_s[(-index - 1)..(-i -1)] && answer.size < index - i + 1
              answer = s[i..index]
              break
          end
      end
      index += 1
  end
  return answer
end

# ******************************
# Regular Expression Matching
# ******************************
def is_match(s, p)
  # s =~ /(#{p})/ 
  # $1 == s ? true : false
  
  return s.empty? if p.empty?
  match1 = [s[0], '.'].include?(!s.empty? && p[0])
  
  if p.length > 1 && p[1] == '*'
      return is_match(s,p[2..-1]) || (match1 && is_match(s[1..-1], p))
  else
      return match1 && is_match(s[1..-1], p[1..-1])
  end
  
end
# ******************************
# 3 Sum
# ******************************
def three_sum(nums)
  nums.sort!
  result = []
  (0..(nums.length-3)).each do |a|
      b = a + 1
      c = nums.length - 1
      while(b < c) do
          target = 0 - (nums[a] + nums[b])
          if nums[c] < target
              break
          elsif nums[c] > target
              c -= 1
          else
              result << [nums[a], nums[b], nums[c]]
              b += 1
              c -= 1
          end
      end
  end
  result
end
# ******************************
# Letter Combinations of a Phone Number
# ******************************
def letter_combinations(digits)
  return [] if digits.empty?
  letters = ['','','abc','def','ghi','jkl','mno','pqrs','tuv','wxyz']
  result = ['']
  (0..digits.size-1).each do |i|
    comb = []
    result.each do |j|
      letters[digits[i].to_i].chars.each do |k|
        comb << j + k
      end
    end
    result = comb
  end
  result
end
# ******************************
# Remove Nth Node From End of List
# ******************************
def remove_nth_from_end(head, n)
  return nil unless head.next
  count = 0
  h, p = head, head
  while h
    p = p.next if count > n
    h = h.next
    count += 1
  end
  return head.next if count == n
  p.next = p.next.next
  head
end
# ******************************
# valid parentheses
# ******************************
def is_valid(s)
  return true if s.empty?
  stack = []
  hash = { '}' => '{', ']' => '[', ')' => '(' }
  s.split("").each do |i|
      if hash.values.include?(i)
          stack << i
      else
          return false if stack.pop != hash[i]
      end
  end
  stack.empty?
end

p is_valid("{{[]()[")

# ******************************
# 
# ******************************
def merge_two_lists(l1, l2)
    
  return l1 if not l2
  return l2 if not l1
    
  l1,l2 = l2, l1 if l1.val > l2.val
  l1.next=merge_two_lists(l1.next,l2)
  l1
end

p merge_two_lists(1->2->4, 1->3->4)
# ******************************
# Generate Parentheses   
# ******************************
def generate_parenthesis(n)
  recursive(n, 0, 0, "",[])
end

def recursive(n,j,k,hold,result)
  #push hold to result if k+j == 2*n
  result << hold if j + k == 2 * n

  recursive(n, j+1, k, hold + "(", result) if j < n
  recursive(n, j, k+1, hold + ")", result) if k < j

  result
end
    
# ******************************
# 
# ******************************

# ******************************
# 
# ******************************

# ******************************
# 
# ******************************

# ******************************
# 
# ******************************

# ******************************
# 
# ******************************

# ******************************
# 
# ******************************

# ******************************
# 
# ******************************

# ******************************
# 
# ******************************

# ******************************
# 
# ******************************

# ******************************
# 
# ******************************

# ******************************
# 
# ******************************

# ******************************
# 
# ******************************

# ******************************
# 
# ******************************

# ******************************
# 
# ******************************

# ******************************
# 
# ******************************

# ******************************
# 
# ******************************

# ******************************
# 
# ******************************

# ******************************
# 
# ******************************

# ******************************
# 
# ******************************

# ******************************
# 
# ******************************

# ******************************
# 
# ******************************

# ******************************
# 
# ******************************

# ******************************
# 
# ******************************

# ******************************
# 
# ******************************

# ******************************
# 
# ******************************

# ******************************
# 
# ******************************

# ******************************
# 
# ******************************

# ******************************
# 
# ******************************

# ******************************
# 
# ******************************

# ******************************
# 
# ******************************

# ******************************
# 
# ******************************

# ******************************
# 
# ******************************

# ******************************
# 
# ******************************

# ******************************
# 
# ******************************

# ******************************
# 
# ******************************