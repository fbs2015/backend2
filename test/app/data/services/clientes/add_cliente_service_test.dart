import 'package:backend2/app/domain/domain.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';
import 'package:backend2/app/data/data.dart';

import '../../../../mock.dart';

class FakeCliente extends Fake implements Cliente{}

void main() {
  late AddClienteService service;
  late MockAddClienteGateway mockAddClienteGateway;
  late MockGetClienteByEmailGateway mockGetClienteByEmailGateway;

  setUpAll(() {
    mockAddClienteGateway = MockAddClienteGateway();
    mockGetClienteByEmailGateway = MockGetClienteByEmailGateway();
    service = AddClienteService(addClienteGateway: mockAddClienteGateway, getClienteByEmailGateway: mockGetClienteByEmailGateway);

    registerFallbackValue(FakeCliente());
  });
  group('AddClienteService', () {
    test('deve adicionar um cliente.', () async {
      when(() =>mockGetClienteByEmailGateway.call(any()))
          .thenAnswer((_) async => null);
      when(() => mockAddClienteGateway.call(any()))
      .thenAnswer((_) async => clienteMock);
      final result = await service.call(
          Cliente(id: 0, nome: 'nome', email: 'email', telefone: 'telefone'));

      expect(result, isA<Cliente>());
    });

    test(
        'deve lançar um JaExisteUmClienteComEsseEmailException qdo tentar cadastrar um cliente com o msm email.',
        () async {
      when(() =>mockGetClienteByEmailGateway.call(any()))
          .thenAnswer((_) async => clienteMock);      

      expect(() => service.call(
          Cliente(id: 0, nome: 'nome', email: 'email', telefone: 'telefone')), throwsA(isA<JaExisteUmClienteComEsseEmailException>()));
    });
  });
}
