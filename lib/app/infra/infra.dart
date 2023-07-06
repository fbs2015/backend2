library infra;

import 'package:backend2/app/domain/domain.dart';
import 'package:postgres/postgres.dart';

import '../data/data.dart';

part 'dao/clientes/get_clientes_dao.dart';
part 'dao/clientes/get_cliente_by_email_dao.dart';
part 'connection/connection.dart';
part 'connection/fake/fake_db.dart';
part 'connection/postgres/postgres.dart';

class ClienteDB{
  ClienteDB._();

  static Cliente toEntity(Map<String, dynamic> cliente){
    return Cliente(
        id: cliente['id'],
        nome: cliente['nome'],
        email: cliente['email'],
        telefone: cliente['telefone']);
  }
}