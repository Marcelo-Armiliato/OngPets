import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MsgPopup {
  msgTextComDoisBotoes(
    BuildContext context,
    mensagem,
    textoBotaoEsq,
    textoBotaoDir,
    onTap(),
    onPressed(),
    controller, {
    double? fontMsg,
    Color? corMsg,
    Color? corBotaoEsq,
    Color? corBotaoDir,
    bool? sairAoPressionar,
    Radius? borderRadius,
    double? fontTextController,
    String? textTitleController,
    Widget? iconeTextController,
    final maxLines,
    final minLines,
    final maxLength,
  }) {
    return showDialog(
      barrierDismissible: sairAoPressionar ?? false,
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(15))),
          title: Text(
            mensagem,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: fontMsg ?? 22,
              fontWeight: FontWeight.w600,
              color: corMsg ?? Colors.black,
            ),
          ),
          elevation: 12,
          actions: <Widget>[
            // ===================== BOTÕES ==========================
            Container(
              padding: EdgeInsets.only(top: 10),
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  // const Padding(
                  //   padding: EdgeInsets.only(top: 10),
                  // ),
                  Container(
                    alignment: Alignment(0, 0),
                    width: 300, //?? MediaQuery.of(context).size.width,
                    child: TextField(
                      controller: controller,
                      style: TextStyle(
                        fontSize: fontTextController ?? 18,
                      ),
                      decoration: InputDecoration(
                        prefixIcon: iconeTextController ?? Icon(Icons.message),
                        labelText: textTitleController ?? '',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                            10,
                          ),
                        ),
                      ),
                      minLines: minLines ?? 4,
                      maxLines: maxLines ?? 10,
                      maxLength: maxLength ?? maxLength,
                    ),
                  ),
                  SizedBox(height: 30),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      // ============= PRIMEIRO BOTÃO ==============
                      Container(
                        child: FloatingActionButton.extended(
                          backgroundColor: corBotaoEsq ?? Color(0XFFF4485C),
                          label: Text(
                            textoBotaoEsq,
                            style: TextStyle(fontSize: 19),
                          ),
                          onPressed: () {
                            onTap();
                          },
                        ),
                        width: MediaQuery.of(context).size.width * 0.34,
                      ),
                      SizedBox(width: 10),
                      // ============= SEGUNDO BOTÃO ==============
                      Container(
                        child: FloatingActionButton.extended(
                          backgroundColor: corBotaoDir ?? Color(0XFF0099FF),
                          label: Text(
                            textoBotaoDir,
                            style: TextStyle(fontSize: 19),
                          ),
                          onPressed: () {
                            onPressed();
                          },
                        ),
                        width: MediaQuery.of(context).size.width * 0.34,
                      ),
                      //-----------------------------------------
                    ],
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  msgFeedback(BuildContext context, titulo, mensagem,
      {Function? onPressed,
      Color? corMsg,
      double? sizeTitulo,
      double? fontMsg,
      txtButton}) {
    return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: Text(
          titulo,
          style: TextStyle(
            fontSize: sizeTitulo ?? 19,
            fontWeight: FontWeight.w700,
            color: Colors.black87,
          ),
        ),
        content: Text(
          mensagem,
          style: TextStyle(
            fontSize: fontMsg ?? 19,
            color: corMsg ?? Colors.black,
            fontWeight: FontWeight.w500,
          ),
        ),
        actions: [
          FloatingActionButton(
            elevation: 0.0,
            backgroundColor: Colors.transparent,
            focusColor: Colors.red,
            child: Text(
              txtButton ?? 'OK',
              style: const TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          )
        ],
      ),
    );
  }
}
