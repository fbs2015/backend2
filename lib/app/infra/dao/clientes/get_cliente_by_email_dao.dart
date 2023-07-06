// ignore_for_file: public_member_api_docs, sort_constructors_first
part of infra;

class GetClienteByEmailDAO implements GetClienteByEmailGateway {
  final Connection connection;

  GetClienteByEmailDAO({
    required this.connection,
  });

  @override
  Future<Cliente?> call(String email) async{
    return Cliente(id: 1, nome: 'nome', email: 'email@email.com', telefone: 'telefone');
  }  
}
