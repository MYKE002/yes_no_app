import 'package:yes_no_app/dominio/message.dart';

class GetYesNoModel {
  final String answer;
  final String image;
  final bool forced;

  GetYesNoModel({
    required this.answer,
    required this.image,
    required this.forced,
  });
  // cambiar a fromJson Map
  factory GetYesNoModel.fromJson(Map<String, dynamic> json) => GetYesNoModel(
    answer: json['answer'],
    image: json['image'],
    forced: json['forced'],
  );

  Map<String, dynamic> toJson() => {
    'answer': answer,
    'image': image,
    'forced': forced,
  };

  //crear elemento que regrese mensaje

  Message toMessageEntity() => Message(
    // para cambiar a español
    text: answer == 'yes' ? 'Si' : 'No',
    yooEl: YooEl.hers,
    imageUrl: image,
  );
}
