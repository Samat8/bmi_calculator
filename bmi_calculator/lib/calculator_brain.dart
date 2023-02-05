class CalculatorBrain {
  CalculatorBrain(
      {required this.height, required this.weight, required this.bmi});

  final int height;
  final int weight;

  final double bmi;

  String calculateBMI() {
    return bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (bmi >= 25) {
      return 'Overweight';
    } else if (bmi >= 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String gerInterpretation() {
    if (bmi >= 25) {
      return 'Exercise more';
    } else if (bmi >= 18.5) {
      return 'Good body weight';
    } else {
      return 'Eat more :) ';
    }
  }
}
