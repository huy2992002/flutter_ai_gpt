class MessageModel {
  String id;
  String message;
  bool isMe;

  MessageModel({
    required this.id,
    required this.message,
    this.isMe = false,
  });
}
