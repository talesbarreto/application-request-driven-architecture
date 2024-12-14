import 'package:request_driven_architecture/src/mailman.dart';

import '../bot/request/bot_answer_request.dart';
import 'repository/chat_repository.dart';
import 'request/get_all_messages_request.dart';
import 'request/send_message_request.dart';

class ChatService {
  final Mailman _mailman;
  final ChatRepository _repository;

  ChatService(this._mailman, this._repository) {
    _mailman
      ..registerHandler<bool, SendMessageRequest>(_sendMessage)
      ..registerHandler<List<String>, GetAllMessagesRequest>(_getAllMessages);
  }

  Future<bool> _sendMessage(SendMessageRequest request) async {
    await _repository.storeMessage(request.message);
    if (request.shouldRequestBotAnswer) {
      return _mailman.request(BotAnswerRequest(request.message));
    } else {
      return true;
    }
  }

  Future<List<String>> _getAllMessages(GetAllMessagesRequest _) {
    return _repository.getAllMessages();
  }
}
