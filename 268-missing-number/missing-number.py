class Solution:
    def missingNumber(self, nums: List[int]) -> int:
        length = len(nums) # nums의 길이를 세어준다.
        original_lst = [] # 완전히 수가 채워진 리스트 변수 선언.

        for i in range(0,length+1,1): # 비교할 완전히 수가 채워진 리스트를 만든다.
            original_lst.append(i)

        set1 = set(nums)
        set2 = set(original_lst)

        diff = set2 - set1

        result = list(diff)[0]
        return result

