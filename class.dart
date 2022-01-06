import 'dart:io';

class Quiz {
  String? question;
  double? answer;

  Quiz(String question, double answer) {
    this.question = question;
    this.answer = answer;
  }
}

double prompt(String message) {
  print(message);
  double answer = double.parse(stdin.readLineSync()!);
  return answer;
}

List user_answers(List answers) {
  List<dynamic> list_answer = [];
  list_answer.add(answers);
  return list_answer;
}

void main() {
  int point = 0;
  List<Quiz> quiz = [
    Quiz("23 * 2", 46.0),
    Quiz("30 + 65", 95.0),
    Quiz("40 / 2", 20.0)
  ];

  for (int i = 0; i < quiz.length; i++) {
    print("");
    print(quiz[i].question);
    double user_answer = prompt("What is your answer: ");
    if (quiz[i].answer == user_answer) {
      point += 2;
      print("You earned ${point}points");
    } else {
      print("Wrong Answer");
    }
  }
  print("Your total point was ${point}points");
}
