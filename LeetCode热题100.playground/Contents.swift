import UIKit

var str = "Hello, playground"

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        next = nil
    }
}
/// 两数相加
class Solution2 {
    // 反转链表
    func reverse(_ l: ListNode?) ->  ListNode? {
        if l?.next == nil {
            return l
        } else {
            let newL = reverse(l?.next)
            newL?.next?.next = newL
            newL?.next = nil
            return newL
        }
    }
    
    /// 时间复杂度 O(Max(m,n))，空间复杂度 O(Max(m,n))+1
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var l1 = l1
        var l2 = l2
        let l3 = ListNode(0) // 哑节点
        
        // 表示进位
        var i = 0
        var head: ListNode? = l3
        while l1 != nil || l2 != nil {
            let v = (l1?.val ?? 0) + (l2?.val ?? 0) + i
//            debugPrint("v: \(v)")
            i = v / 10
            let j = v % 10
            head?.next = ListNode(j)
            head = head?.next
//            debugPrint(head?.val)
            l1 = l1?.next
            l2 = l2?.next
        }
        if i != 0 {
            head?.next = ListNode(i)
            head = head?.next
        }
        return l3.next
    }
}

/*
let nodeA2 = ListNode(2)
let nodeA4 = ListNode(4)
let nodeA3 = ListNode(3)
nodeA4.next = nodeA3
nodeA2.next = nodeA4
let l1 = nodeA2

let nodeB5 = ListNode(5)
let nodeB6 = ListNode(6)
let nodeB4 = ListNode(4)
nodeB6.next = nodeB4
nodeB5.next = nodeB6
let l2 = nodeB5

let s = Solution()
let l3 = s.addTwoNumbers(l1, l2)
*/

/// 无重复字符的最长子串
class Solution3 {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        if s.isEmpty {
            return 0
        }
        let cs: [Character] = Array(s)
        var maxLength = 1
        var j = 0
        while j <= cs.count - 1 {
            var length = 0
            var i = j
            var map: [Character: Int] = [:]
            while i <= cs.count - 1 {
                let t = cs[i]
                debugPrint(t)
                if let p = map[t] {
                    j = p
                    break
                }
                map[t] = i
                i += 1
                length += 1
            }
            j += 1
            maxLength = max(maxLength, length)
        }
        return maxLength
    }
}

let s = Solution3()
let length1 = s.lengthOfLongestSubstring("abcabcbb")
let length2 = s.lengthOfLongestSubstring("bbbb")
let length3 = s.lengthOfLongestSubstring("pwwkew")
let length4 = s.lengthOfLongestSubstring("p")
let length5 = s.lengthOfLongestSubstring("")
let length6 = s.lengthOfLongestSubstring("aab")


/// 盛最多水的容器
class Solution11 {
    func maxArea(_ height: [Int]) -> Int {
        var p = 0
        var q = height.count - 1
        var maxArea = 0
        while p < q  {
            let area = min(height[p], height[q]) * (q - p)
            if area > maxArea {
                maxArea = area
            }
            if height[p] <= height[q] {
                p += 1
            } else {
                q -= 1
            }
        }
        return maxArea
    }
}

let s11 = Solution11()
let area1 = s11.maxArea([1, 8, 6, 2, 5, 4, 8, 3, 7])
let area2 = s11.maxArea([2,3,4,5,18,17,6])


/// 三数之和
class Solution15 {
    func threeSum(_ nums: [Int]) -> [[Int]] {
        var result:[[Int]] = []
        var i = 0
        while i <= nums.count - 3 {
            var j = i + 1
            while j <= nums.count - 2 {
                var k = j + 1
                while k <= nums.count - 1 {
                    if nums[i] + nums[j] + nums[k] == 0 {
                        result.append([nums[i], nums[j], nums[k]])
                    }
                    k += 1
                }
                j += 1
            }
           i += 1
        }
        return result
    }
}

let s15 = Solution15()
let result = s15.threeSum([-1, 0, 1, 2, -1, -4])
