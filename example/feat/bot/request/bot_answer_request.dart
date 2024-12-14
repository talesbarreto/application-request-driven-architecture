import 'package:request_driven_architecture/request_driven_architecture.dart';

class BotAnswerRequest implements MailmanRequest<bool> {
  final String question;

  const BotAnswerRequest(this.question);
}
