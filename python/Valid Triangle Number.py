"""
Given an integer array nums,
return the number of triplets chosen from the array that can make triangles if we take them as side lengths of a triangle.

Constraints:
    1 <= nums.length <= 1000
    0 <= nums[i] <= 1000
"""

def get_valid_triangle_num(
    nums: list[int]
) -> int:
    """
    Theorem: In a triangle, the length of any side is less than the sum of the other two sides.
    i.e. a+b>c and a+c>b and b+c>a
    Simplified, let c presents the maximum side among 3 sides a, b, c, => c >= a & c >= b
    so that if a+b>c then it's must be a valid triangle
    """

    nums.sort()
    n = len(nums)
    count = 0
    for k in range(2, n):
        i = 0
        j = k-1
        while i < j:
            if nums[i] + nums[j] > nums[k]:
                count += j-i
                j -= 1
            else:
                i += 1
    
    return count
    # Time; O(N^2), where N is number of elements in the array nums
    # Space: O(sorting)
