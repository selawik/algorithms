void main() {
  print(isPalindrome(212));
  print(isPalindrome(2112));

  print(isPalindrome2(212));
  print(isPalindrome2(2112));
}

bool isPalindrome(int x) {
  final numbers = x.toString().split('');

  for (var indexFromStart = 0;
      indexFromStart < numbers.length / 2;
      ++indexFromStart) {
    final indexFromEnd = numbers.length - indexFromStart - 1;

    if (indexFromEnd <= indexFromStart) {
      return true;
    }

    if (numbers[indexFromEnd] != numbers[indexFromStart]) {
      return false;
    }
  }

  return true;
}

bool isPalindrome2(int x) {
  if (x < 0) {
    return false;
  }

  final numbers = x.toString().split('');

  final reversedX = int.parse(numbers.reversed.join(''));

  return x == reversedX;
}
