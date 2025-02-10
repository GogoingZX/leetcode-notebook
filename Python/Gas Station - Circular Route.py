"""
https://leetcode.com/problems/gas-station/

There are n gas stations along a circular route, where the amount of gas at the ith station is gas[i].
You have a car with an unlimited gas tank and it costs cost[i] of gas to travel from the ith station to its next (i + 1)th station.
You begin the journey with an empty tank at one of the gas stations.

Given two integer arrays gas and cost,
return the starting gas station's index if you can travel around the circuit once in the clockwise direction,
otherwise return -1.
If there exists a solution, it is guaranteed to be unique
"""

def find_station(
    gas: list[int],
    cost: list[int]
):
    if sum(gas) < sum(cost):
        return -1
    
    size = len(gas)
    balance = [gas[i] - cost[i] for i in range(size)]
    tank = 0
    station = 0
    for i in range(size):
        tank += balance[i]
        if tank < 0:
            station = i + 1
            tank = 0
    
    return station