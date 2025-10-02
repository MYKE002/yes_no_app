import 'package:flutter/material.dart';
import 'package:si_no_app/config/helpers/get_answer.dart';
import 'package:si_no_app/dominio/message.dart';

// class para que el provider notifique cuando recibamos cambios
class ChatProvider extends ChangeNotifier {
  // instancia a la clase
  final GetAnswer getAnswer = GetAnswer();
  // definir el nuevo scroll controller
  final ScrollController chatScrollController = ScrollController();

  // lista de mensajes
  List<Message> messageList = [];

  //mensaje remitido por mí que debe ser almacenado
  Future<void> sendMessage(String text) async {
    // validación para evitar mensajes vacíos para tarea
    if (text.isEmpty) return;

    final newMessage = Message(text: text, yooEl: YooEl.me);
    //agregar el nuevo mensaje a la lista
    messageList.add(newMessage);
    //llamar a herReply solamente si es una pregunta
    if (text.endsWith('?')) {
      herReply();
    }

    //una vez que reciba el cambio que se actualice
    notifyListeners();
    //llamar al move
    moveScrollToButton();
  }

  // nuevo metodo para tomar el mensaje de respuesta
  Future<void> herReply() async {
    final herMessage = await getAnswer.getAnswer();
    //retornar message list
    messageList.add(herMessage);
    notifyListeners();
    //scroll para navegar
    moveScrollToButton();
  }

  //funcion para mover el Scroll
  void moveScrollToButton() async {
    //esperar de forma obligatoria a efectos de una buena accion del scroll
    await Future.delayed(const Duration(milliseconds: 100));
    // scroll con animación, posición, duración, curve es el tipo de animación
    chatScrollController.animateTo(
      chatScrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }
}