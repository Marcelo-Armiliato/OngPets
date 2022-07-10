import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';

import '../../../widgets/customElevatedButton.dart';
import '../../../widgets/customTextFormField.dart';
import '../../../widgets/msgPopup.dart';
import '../../globalUsers.dart';
import 'login_store.dart';

class LoginPage extends StatefulWidget {
  final String title;
  const LoginPage({Key? key, this.title = 'LoginPage'}) : super(key: key);
  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends ModularState<LoginPage, LoginStore> {
  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  bool allowShowError = false;

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            MsgPopup().msgFeedback(
                context,
                'Usuários disponíveis\n',
                Users.listEmailsAcess!
                    .toList()
                    .toString()
                    .replaceAll('[', '')
                    .replaceAll(']', ''));
          },
          child: Icon(Icons.people_sharp, size: screenHeight * 0.035),
          elevation: 5,
        ),
        backgroundColor: Color.fromARGB(255, 246, 243, 243),
        body: SingleChildScrollView(
          child: Container(
            width: screenWidth,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/login.png"),
                fit: BoxFit.scaleDown,
                alignment: Alignment.topCenter,
              ),
            ),
            child: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(
                    left: screenWidth * 0.08,
                    right: screenWidth * 0.08,
                    top: screenHeight * 0.45,
                  ),
                  child: Form(
                    key: _formKey,
                    child: Container(
                      // height: screenHeight,
                      alignment: Alignment.center,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomTextFormField(
                            controller: _emailController,
                            prefixIcon: Icon(Icons.email_outlined,
                                size: screenHeight * 0.024),
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Campo obrigatório';
                              }
                            },
                            radius: 40,
                            backgroundColor: Colors.white,
                            widthField: screenWidth * 0.7,
                            hintText: 'E-mail:',
                          ),
                          SizedBox(
                            height: screenHeight * 0.06,
                          ),
                          CustomElevatedButton(
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                allowShowError = true;
                                FocusScope.of(context).unfocus();
                                store.authUser(email: _emailController.text);
                                if (store.userAuth == false) {
                                  MsgPopup().msgFeedback(
                                      context, 'Usuário não encontrado!', '');
                                }
                              }
                            },
                            textButton: 'Entrar',
                            colorTextButton: Colors.white,
                            colorButton: const Color(0xff35C4FF),
                            sizeText: screenHeight * 0.038,
                            widthButton: screenHeight * 0.22,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
