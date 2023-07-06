// ignore_for_file: public_member_api_docs, sort_constructors_first
part of data;

class AddClienteService implements AddClienteUseCase {
  final AddClienteGateway addClienteGateway;
  final GetClienteByEmailGateway getClienteByEmailGateway;

  AddClienteService({
    required this.addClienteGateway,
    required this.getClienteByEmailGateway,
  });
  @override
  Future<Cliente> call(Cliente cliente) async{
    final clienteEncontrado = await getClienteByEmailGateway(cliente.email);
    if(clienteEncontrado != null){
      throw JaExisteUmClienteComEsseEmailException();
    }
    return addClienteGateway(cliente);
  }
}
