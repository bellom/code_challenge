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
# Sort Color
# ******************************


#----------------------------------------

var sortColors = function(nums) {
    var i = 0;
    var newArr = [];
    
    while (i < nums.length) {
        switch(nums[i]) {
            case 0:
                newArr.unshift(...nums.splice(i, 1));
                break;
            case 1:
                newArr.push(...nums.splice(i, 1));
                break;
            default:
                i++;
                break;
        }
    }
    
    nums.unshift(...newArr);
};

# ******************************
# minimum window substring
# ******************************
function minWindow(s, t) {
    var ans = '';
    
    var map = {};
    t.split('').forEach(ch => map[ch] = (map[ch] || 0) + 1);
    var count = Object.keys(map).length;
    
    var l = 0;
    var r = -1;
    
    while (r < s.length) {
        if (count === 0) {
            if (!ans || r - l + 1 < ans.length) ans = s.slice(l, r + 1);
            if (map[s[l]] !== undefined) map[s[l]]++;
            if (map[s[l]] > 0) count++;
            l++;
        } else {
            r++;
            if (map[s[r]] !== undefined) map[s[r]]--;
            if (map[s[r]] === 0) count--;
        }
    }
    return ans;
}
# ******************************
# Subsets
# ******************************
var subsets = function(nums) {
    let res = [[]]
    
    for(let i = 0; i < nums.length; i++){
        let length = res.length;
        for (let j = 0; j < length; j++){
            res.push([...res[j], nums[i]]);
        }
    }
    return res
};
# ******************************
# word search 
# ******************************
def exist(board, word)
  board.each_with_index do |row, i|
    row.each_with_index do |cell, j|
      return true if dfs(board, i, j, word)
    end
  end
  false
end

def dfs(board, row, col, word)
  return true if word.length == 0

  if row < 0 || row >= board.length || col < 0 || col >= board[0].length || board[row][col] != word[0]
    return false
  end

  temp = board[row][col]
  board[row][col] = ''

  result = dfs(board, row + 1, col, word[1..-1]) ||
           dfs(board, row - 1, col, word[1..-1]) ||
           dfs(board, row, col + 1, word[1..-1]) ||
           dfs(board, row, col - 1, word[1..-1])

  board[row][col] = temp

  return result
end

# ******************************
# Largest Rectangle in Histogram
# ******************************
var largestRectangleArea = function(heights) {
    let maxArea = 0;
    let currArea = 0;
    
    for (let i = 0; i < heights.length; i++) {
        let l = i-1;                          
        let r = i+1;
    
        let currHeight = heights[i];
        
        // Since we are comparing out from the current element
        // elements of the same height as the current element 
        // will have the same max area rectangle.
        if (heights[r] === currHeight) continue;
        
        currArea = currHeight;
        
        // Check all bars to the left that are at least as tall.
        while (l >= 0 && heights[l] >= currHeight) {
            currArea += currHeight;
            l--;
        }
        
        // Check all bars to the right that are at least as tall.
        while (r < heights.length && heights[r] >= currHeight) {
            currArea += currHeight;
            r++;
        }
        
        maxArea = Math.max(currArea, maxArea);
        currArea = 0;
    }
    
    return maxArea;
};
# ******************************
# Maximal Rectangle
# ******************************
var maximalRectangle = function (matrix) {
    const n = matrix.length;
    if (n === 0) return 0;
    const m = matrix[0].length;
    console.log(m);

    const h = new Array(n).fill(0);

    let max = 0;
    for (let j = 0; j < m; j++) {
        for (let i = 0; i < n; i++) {
            if (matrix[i][j] === '1') h[i]++;
            else h[i] = 0;
        }
        for (let i = 0; i < n; i++) {
            let k1 = i - 1;
            while (k1 >= 0 && h[i] <= h[k1]) k1--;
            let k2 = i + 1;
            while (k2 < n && h[i] <= h[k2]) k2++;
            max = Math.max(max, h[i] * (k2 - k1 - 1));
        }
    }
    return max;
}
# ******************************
# Binary Tree Inorder Traversal
# ******************************
# https://learn.freecodecamp.org/javascript-algorithms-and-data-structures/basic-data-structures/combine-arrays-with-the-spread-operator
# ******************************
var inorderTraversal = function(root) {
  if(!root) return [];
  return[...inorderTraversal(root.left), root.val, ...inorderTraversal(root.right)];
};

var inorderTraversal = function(root) {
  let result = []
  let stack = []
  while(root !== null || stack.length !== 0) {
    while (root) {
      stack.push(root)
      root = root.left
    }
    root = stack.pop()
    result.push(root.val)
    root = root.right
  }
  return result
};

