/// https://leetcode.com/problems/pascals-triangle/

List<List<int>> generate(int numRows) {
  final List<List<int>> result = [];

  for (var rowIndex = 0; rowIndex < numRows; rowIndex++) {
    final row = List.generate(rowIndex + 1, (index) => 1);

    result.add(row);

    for (var index = 1; index < row.length - 1; index++) {
      if (rowIndex < 2) {
        break;
      }

      row[index] =
          result[rowIndex - 1][index - 1] + result[rowIndex - 1][index];
    }
  }

  return result;
}

void main() {
  print(generate(4));
}
