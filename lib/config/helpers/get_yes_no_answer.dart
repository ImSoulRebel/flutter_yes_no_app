import 'package:dio/dio.dart';
import 'package:flutter_yes_no_app/domain/entities/message.dart';
import 'package:flutter_yes_no_app/infraestructure/models/yes_no_model.dart';

class GetYesNoAnswer {
  final _dio = Dio();

  Future<Message> getAnswer() async {
    final res = await _dio.get('https://yesno.wtf/api');
    final model = YesNoModel.fromJsonMap(res.data);
    return model.toMessageEntity();
  }
}