# ******************************
# Unique Binary Search Trees
# ******************************
# DP solution in Javascript
# The idea is to look at what you pick as the root and look as its left and right children's number in the arr created

var numTrees = function(n) {
if (n === 1) {
        return 1; 
    }
    # size of n
    let arr = [1,1]; 
    
    for (let i = 1; i< n; i++){
        # first iteration 
        let numNodes = i + 1;
        let result = 0;
        for (let j = 0; j < numNodes; j++){
          # number of nodes to the left 
            let numLeft = j; 
            # number of stuff to the right 
            let numRight = numNodes - (j+1); 
            result = result + (arr[numLeft] * arr[numRight]);
        }
        arr[i + 1] = result;
    }
    return arr[n];
};

# ******************************
# Best Time to Buy and Sell Stock
# ******************************
# We are tryting to find the max of "Profit = Max - Min".
# Because we can only sell stocks after we bought them, this problem is one-directional, which means Max is always somwhere right to the Min.

# When our Min value is set, we traverse through the array and keep comparing (array[i]-Min) and previous Profit, and set Profit to whichever is larger.

# We replace the previous Min when we found a new Min that is lower than it.
# Because the problem is one-directional, we don't need to go back and worry about the past, just keep traversing, comparing, and updating the Profit.

var maxProfit = function(prices) {
    
  let min = prices[0];
  let max = 0;
    
    prices.forEach(i => {
        i < min ? min = i : max = Math.max(max, i - min)
    })
    return max;
};

# ******************************
# Longest Consecutive Sequence
# ******************************
# Save the nums into a Set, loop through nums and skip the ones which are in sequence but not the heads.
# For others they are the potential heads, we will try to figure out each of their sequences' length and update the max length.

var longestConsecutive = function(nums) {
    if(nums === null || nums.length === 0)
        return 0;
    
    let nums_set = new Set(nums);
    let count = 1, maxCount = 1;    
    for(let value of nums_set){
        if(nums_set.has(value - 1)){
            continue;
        }
        count = 1;
        let currentNum = value;
        
        while(nums_set.has(currentNum + 1)){
            count += 1;
            currentNum += 1;
        }
        maxCount = Math.max(count, maxCount);
       
    }
    
    return maxCount;
};

# ******************************
# Single Number
# ******************************
var singleNumber = function(nums) {
  nums.sort();
  
  for (var i = 0; i < nums.length; i += 2) {
      if (nums[i] != nums[i + 1]) {
          return nums[i];
      }
  }
};

# ******************************
# Word Break
# ******************************
var wordBreak = function(s, wordDict) {
  let arr = [];
  
  for (let i = 0; i < s.length; i++) {
    for (let j = 0; j <= i; j++) {
      if (j === i) {
        if (wordDict.indexOf(s.substring(0, i + 1)) !== -1) {
          arr[i] = true
          break
        }
      } else {
        if (arr[j] === true && wordDict.indexOf(s.substring(j + 1, i + 1)) !== -1) {
          arr[i] = true
          break
        }
      }
      arr[i] = false
    }
  }
  return arr[s.length - 1]
};

# ******************************
# Linked List Cycle
# ******************************
var hasCycle = function(head) {
    
    # //Check empty conditions
    if(!head){
        return false;
    }
    
  #  /*Create a hashMap to check if the key(node.next) 
  #     exists then return true*/
    
    let map = new Map();
    let node = head;
    
    while (node) {        
        if (!node.next){
            return false;
        } else if (map.has(node.next)) {
            return true;
        } else{
            map.set (node.next, node.val);
            node = node.next;
        }
    }   
};


# ***********************************************************

var hasCycle = function(head) {
    try{
       JSON.stringify(head) ;
    }catch(e){
        return true;
    };
    return false;
};


