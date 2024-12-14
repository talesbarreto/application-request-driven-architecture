import 'package:request_driven_architecture/request_driven_architecture.dart';

import 'feat/bot/dummy_bot_service.dart';
import 'feat/chat/chat_service.dart';
import 'feat/chat/repository/in_memory_chat_repository.dart';
import 'feat/chat/request/get_all_messages_request.dart';
import 'feat/chat/request/send_message_request.dart';

void main() async {
  final mailman = Mailman();
  _buildServices(mailman);

  final successful = await mailman.request(
    SendMessageRequest(message: 'Hello, bot!'),
  );
  print("Message sent successfully: $successful");

  final messages = await mailman.request(GetAllMessagesRequest());
  for (int i = 0; i < messages.length; i++) {
    print("\t$i: ${messages[i]}");
  }
}

void _buildServices(Mailman mailman) {
  // BotService and ChatService call each other in their handlers.
  // Using the Mailman instance, we are free of circular dependencies.
  DummyBotService(mailman);
  ChatService(
    mailman,
    InMemoryChatRepository(List.empty(growable: true)),
  );
}
