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
# merge_two_lists
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
# Merge k Sorted Lists
# ******************************
def merge_k_lists(lists)
  newList = []
  lists.each do |i|
    while i != nil
      newList << i.val
      i = i.next
    end
  end
  newList.sort!
end

# ******************************
#  Next Permutation    
# ******************************
var nextPermutation = function(nums) {
    let idx = nums.length - 1
    // find an index where the descending order starts
    // e.g. nums = [1,2,3,6,5,4] the index is nums[3] = 6
    while (nums[idx] <= nums[idx-1]) idx--
    
    // swap the number before the descending order with the next large number
    // e.g. nums = [1,2,3,6,5,4], swap nums[2] = 3 <=> nums[5] = 4 to be [1,2,4,6,5,3]
    let left = idx - 1,
        right = nums.length -1
    while (nums[left] >= nums[right]) right--
    if (left >= 0 && right >= 0) {
        ;[nums[left], nums[right]] = [nums[right], nums[left]]
    }

    // reverse the rest numbers
    // e.g. nums = [1,2,3,6,5,4] after swapping is [1,2,4,6,5,3]
    // then reverse the rest numbers to be [1,2,4,3,5,6]
    left = idx,
    right = nums.length - 1
    while (left < right) {
        ;[nums[left], nums[right]] = [nums[right], nums[left]]
        left++
        right--
    }
};
# ******************************
# longest_valid_parentheses
# ******************************
def longest_valid_parentheses(s)
  stack = [-1]
  max = 0
  s.length.times do |i|
    top = stack.last
    if top!=-1 && s[top] =='(' && s[i] ==')'
      stack.pop
      max = [max, i-stack.last].max
    else
      stack << i
    end
  end
  max
end

p longest_valid_parentheses(")()())")

# ******************************
# Search in Rotated Sorted Array
# ******************************
def search(nums, target)
  nums.index(target) || -1
  
  # Or
  # nums.include?(target) ? nums.index(target) : -1
  
end
p search([[4,5,6,7,0,1,2], 4])

# ******************************
# Find First and Last Position of Element in Sorted Array
# ******************************
def search_range(nums, target)
  res = []
  if nums.include?(target)
      res << nums.index(target)
      res << nums.rindex(target)
  else
      return [-1,-1]
  end
end

# ******************************
# Combination Sum
# ******************************
def combination_sum(candidates, target)
  candidates.sort!
  comb = []
  results = []
  find_comb_sum(results, comb, candidates, target, 0)
  return results
end

def find_comb_sum(results, comb, candidates, target, startIndex)
  if target == 0
    return (results << comb.dup)
  end
  for i in startIndex...candidates.length
    if(candidates[i] > target)
      return;
    end

    comb << candidates[i]
    find_comb_sum(results, comb, candidates, target - candidates[i], i)
    comb.pop

  end
end

# ******************************
# Trapping Rain Water
# ******************************
def trap(heights)   
  return 0 if heights.empty?
  
  tallest_x = tallest_between(heights, 0, heights.length-1)
  trap_left(heights, 0, tallest_x) + trap_right(heights, tallest_x, heights.length-1)
end

def trap_left(heights, a, b)
  return 0 if a == b || a + 1 == b
  tallest_x = tallest_between(heights, a, b-1)
  volume_between(heights, tallest_x, b) + trap_left(heights, a, tallest_x)
end

def trap_right(heights, a, b)
  return 0 if a == b || a + 1 == b
  tallest_x = tallest_between(heights, a+1, b)
  volume_between(heights, a, tallest_x) + trap_right(heights, tallest_x, b)
end

def volume_between(heights, a, b)
  height = [heights[b], heights[a]].min
  (a+1...b).reduce(0) do |acc, i|
      acc + height - heights[i]
  end
end

def tallest_between(heights, a, b)
  height = 0
  tallest_x = a
  (a..b).each do |x|
      next if heights[x] <= height
      height = heights[x]
      tallest_x = x
  end
  tallest_x
end

# ******************************
# Permutations
# ******************************
# The idea is to iterate through the nums array and tack on the 
# current element to each permutation of the surrounding elements.
def permute(nums)
  #permutation = perm; index = idx
  perm = []

  perm << [] if nums.empty?

  nums.each_with_index do |i, idx|
    perm_last = permute(nums[0...idx] + nums[idx+1..-1])
    perm_last.each do |j|
      perm << [i] + j
    end
  end
  perm
end
# ******************************
# Rotate Image
# ******************************
def rotate(matrix)
  matrix.replace(matrix.reverse.transpose)
end

p rotate([[1,2,3],[4,5,6],[7,8,9]])

# ******************************
# Group Anagrams
# ******************************
def group_anagrams(strs)
  # group chars
  # split and sort chars, so bca => abc
  return strs.group_by {|str| str.split('').sort }.values
end

# ******************************
# Maximum Subarray
# ******************************
def max_sub_array(arr)
  # equal pre and cur to be first index
  previous = current = arr[0]
  # loop over the arr and set pre to be the max of pre+cur_index and cur_index
  for i in 1...arr.length
      previous  = [previous + arr[i], arr[i]].max
  # set cur to be the max of all pre's and cur's
  current  = [previous, current].max
  end
  current
