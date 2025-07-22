class StringCalculator {
  int add(String input) {
    if (input.isEmpty) return 0;

    String delimiter = ',';
    String numbers = input;

    if (input.startsWith('//')) {
      final delimiterEndIndex = input.indexOf('\n');
      delimiter = input.substring(2, delimiterEndIndex);
      numbers = input.substring(delimiterEndIndex + 1);
    }

    numbers = numbers.replaceAll('\n', delimiter);
    List<String> parts = numbers.split(delimiter);
    List<int> nums = parts.map(int.parse).toList();

    List<int> negatives = nums.where((n) => n < 0).toList();
    if (negatives.isNotEmpty) {
      throw Exception('negative numbers not allowed: ${negatives.join(',')}');
    }

    return nums.fold(0, (sum, val) => sum + val);
  }
}

void main() {
  final calc = StringCalculator();

  print(calc.add("")); 
  print(calc.add("1")); 
  print(calc.add("1,2")); 
  print(calc.add("1\n2,3")); 
  print(calc.add("//;\n1;2")); 

  try {
    print(calc.add("1,-2,3,-4"));
  } catch (e) {
    print(e); 
  }
}
