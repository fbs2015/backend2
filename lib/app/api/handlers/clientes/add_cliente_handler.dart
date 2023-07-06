// ignore_for_file: public_member_api_docs, sort_constructors_first
part of api;

class AddClienteHandler implements Handler {
  final AddClienteUseCase addClienteUseCase;

  AddClienteHandler({
    required this.addClienteUseCase,
  });

  @override
  Future<ResponseHandler> call(RequestParams params) async {
    try {
      final cliente = ClienteInputDTO.toEntity(params.body!);
      final clienteCriado = await addClienteUseCase(cliente);

      return ResponseHandler(
          status: StatusHandler.created,
          body: ClienteOutputDTO.toDTO(clienteCriado));
    } on JaExisteUmClienteComEsseEmailException{
      return ResponseHandler(
          status: StatusHandler.badRequest,
          body: MessageError("Ja existe um cliente com esse email"));
    } catch (e) {
      print(e.toString());
      return ResponseHandler(status: StatusHandler.internalServerError);
    }
  }  
}
