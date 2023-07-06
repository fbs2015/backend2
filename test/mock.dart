import 'package:backend2/app/data/data.dart';
import 'package:backend2/app/domain/domain.dart';
import 'package:backend2/app/infra/infra.dart';
import 'package:mocktail/mocktail.dart';

class MockGetClientesUseCase extends Mock implements GetClientesUseCase{}
class MockGetClientesGateway extends Mock implements GetClientesGateway{}
class MockAddClienteUseCase extends Mock implements AddClienteUseCase{}
class MockConnection extends Mock implements Connection{}
class MockAddClienteGateway extends Mock implements AddClienteGateway{}
class MockGetClienteByEmailGateway extends Mock implements GetClienteByEmailGateway{}

final clienteMock =
    Cliente(id: 1, nome: 'nome', email: 'email', telefone: 'telefone');
