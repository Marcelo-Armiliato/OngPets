import 'package:flutter/material.dart';

import '../../../widgets/cabecalhoNavigation.dart';
import '../../globalUsers.dart';

class UsersAcessPage extends StatefulWidget {
  final String title;
  const UsersAcessPage({Key? key, this.title = 'UsersAcessPage'})
      : super(key: key);
  @override
  UsersAcessPageState createState() => UsersAcessPageState();
}

class UsersAcessPageState extends State<UsersAcessPage> {
  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              CabecalhoNavigation(nameTela: 'Usuários disponíveis'),
              Container(
                width: screenWidth,
                height: screenHeight * 0.85,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: screenWidth * 1,
                      height: screenHeight * 0.6,
                      margin: EdgeInsets.only(
                          left: screenWidth * 0.02, right: screenWidth * 0.02),
                      padding: EdgeInsets.only(
                          bottom: screenHeight * 0.01,
                          left: screenWidth * 0.02,
                          right: screenWidth * 0.02),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 246, 245, 245),
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              offset: const Offset(1, 1),
                              blurRadius: 4)
                        ],
                        borderRadius: BorderRadius.circular(
                          15,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            Users.listEmailsAcess!
                                .toList()
                                .toString()
                                .replaceAll('[', '')
                                .replaceAll(']', ''),
                            style: TextStyle(
                              fontSize: screenHeight * 0.03,
                              fontWeight: FontWeight.w500,
                              color: Colors.black87,
                            ),
                          ),
                          SizedBox(height: screenHeight * 0.01),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
