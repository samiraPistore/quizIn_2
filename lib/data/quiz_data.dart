import 'package:quiz_in_2/models/quiz_model.dart';

final quizzes = [
  Quiz(
    title: 'Segurança no trabalho',
    date: '02/02/2024',
    questions: [
      Question(
        statement: 'Como se deve utilizar o protetor auricular?',
        alternatives: ['No pescoço', 'No ouvido', 'Na nuca'],
        correctIndex: 1,
      ),
      Question(
        statement: 'A bota de segurança é usada para:',
        alternatives: [
          'Corrida',
          'Jogar bola',
          'Proteger contra objetos perfurocortantes',
        ],
        correctIndex: 2,
      ),
      Question(
        statement: 'A faixa zebrada serve para:',
        alternatives: [
          'Marcar golzinho na rua',
          'Delimitar uma área restrita',
          'Amarrar o cachorro',
        ],
        correctIndex: 1,
      ),
    ],
  ),
  Quiz(
    title: 'Inteligência emocional',
    date: ' 03/05/2024',
    questions: [
      Question(
        statement:
            'Caso alguém faça umabrincadeira ofensiva comum colega, devemos:',
        alternatives: [
          'Partir para a briga',
          'Primeiramente conversar sobre o ocorrido',
          'Chamar a polícia',
        ],
        correctIndex: 2,
      ),
      Question(
        statement:
            'Quais alternativa que mostra apenas assuntos sensíveis e devem ser evitados em ambiente de trabalho?',
        alternatives: [
          'Política, religião e futebol',
          'Churrasco, café e religião',
          'Notícias, esportes e games',
        ],
        correctIndex: 1,
      ),
    ],
  ),
];
