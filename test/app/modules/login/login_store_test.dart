import 'package:flutter_test/flutter_test.dart';
import 'package:ong_pets/app/modules/login/views/login_store.dart';

void main() {
  late LoginStore store;

  setUpAll(() {
    store = LoginStore();
  });

  test('increment count', () async {
    expect(store.state, equals(0));
    store.update(store.state + 1);
    expect(store.state, equals(1));
  });
}
