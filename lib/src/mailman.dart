import 'dart:async';

import 'mailman_request.dart';

typedef MailManHandler<T, R extends MailmanRequest<T>> = FutureOr<T> Function(
    R request);

class Mailman {
  final _handlers = [];

  void registerHandler<T, R extends MailmanRequest<T>>(
    MailManHandler<T, R> handler,
  ) {
    if (_handlers.any((element) => element is MailManHandler<T, R>)) {
      throw Exception('Handler for ${T.toString()} already exists');
    }
    _handlers.add(handler);
  }

  Future<T> request<R extends MailmanRequest<T>, T>(R request) async {
    final handler = _handlers.firstWhere(
      (element) => element is MailManHandler<T, R>,
      orElse: () => throw Exception('Handler for ${T.toString()} not found'),
    ) as MailManHandler<T, R>;
    return handler(request);
  }
}
