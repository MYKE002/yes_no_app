import 'package:dio/dio.dart';
import 'package:yes_no_app/dominio/message.dart';
import 'package:yes_no_app/infraestructura/get_yes_no_model.dart';

class GetAnswer {
  // nueva propiedad a instanciar
  final _dio = Dio();

  //metodo que va a regresar mensajes de respuesta
  // comando para instalar dio dart pub add dio
  Future<Message> getAnswer() async {
    // declarar el url que quiero llamar como respuesta
    final response = await _dio.get('https://yesno.wtf/api');
    //retornar como mensaje mappers

    // llamar al mapper de json
    final getYesNoModel = GetYesNoModel.fromJson(response.data);

    // dentro dedl posman
    return getYesNoModel.toMessageEntity();
  }
}