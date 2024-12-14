import 'package:request_driven_architecture/request_driven_architecture.dart';

import '../chat/request/send_message_request.dart';
import 'request/bot_answer_request.dart';

class DummyBotService {
  final Mailman _mailman;

  DummyBotService(this._mailman) {
    _mailman.registerHandler<bool, BotAnswerRequest>(_answer);
  }

  Future<bool> _answer(BotAnswerRequest request) {
    return _mailman.request(SendMessageRequest(
      message: 'Bot is answering to: ${request.question}',
      shouldRequestBotAnswer: false,
    ));
  }
}
