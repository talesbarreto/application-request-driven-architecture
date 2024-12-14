/// [MailmanRequest] is an abstract class that represents a request that can be
/// sent to a [Mailman] instance. Its implementation can contain any data that
/// is necessary for the request to be processed.
///
/// For example:
/// ```dart
/// class SumNumbersRequest implements MailmanRequest<int> {
///   final int a;
///   final int b;
///   const SumNumbersRequest(this.a, this.b);
///  }
///  ```
///
/// [R] is the type of the response that the request expects.
///
abstract interface class MailmanRequest<R> {}
