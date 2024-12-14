import 'package:request_driven_architecture/request_driven_architecture.dart';

class SendMessageRequest implements MailmanRequest<bool> {
  final String message;
  final bool shouldRequestBotAnswer;

  const SendMessageRequest({
    required this.message,
    this.shouldRequestBotAnswer = true,
  });
}
