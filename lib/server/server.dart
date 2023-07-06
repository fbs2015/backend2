import 'dart:convert';
import 'dart:io';

import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart';
import 'package:shelf_router/shelf_router.dart ';

import '../app/api/api.dart';

part 'adapter/shelf_adapter.dart';
part 'response/response_json.dart';
part 'middlewares/content_json.dart';

class Server{
  static Future<HttpServer> bootstrap(List<Controller> controllers)async{
    final ip = InternetAddress.anyIPv4;

    final router = Router();
    ShelfAdapter(controllers: controllers).handler(router);

    final handler = Pipeline()
      .addMiddleware(logRequests())
      .addMiddleware(contentJSON())
      .addHandler(router);

    final port = int.parse(Platform.environment['PORT'] ?? '8080');
    return await serve(handler, ip, port);    
  }
}