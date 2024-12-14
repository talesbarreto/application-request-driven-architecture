abstract interface class ChatRepository {
  Future<void> storeMessage(String message);

  Future<List<String>> getAllMessages();
}
