import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../login/views/login_store.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key? key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final LoginStore storeLogin = Modular.get();

  cardPets(String title, AssetImage image, {Function()? ontap}) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      width: screenWidth,
      height: screenHeight * 0.37,
      child: Column(children: [
        SizedBox(height: screenHeight * 0.01),
        RichText(
          textAlign: TextAlign.start,
          text: TextSpan(
            text: title,
            style: TextStyle(
              fontSize: screenHeight * 0.03,
              fontWeight: FontWeight.bold,
              color: const Color.fromARGB(255, 134, 184, 210),
            ),
          ),
        ),
        SizedBox(height: screenHeight * 0.02),
        InkWell(
          onTap: (() {
            ontap != null ? ontap() : null;
          }),
          child: Container(
            width: screenWidth * 0.9,
            height: screenHeight * 0.28,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 245, 242, 236),
              borderRadius: BorderRadius.circular(15),
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  offset: Offset(1, 1),
                  blurRadius: 6,
                  spreadRadius: 1,
                )
              ],
              image: DecorationImage(
                image: image,
                fit: BoxFit.fill,
                alignment: Alignment.topCenter,
              ),
            ),
          ),
        ),
      ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'OngPets',
            style: TextStyle(
              fontSize: screenHeight * 0.035,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 134, 184, 210),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              ListTile(
                leading:
                    Icon(Icons.people_alt_outlined, size: screenHeight * 0.03),
                title: Text(
                  "Usuários permitidos",
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: screenHeight * 0.023,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                onTap: () {
                  Modular.to.pushNamed('/home/usersAcess');
                },
              ),
              Container(
                margin: EdgeInsets.fromLTRB(
                    screenWidth * 0.0, 0, screenWidth * 0.0, 0),
                height: 1.5,
                color: Colors.black54,
              ),
              ListTile(
                leading: Icon(Icons.logout_outlined, size: screenHeight * 0.03),
                title: Text(
                  "Logout",
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: screenHeight * 0.023,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                onTap: () {
                  storeLogin.logout();
                  Navigator.pop(context);
                },
              ),
              Container(
                margin: EdgeInsets.fromLTRB(
                    screenWidth * 0.0, 0, screenWidth * 0.0, 0),
                height: 1.5,
                color: Colors.black54,
              ),
              ListTile(
                leading: Icon(Icons.close, size: screenHeight * 0.03),
                title: Text(
                  "Sair",
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: screenHeight * 0.023,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                onTap: () {
                  SystemNavigator.pop();
                },
              ),
              Container(
                margin: EdgeInsets.fromLTRB(
                    screenWidth * 0.0, 0, screenWidth * 0.0, 0),
                height: 1.5,
                color: Colors.black54,
              ),
            ],
          ),
        ),
        body: Container(
          width: screenWidth,
          height: screenHeight,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                cardPets(
                  'Nossos cãezinhos',
                  const AssetImage("assets/home/caes3.jpg"),
                  ontap: (() {
                    Modular.to.pushNamed('/listPets/dogs');
                  }),
                ),
                SizedBox(height: screenHeight * 0.01),
                cardPets(
                  'Nossos gatinhos',
                  const AssetImage("assets/home/gatos2.png"),
                  ontap: (() {
                    Modular.to.pushNamed('/listPets/cats');
                  }),
                ),
              ]),
        ),
      ),
    );
  }
}
