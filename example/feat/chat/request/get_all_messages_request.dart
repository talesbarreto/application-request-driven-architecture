import 'package:request_driven_architecture/request_driven_architecture.dart';

class GetAllMessagesRequest implements MailmanRequest<List<String>> {
  const GetAllMessagesRequest();
}
