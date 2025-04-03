import 'package:flutter_yes_no_app/domain/entities/message.dart';

class YesNoModel {
  final String answer;
  final String image;
  final bool forced;

  YesNoModel({required this.answer, required this.image, required this.forced});

  factory YesNoModel.fromJsonMap(Map<String, dynamic> json) => YesNoModel(
    answer: json['answer'],
    image: json['image'],
    forced: json['forced'],
  );

  Map<String, dynamic> toJsonMap() => {
    'answer': answer,
    'image': image,
    'forced': forced,
  };

  Message toMessageEntity() => Message(
    fromWho: FromWho.your,
    text:
        answer == 'maybe'
            ? 'A lo mejor'
            : answer == 'yes'
            ? 'Si'
            : 'No',
    imageUrl: image,
  );
}
