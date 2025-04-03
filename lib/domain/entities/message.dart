enum FromWho { mine, your }

class Message {
  final FromWho fromWho;
  final String text;
  final String? imageUrl;

  Message({required this.fromWho, required this.text, this.imageUrl});
}
