import 'dart:io';

void main() {
  int steps = playGame();
  print('Количество попыток: $steps');
}

int guessNumber(int min, int max) {
  return ((max - min) / 2).ceil() + min;
}

int playGame() {
  int minNumber = 1;
  int maxNumber = 100;
  int guessCount = 0;

  print('Загадайте число от 1 до 100.');

  while (true) {
    int guess = guessNumber(minNumber, maxNumber);
    print('Предполагаемое число: $guess');
    print(
        'Ваше число больше, меньше или равно предполагаемому числу? (more/less/equals)');

    String input = stdin.readLineSync()!.toLowerCase();

    if (input == 'equals') {
      print('Угадал! Загаданное число: $guess');
      break;
    } else if (input == 'more') {
      minNumber = guess + 1;
    } else if (input == 'less') {
      maxNumber = guess - 1;
    } else {
      print(
          'Некорректный ввод. Пожалуйста, введите "more", "less" или "equals".');
    }

    guessCount++;
  }

  return guessCount;
}
