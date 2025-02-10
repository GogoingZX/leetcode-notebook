"""
- Link: https://leetcode.com/problems/boats-to-save-people/description/?envType=problem-list-v2&envId=r2gtb4om

- Question:
    You are given an array people where people[i] is the weight of the ith person,
    and an infinite number of boats where each boat can carry a maximum weight of limit.
    Each boat carries at most two people at the same time,
    provided the sum of the weight of those people is at most limit.
    Return the minimum number of boats to carry every given person.

- Example 1:
    Input: people = [3,2,2,1], limit = 3
    Output: 3
    Explanation: 3 boats (1, 2), (2) and (3)
"""

def num_rescure_boats(
    people: list[int],
    limit: int
) -> int:
    people.sort()
    people_num = len(people)

    count = 0
    left_side_pointer = 0
    right_side_pointer = people_num - 1
    while left_side_pointer <= right_side_pointer:
        if people[left_side_pointer] + people[right_side_pointer] <= limit:
            left_side_pointer += 1
            right_side_pointer -= 1
        else:
            right_side_pointer -= 1
        
        count += 1
    
    return count