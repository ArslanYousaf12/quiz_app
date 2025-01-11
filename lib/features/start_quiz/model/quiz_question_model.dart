class QuizQuestionModel {
  const QuizQuestionModel(
    this.question,
    this.options,
  );
  final String question;
  final List<String> options;

  List<String> shaffleOptions() {
    final shaffledOption = List.of(options);
    shaffledOption.shuffle();
    return shaffledOption;
  }
}
