part of infra;

class FakeDB implements Connection{
  @override
  Future<void> close() async{
    print('close conection');
  }

  @override
  Future<List<Map<String, dynamic>>> query(String statement, [Map<String, dynamic> params = const {}]) async{
    return [{
      'id': 1,
      'nome': 'nome teste',
      'email': 'email@email.com',
      'telefone': '(051)11111-1111',
    }];
  }

}