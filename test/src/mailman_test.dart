import 'package:request_driven_architecture/request_driven_architecture.dart';
import 'package:test/test.dart';

class SumNumbersRequest implements MailmanRequest<int> {
  final int a;
  final int b;

  const SumNumbersRequest(this.a, this.b);
}

class DivideNumbersRequest implements MailmanRequest<double> {
  final double a;
  final double b;

  const DivideNumbersRequest(this.a, this.b);
}

void main() {
  test('Register handler', () async {
    final mailman = Mailman();

    mailman.registerHandler<int, SumNumbersRequest>((request) async {
      return request.a + request.b;
    });

    mailman.registerHandler<double, DivideNumbersRequest>((request) async {
      return request.a / request.b;
    });

    expect(
      await mailman.request(SumNumbersRequest(1, 2)),
      equals(3),
    );

    expect(
      await mailman.request(DivideNumbersRequest(1, 2)),
      equals(0.5),
    );
  });
}
