class Option {
 final String optionText;
  bool isCorrect;
 final bool selected; // Track the selection state for an option

  Option({
    required this.optionText,
    required this.isCorrect,
    this.selected = false, // Default to false initially
  });
}