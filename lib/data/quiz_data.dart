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
      // No quiz de Inteligência Emocional, altere para os índices reais:
      Question(
        statement:
            'Caso alguém faça uma brincadeira ofensiva com um colega, devemos:',
        alternatives: [
          'Partir para a briga', // 0
          'Primeiramente conversar sobre o ocorrido', // 1
          'Chamar a polícia', // 2
        ],
        correctIndex: 1, // 👈 Certifique que está 1
      ),
      Question(
        statement:
            'Quais alternativa que mostra apenas assuntos sensíveis e devem ser evitados em ambiente de trabalho?',
        alternatives: [
          'Política, religião e futebol', // 0
          'Churrasco, café e religião', // 1
          'Notícias, esportes e games', // 2
        ],
        correctIndex: 0, // 👈 Altere aqui de 1 para 0!
      ),
    ],
  ),
];
