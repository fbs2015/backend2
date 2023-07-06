import 'package:backend2/app/domain/domain.dart';
import 'package:backend2/app/infra/infra.dart';
import 'package:test/test.dart';

import '../../../../mock.dart';

void main() {
  late MockConnection mockConnection;
  late GetClienteByEmailDAO dao;
  
  setUpAll(() {
    mockConnection = MockConnection();
    dao = GetClienteByEmailDAO(connection: mockConnection);
  });
  group('GetClienteByEmailDAO', (){
    test('gdeve retornar um cliente', () async {
      final result = await dao.call('email@email.com');

      expect(result, isA<Cliente>());
  });
  });
}