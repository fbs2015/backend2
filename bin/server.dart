import 'package:backend2/config/config.dart';
import 'package:backend2/server/server.dart';

void main(){
  Server.bootstrap(controllers)
  .then((server) => print('Server listening on port ${server.port}'))
  .catchError(print);
}