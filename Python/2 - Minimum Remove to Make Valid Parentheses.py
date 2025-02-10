"""
- Link: https://leetcode.com/problems/minimum-remove-to-make-valid-parentheses/description/?envType=company&envId=facebook&favoriteSlug=facebook-thirty-days

- Example 1:
    - Input: s = "lee(t(c)o)de)"
    - Output: "lee(t(c)o)de"
    - Explanation: "lee(t(co)de)" , "lee(t(c)ode)" would also be accepted.
- Example 2:
    - Input: s = "a)b(c)d"
    - Output: "ab(c)d"
- Example 3:
    - Input: s = "))(("
    - Output: ""
    - Explanation: An empty string is also valid.
"""

def min_remove_to_make_valid(s: str) -> str:
    string_list = [i for i in s]
    left_bracket_index, results = [], []
    for index, value in enumerate(string_list):
        if value == ')':
            if len(left_bracket_index) > 0:
                left_bracket_index.pop()
                results.append(value)
            else:
                results.append('')
                continue
        elif value == '(':
            left_bracket_index.append(index)
            results.append(value)
        else:
            results.append(value)

    if len(left_bracket_index) > 0:
        for i in left_bracket_index:
            results[i] = ''
    else:
        pass
    
    return ''.join(results)