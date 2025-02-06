"""
- Link: https://leetcode.com/problems/rotate-array/description/?envType=study-plan-v2&envId=top-interview-150
Given an integer array nums, rotate the array to the right by k steps, where k is non-negative.

- Example 1:
    - Input: nums = [1,2,3,4,5,6,7], k = 3
    - Output: [5,6,7,1,2,3,4]
    - Explanation:
        rotate 1 steps to the right: [7,1,2,3,4,5,6]
        rotate 2 steps to the right: [6,7,1,2,3,4,5]
        rotate 3 steps to the right: [5,6,7,1,2,3,4]
    - What if k = 10?
"""

def rotate(
    nums: list[int],
    k: int
) -> None:
    size = len(nums)
    new_k = k % size
    while new_k > 0:
        popup = nums.pop()
        nums.insert(0, popup)
        new_k -= 1
    return None
