class Solution:
    def missingNumber(self, nums: List[int]) -> int:
        nums.sort() # 우선 nums를 오름차순 정렬을 한다.
        length = len(nums) # nums의 길이를 세어준다.
        result = -1 # 결과 변수를 선언한다.
        original_lst = [] # 완전히 수가 채워진 리스트 변수 선언.

        for i in range(0,length+1,1): # 비교할 완전히 수가 채워진 리스트를 만든다.
            original_lst.append(i)

        for i in range(0,len(original_lst),1):
            if original_lst[i] not in nums: # 만약 완전히 채워진 리스트의 원소중에서 nums에 없는게 있다면 그게 missing number이다.
                result = original_lst[i]

        return result