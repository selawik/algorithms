final a =
    "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!\"#\$%&'()*+,-./:;<=>?@[\\]^_`{|}~ abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!\"#\$%&'()*+,-./:;<=>?@[\\]^_`{|}~ abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!\"#\$%&'()*+,-./:;<=>?@[\\]^_`{|}~ abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!\"#\$%&'()*+,-./:;<=>?@[\\]^_`{|}~ abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!\"#\$%&'()*+,-./:;<=>?@[\\]^_`{|}~ abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!\"#\$%&'()*+,-./:;<=>?@[\\]^_`{|}~ abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!\"#\$%&'()*+,-./:;<=>?@[\\]^_`{|}~ abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!\"#\$%&'()*+,-./:;<=>?@[\\]^_`{|}~ abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!\"#\$%&'()*+,-./:;<=>?@[\\]^_`{|}~ abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!\"#\$%&'()*+,-./:;<=>?@[\\]^_`{|}~ abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!\"#\$%&'()*+,-./:;<=>?@[\\]^_`{|}~ abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!\"#\$%&'()*+,-./:;<=>?@[\\]^_`{|}~ abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!\"#\$%&'()*+,-./:;<=>?@[\\]^_`{|}~ abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!\"#\$%&'()*+,-./:;<=>?@[\\]^_`{|}~ abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!\"#\$%&'()*+,-./:;<=>?@[\\]^_`{|}~ abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!\"#\$%&'()*+,-./:;<=>?@[\\]^_`{|}~ abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!\"#\$%&'()*+,-./:;<=>?@[\\]^_`{|}~ abcdefghijklmnopqrstuvwxyzABCD";

// int lengthOfLongestSubstring(String s) {
//   final result = <int>[];
//   final charsList = s.split('');
//   var processingString = <String>[];

//   for (var index = 0; index < s.length; index++) {
//     print(index);
//     final char = s[index];
//     final indexOfChar = processingString.indexOf(char);

//     print('index of \$char in \$processingString - \$indexOfChar');

//     if (indexOfChar != -1) {
//       result.add(processingString.length);

//       print('string to process recurs \${s.substring(indexOfChar + 1)}');

//       if (index != s.length - 1) {
//         if (processingString.length != 1) {
//           index = processingString.length - 2;
//         }

//         processingString = [];
//         // final recursiveCall =
//         //     lengthOfLongestSubstring(s.substring(indexOfChar + 1));

//         // print('after recursive call \$recursiveCall');
//         // result.add(recursiveCall);
//       }
//     } else {
//       processingString.add(char);
//     }
//   }

//   if (processingString.isNotEmpty) {
//     result.add(processingString.length);
//   }

//   print(result);

//   return result.fold(0, (init, next) => init > next ? init : next);
// }

final processedStrings = <String>[];

int lengthOfLongestSubstring(String s) {
  var maxLength = 0;

  final charsList = s.split('');
  var processingString = <String>[];

  for (final char in charsList) {
    final indexOfChar = processingString.indexOf(char);

    if (indexOfChar != -1) {
      final processedLength = processingString.length;

      if (processedLength > maxLength) {
        maxLength = processedLength;
      }

      processingString = [char];

      final substring = s.substring(indexOfChar + 1);

      final rangeToValidate = ((maxLength) * 2) - 1;
      final substringPart = substring.substring(
          0,
          rangeToValidate > substring.length
              ? substring.length
              : rangeToValidate);

      if (indexOfChar != s.length - 1 &&
          !processedStrings.contains(substring) &&
          isUniqueSequence(substringPart, maxLength)) {
        final recursiveCall = lengthOfLongestSubstring(substring);

        if (maxLength < recursiveCall) {
          maxLength = recursiveCall;
        }

        processedStrings.add(substring);
      }
    } else {
      processingString.add(char);

      if (char == charsList.last) {
        final processedLength = processingString.length;

        if (processedLength > maxLength) {
          maxLength = processedLength;
        }
      }
    }
  }

  return maxLength;
}

bool isUniqueSequence(String s, int maxRange) {
  print(s);
  for (var i = 0; i < (s.length - 1) / 2; i++) {
    if (s[i] == s[i + maxRange - 1]) {
      return false;
    }
  }

  return true;
}

void main() {
  // print(lengthOfLongestSubstring('juutwqevgdncdylqeyyzzgaxharod'));
  // print(lengthOfLongestSubstring('rqdarzcfvdcnabzavkixzehdmgoddjrubuwuu'));
  // print(lengthOfLongestSubstring('bbbbb'));
  // print(lengthOfLongestSubstring('pwwkew'));
  // print(lengthOfLongestSubstring('dvdf'));

  // print(lengthOfLongestSubstring(a));
  print(lengthOfLongestSubstring("uwxqsiwjhklwbtvc"));
  // print(lengthOfLongestSubstring('cdd'));
  // print(lengthOfLongestSubstring('ohomm'));
}
