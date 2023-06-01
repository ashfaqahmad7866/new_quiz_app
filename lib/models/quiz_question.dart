class QuizQuestion{
 const QuizQuestion(this.text,this.answers);
  final String text;
  final List<String> answers;
  List<String> getShuffledAnswered()
  {
   final shuffledAnswers= List.of(answers);
     shuffledAnswers.shuffle();
    return shuffledAnswers;
  }
    }