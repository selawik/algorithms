/// https://leetcode.com/problems/generate-parentheses/

List<String> generateParenthesis(int n) {
  return generateFor('(', n - 1, n).toList();
}

List<String> generateFor(
  String sequence,
  int openParenthesisCount,
  int closeParenthesisCount,
) {
  if (closeParenthesisCount == 0 && openParenthesisCount == 0) {
    return [sequence];
  }

  if (openParenthesisCount == closeParenthesisCount &&
      openParenthesisCount != 0) {
    return generateFor(
      sequence + '(',
      openParenthesisCount - 1,
      closeParenthesisCount,
    );
  }

  if (openParenthesisCount == 0 && closeParenthesisCount > 0) {
    return [sequence + (')' * closeParenthesisCount)];
  }

  return [
    ...generateFor(
      sequence + ')',
      openParenthesisCount,
      closeParenthesisCount - 1,
    ),
    ...generateFor(
      sequence + '(',
      openParenthesisCount - 1,
      closeParenthesisCount,
    )
  ];
}

void main() {
  print(generateParenthesis(5));
}