# ******************************
# Linked List Cycle II
# ******************************
function detectCycle(head) {
  if (!head || !head.next || !head.next.next) return null

  # // set `slow` and `fast` to their next tick, since we already know they
  # // both start with `head`.
  let slow = head.next
  let fast = head.next.next

  # // while `slow` and `fast` are NOT the same node, advance `slow` by a node and
  # // `fast` by two nodes.
  while (slow !== fast) {
    slow = slow.next
    # // if `fast.next` or `fast.next.next` does NOT exist, it's not a cycle.
    if (!fast.next || !fast.next.next) return null
    fast = fast.next.next
  }

  # // At this point, `slow` and `fast` are the same node

  # // Now we want to find the beginning of the cycle

  # // Move `fast` to the starting point (head)
  fast = head

  # // While `slow` and `fast` are NOT the same node, advance both by a node until
  # // they meet at the same node
  while (fast !== slow) {
    fast = fast.next
    slow = slow.next
  }

  # // At this point, `slow` and `fast` have met at the beginning of the cycle

  # // We return the beginning of the cycle
  return fast
}
# ******************************
# Sort List
# ******************************
var sortList = function(head) {
  if (head === null || head.next === null) return head;
  let firstHead = head;
  let curHead = head.next
  let lastHead = null;

  head.next = null;
  while (curHead !== null) {
    let next = curHead.next;
    if (curHead.val < head.val){
      curHead.next = firstHead;
      firstHead = curHead;
    } else {
      curHead.next = lastHead;
      lastHead = curHead;
    }
    curHead = next;
  }
  let res = sortList(firstHead);
  head.next = sortList(lastHead);
  return res;
};

# ******************************
# Maximum Product Subarray    
# ******************************
var maxProduct = function(nums) {
    let res = nums[0], min = nums[0], max = nums[0];
    
    for (let i = 1; i < nums.length; i++){
        min *= nums[i];
        max *= nums[i];
        
        if(nums[i] < 0){
            let swap = max;
            max = min;
            min = swap;
        }
        
        max = Math.max(max, nums[i]);
        min = Math.min(min, nums[i]);
        res = Math.max(res, max);
    }
    return res;
};

# ******************************
# Binary Tree Maximum Path Sum
# ******************************
var maxPathSum = function(root) {

  var max = Number.NEGATIVE_INFINITY;
 
  function getMaxSum(node) {
    if (!node) return 0;
    var leftSum = getMaxSum(node.left);
    var rightSum = getMaxSum(node.right);
    
    # // if Node by itself in big then children + Node
    let max_single = Math.max(Math.max(leftSum,rightSum)+node.val, node.val);
    
    # // if the Node is the root node in the path
    let max_top = Math.max(max_single,leftSum+rightSum+node.val);
    
    # // Store Maximum result 
    max = Math.max(max, max_top);
    
    return max_single;
  }

  getMaxSum(root);
  return max ;
  
};

# ******************************
# Symmetric Tree
# ******************************
var isSymmetric = function(root) {
    return isMirror(root, root);
};

function isMirror(root1, root2){
    if(!root1 && !root2) return true;

    if(root1 && root2){
        if(root1.val === root2.val){
            return isMirror(root1.left, root2.right) && isMirror(root1.right, root2.left)
        }
    }
    return false;
}
# ******************************
# Intersection of Two Linked Lists
# ******************************
var getIntersectionNode = function(headA, headB) {
    let a = headA, b = headB;
    
    while(a != b){
        a = a? a.next : headB;
        b = b? b.next : headA;
    }
    return a;
};

# ******************************
# House Robber
# ******************************
const rob = nums => {
  let j = 0,
    k = 0;

  for (let i = 0; i < nums.length; i++) {
    if (i % 2 == 0) {
      (j = Math.max(j + nums[i])), k;
    } else {
      k = Math.max(j, k + nums[i]);
    }
  }
  return Math.max(j, k);
};

# ******************************
# Majority Element
# ******************************
var majorityElement = function(nums) {
    nums.sort();
    let i = Math.floor((nums.length -1)/2);
    return nums[i];
};
# ******************************
# reverse linked list
# ******************************
var reverseList = function(head) {
    let prev = null;
  
    while(head){
        [head.next, head, prev] = [prev, head.next, head]
    }
    return prev;
};

# **********************************************************

var reverseList = function(head) {
    let prev = null;
    while (head) {
        const next = head.next;
        const curr = head;
        curr.next = prev;
        head = next;
        prev = curr;
    }
    
    return prev;
};
# ******************************
# Min Stack
# ******************************
var MinStack = function() {
    this.arr = [];
};

/** 
 * @param {number} x
 * @return {void}
 */
MinStack.prototype.push = function(x) {
    return this.arr.push(x);
};

/**
 * @return {void}
 */
MinStack.prototype.pop = function() {
    return this.arr.pop();
};

/**
 * @return {number}
 */
MinStack.prototype.top = function() {
    return this.arr.slice(-1);
};

/**
 * @return {number}
 */
MinStack.prototype.getMin = function() {
    return Math.min(...this.arr);
};

# ******************************
# Find the kth largest element
# ******************************
var findKthLargest = function(nums, k) {
    nums.sort((a,b) => { return a - b });
    
    let pos = nums.length - k;
    return nums[pos];
        
};
 
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