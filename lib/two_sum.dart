void main() {
  final input = [3, 2, 4];
  final target = 6;

  print(twoSum(input, target));
}

List<int> twoSum(List<int> nums, int target) {
  final possibleNumsIndexPairs = <int, int>{};

  for (var i = 0; i < nums.length; i++) {
    final num = nums[i];

    final secondPosibleNum = target - num;

    if (possibleNumsIndexPairs.containsKey(secondPosibleNum)) {
      return [possibleNumsIndexPairs[secondPosibleNum]!, i];
    } else {
      possibleNumsIndexPairs[num] = i;
    }
  }

  return [];
}
