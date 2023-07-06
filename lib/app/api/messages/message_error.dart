// ignore_for_file: public_member_api_docs, sort_constructors_first
part of api;

class MessageError {
  final String message;
  MessageError(
    this.message,
  );

  Map<String, dynamic> toMap(){
    return {
      'message': message,
      'date': DateTime.now().toLocal().toIso8601String()
    };
  }
}
