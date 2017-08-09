//
//  LeetCode-16.swift
//  LeetCode-Swift
//
//  Created by junmo on 2017/8/8.
//

/*
 Given an array S of n integers, find three integers in S such that the sum is closest to a given number, target. Return the sum of the three integers. You may assume that each input would have exactly one solution.
 
 For example, given array S = {-1 2 1 -4}, and target = 1.
 
 The sum that is closest to the target is 2. (-1 + 2 + 1 = 2).
 */
import Foundation

class Solution16 {
    /* 最普通解法，遍历数组，时间复杂度O(n^3) */
    func threeSumClosest(_ nums: [Int], _ target: Int) -> Int {
        assert(nums.count >= 3)
        var closestVal : Int
        closestVal = nums[0] + nums[1] + nums[2]
        for i in 0...(nums.count-1) {
            for j in 0...(nums.count-1) {
                if (i == j) {
                    continue
                }
                for k in 0...(nums.count-1) {
                    if (i == k || j == k) {
                        continue
                    }
                    let sum = nums[i] + nums[j] + nums[k]
                    /* done */
                    if (sum == target) {
                        return sum;
                    }
                    if (abs(sum - target) < abs(closestVal - target)) {
                        closestVal = sum
                    }
                }
            }
        }
        return closestVal
    }
    
    func threeSumClosest2(_ nums: [Int], _ target: Int) -> Int {
        assert(nums.count >= 3)
        
        let sortedNums = nums.sorted()
        
        var closestVal : Int
        closestVal = sortedNums[0] + sortedNums[1] + sortedNums[2]
        for i in 0...(sortedNums.count - 2) {
            var j:Int  = i + 1
            var k:Int = sortedNums.count - 1
            while (j < k) {
                let sum = sortedNums[i] + sortedNums[j] + sortedNums[k]
                if (sum == target) {
                    return sum
                }
                if (abs(sum - target) < abs(closestVal - target)) {
                    closestVal = sum
                }
                (sum > target) ? (k -= 1) : (j += 1)
            }
        }
        return closestVal
    }
}
