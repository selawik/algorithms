void main() {
  final input = ["do1ggie", "dogster", "dog"];

  print(longestCommonPrefix(input));
}

String longestCommonPrefix(List<String> input) {
  if (input.isEmpty) {
    return '';
  }

  final firstWord = input.first;
  var commonPrefix = '';

  for (var charIndex = 0; charIndex < firstWord.length; ++charIndex) {
    final currentChar = firstWord[charIndex];

    for (var i = 1; i < input.length; ++i) {
      final word = input[i];

      if (charIndex > word.length - 1) {
        return commonPrefix;
      }

      if (word[charIndex] != currentChar) {
        return commonPrefix;
      }
    }

    commonPrefix += currentChar;
  }

  return commonPrefix;
}
