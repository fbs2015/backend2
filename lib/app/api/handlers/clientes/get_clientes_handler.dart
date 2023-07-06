part of api;

class GetClientesHandler implements Handler{
  final GetClientesUseCase getClientesUseCase;

  GetClientesHandler({
    required this.getClientesUseCase,
  });

  @override
  Future<ResponseHandler> call(RequestParams params) async{
    try {
      final clientes = await getClientesUseCase();
      return ResponseHandler<List<ClienteOutputDTO>>(
        status: StatusHandler.ok, 
        body: ClienteOutputDTO.toColletionDTO(clientes),
      );
    } catch (e) {
      return ResponseHandler(
        status: StatusHandler.internalServerError, );
    }
  }
}