import 'chat_repository.dart';

class InMemoryChatRepository implements ChatRepository {
  final List<String> _messages;

  const InMemoryChatRepository(this._messages);

  @override
  Future<void> storeMessage(String message) {
    _messages.add(message);
    return Future.value();
  }

  @override
  Future<List<String>> getAllMessages() {
    return Future.value(List.unmodifiable(_messages));
  }
}
