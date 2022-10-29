abstract class Helpers {
  const Helpers._();

  static bool isNumeric(String value) =>
      value.isNotEmpty && double.tryParse(value) != null;
}
