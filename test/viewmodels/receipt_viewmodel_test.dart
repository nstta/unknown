import 'package:flutter_test/flutter_test.dart';
import 'package:unknown/app/app.locator.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('ReceiptViewModel Tests -', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());
  });
}
