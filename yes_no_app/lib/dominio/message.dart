enum YooEl { me, hers }
// enumeración para poder identificar de quién es el mensaje

class Message {
  final String text;
  final String? imageUrl;
  final YooEl from;

  Message({
    required this.text,
    this.imageUrl,
    required this.from,
  });
}