end
p max_sub_array([-2,1,-3,4,-1,2,1,-5,4])

# ******************************
# Jump Game 
# ******************************
def can_jump(nums)
  return true if nums.length < 2
  current = nums.length - 1
  distance = 0
  while current > 0
    current -= 1
    distance += 1
    if nums[current] >= distance
      distance = 0
    end
  end
  return distance == 0
end

p can_jump([2,3,1,1,4])

#--------------------------------------------------------------------------
function canJump(nums) {
  let max = nums[0];

  for (let i = 1; i < nums.length; i++) {
    if (max < i) return false;
    max = Math.max(nums[i] + i, max);
  }

  return true;
}
# ******************************
# Merge Intervals
# ******************************
def merge(intervals)
  # create an array
  res = []
  # if args is null or empty return the array
  return res if !intervals || intervals.empty?
  # sort arg
  intervals.sort!
  # loop over arg and create variable holding the last item in the array
  intervals.each do |i|
      last = res.last
  # push iterate into array if iterate is greater than last item in position 1
      if last.nil? || i[0] > last[1]
          res << i
      else
  # else set last item to iterate in position 1
    last[1] = i[1] if i[1] > last[1]
      end
  end
  res
end

# ******************************
# Unique Path
# ******************************
var uniquePaths = function(m, n) {
    if(m === 1 || n === 1) return 1;
    if(m < n) return  uniquePaths(n, m);
    let arr = Array.from({length: n}, (a,b) => 1);
    for(let i = 1; i < m; i++){
        for(let j = 1; j < n ; j++){
            arr[j] += arr[j - 1];
        }
    }
    return arr[n - 1];
};

#------------------------------------------------
def unique_paths(m, n)
  # https://apidock.com/ruby/Enumerable/inject
  (m..m+n-2).inject(1, :*) / (1...n).inject(1, :*)
end

# ******************************
# Climb Stairs
# ******************************
def climb_stairs(n)
  return 0 if n == 0
  return 1 if n == 1
  return 2 if n == 2
  i,j = 1,2
  (n-3).times do
      temp = i
      i = j
      j = i + temp
  end
  i + j
  
end
# -----------------------------------------------
var climbStairs = (n) => {
    if(n <= 2) return n
    let first  = 1
    let second = 2
    let result = 0
    
    for(let i = 3; i <= n ; i ++) {
        result = first + second
        first = second
        second = result
    }
    return result
}
# ******************************
# Minimum Path Sum
# ******************************
  # m and n represent number of columns and rows
  # Does modify original grid
  # row length = grid.length
  # col length = grid.first.length

var minPathSum = (grid) => {
    for (let i = 0; i < grid.length; i++) {
        for (let j = 0; j < grid[0].length; j++) {
            
            if (i === 0 && j === 0) continue
            
            const row = j - 1 >= 0 ? grid[i][j - 1] : Infinity;
            const col = i - 1 >= 0 ? grid[i - 1][j] : Infinity;    
            
            grid[i][j] = Math.min(row + grid[i][j], col + grid[i][j]);
        }
    }
    return grid[grid.length - 1][grid[0].length - 1];
};

# -------------------------------------------------

def min_path_sum(grid)
  
  (0...grid.length).each do |i|
    (0...grid[0].length).each do |j|
      next if (i == 0) && (j == 0)
      
      row_val = (i - 1) < 0 ? grid[i][j-1] : grid[i-1][j]
      col_val = (j - 1) < 0 ? grid[i-1][j] : grid[i][j-1]
      
      grid[i][j] += [row_val, col_val].min    
    end
  end
  
  grid.last.last
end

# ******************************
# Edit Distance
# ******************************
const minDistance = (A, B) => {
  const a = A.length
  const b = B.length

  const newArr = [...Array(a)].map(() => Array(b).fill(-1))

  const prefixDist = (i, j) => {
    if (i < 0) return j + 1
    if (j < 0) return i + 1

    if (newArr[i][j] === -1) {
      if (A[i] === B[j]) {
        newArr[i][j] = prefixDist(i - 1, j - 1)
      } else {
        newArr[i][j] = 1 + Math.min(
          prefixDist(i - 1, j - 1), // replace
          prefixDist(i, j - 1), // insert 
          prefixDist(i - 1, j) // delete
        )
      }
    }

    return newArr[i][j]
  }

  return prefixDist(a - 1, b - 1)
}

#------------------------------------------------------

def min_distance(word1, word2)
  # created new nested arrays
  newArr = Array.new(word1.size + 1) { Array.new(word2.size + 1) }
  
  # loop over the 1st array created with row
  for i in 0...newArr.size
     newArr[i][0] = i 
  end
  
  # loop over the array with col
  for j in 0...newArr[0].size
      newArr[0][j] = j
  end
  
  # loop over both arrays - useing nested loop
  for i in 1...newArr.size
      for j in 1...newArr[0].size
          
          # check 
          if word1[i - 1] == word2[j - 1]
              puts ([j-1]);
              newArr[i][j] = newArr[i-1][j-1]
          else
              newArr[i][j] = [
                  newArr[i - 1][j],
                  newArr[i][j - 1],
                  newArr[i - 1][j - 1],
              ].min + 1
          end
      end
  end
  
  newArr[-1][-1]
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