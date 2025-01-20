"""
- Link: https://leetcode.com/problems/merge-sorted-array/?envType=study-plan-v2&envId=top-interview-150

- Example 1:
    Input: nums1 = [1,2,3,0,0,0], m = 3, nums2 = [2,5,6], n = 3
    Output: [1,2,2,3,5,6]
    Explanation:
        The arrays we are merging are [1,2,3] and [2,5,6].
        The result of the merge is [1,2,2,3,5,6] with the underlined elements coming from nums1.
"""

def merge(
    nums1: list[int],
    m: int,
    nums2: list[int],
    n: int
) -> None:
    count = 0
    nums1_index = 0
    for nums1_element in nums1[0:m]:
        nums2_index = 0
        for nums2_element in nums2:
            if nums1_element > nums2_element:
                nums1.insert(nums1_index, nums2_element)
                nums1.pop(-1)
                count += 1
                nums1_index = nums1_index + count
                
                nums2_index += 1
                nums2 = nums2[nums2_index:]
            else:
                break
        nums1_index += 1

    print(nums1, nums2)
    nums2_remaining = len(nums2)
    if nums2_remaining > 0:
        print(count, nums2_remaining)
        nums1 = nums1[0:m+count]
        nums1.extend(nums2)
    else:
        pass

    return None


# Follow up: Can you come up with an algorithm that runs in O(m + n) time?
def merge_v2(
    nums1: list[int],
    m: int,
    nums2: list[int],
    n: int
) -> None:
    nums1_index = m - 1 # note: here is the end of m instead of the end of nums1
    nums2_index = n - 1
    for i in range(m+n-1, -1, -1): # start from the end of the combined array
        if nums2_index < 0: # means nums2 is an empty list
            break # break the loop and do not need compare nums1 with nums2

        if nums1_index >= 0 and nums1[nums1_index] > nums2[nums2_index]:
            nums1[i] = nums1[nums1_index] # put the largest element in the end
            nums1[nums1_index] = 0 # reset the pointer as 0
            nums1_index -= 1
        else:
            nums1[i] = nums2[nums2_index]
            nums2_index -= 1

    return None

"""
- Complexity:
    - Time complexity: (O(m + n))
        Each element of nums1 and nums2 is processed exactly once during the merge.
    - Space complexity: (O(1))
        No additional data structures are used; merging is done in-place.
"""