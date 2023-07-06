// ignore_for_file: public_member_api_docs, sort_constructors_first
part of api;

class ClienteOutputDTO {
  final int id;
  final String nome;
  final String email;
  final String telefone;

  ClienteOutputDTO({
    required this.id,
    required this.nome,
    required this.email,
    required this.telefone,
  });

  factory ClienteOutputDTO.toDTO(Cliente cliente) {
    return ClienteOutputDTO(
        id: cliente.id,
        nome: cliente.nome,
        telefone: cliente.telefone,
        email: cliente.email);
  }

  static List<ClienteOutputDTO> toColletionDTO(List<Cliente> clientes){
    //funciona da msm forma nos dois casos!
    return clientes
      //.map((ClienteOutputDTO.toDTO)).toList();
      .map(((cliente) => ClienteOutputDTO.toDTO(cliente))).toList();
  }

  Map<String, dynamic> toMap(){
    return {
      'id': id,
      'nome': nome,
      'email': email,
      'telefone': telefone
    };
  }
}
