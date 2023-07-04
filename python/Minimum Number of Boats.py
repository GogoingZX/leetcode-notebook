"""
https://leetcode.com/problems/boats-to-save-people/

You are given an array people where people[i] is the weight of the ith person,
and an infinite number of boats where each boat can carry a maximum weight of limit.
Each boat carries at most two people at the same time,
provided the sum of the weight of those people is at most limit.

Return the minimum number of boats to carry every given person.
"""

def calculate_min_boats(
    people: list[int],
    limit: int
):
    size = len(people)
    people.sort()

    count = 0
    i = 0
    j = size - 1
    while i <= j:
        if people[i] + people[j] <= limit:
            i += 1
            j -= 1
        else:
            j -= 1
        count += 1
    
    return count
