void main() {
  final input = '{()';

  print(isValid(input));
}

bool isValid(String s) {
  List<String> characterStack = [];

  for (final char in s.split('')) {
    if (char == '{' || char == '[' || char == '(') {
      characterStack.add(char);
    } else {
      if (characterStack.isEmpty) {
        return false;
      }

      if (characterStack.last == '{' && char == '}' ||
          characterStack.last == '[' && char == ']' ||
          characterStack.last == '(' && char == ')') {
        characterStack.removeLast();
      } else {
        return false;
      }
    }
  }

  if (characterStack.isEmpty) {
    return true;
  }

  return false;
}
