import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CabecalhoNavigation extends StatelessWidget {
  final String? nameTela;
  final bool? back;
  final Function()? ontapBack;
  Color? corPadrao = const Color.fromARGB(255, 51, 102, 143);
  CabecalhoNavigation(
      {Key? key, required this.nameTela, this.back, this.ontapBack})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: screenHeight * 0.01),
        Container(
          height: screenHeight * 0.04,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              if (back != false)
                Container(
                  width: screenWidth * 0.1,
                  height: screenHeight * 0.06,
                  child: Center(
                    child: GestureDetector(
                      onTap: () async {
                        ontapBack == null ? Modular.to.pop() : ontapBack!();
                      },
                      child: Wrap(
                        direction: Axis.vertical,
                        spacing: 1,
                        children: <Widget>[
                          Stack(
                            children: [
                              Container(
                                margin:
                                    EdgeInsets.only(left: screenWidth * 0.045),
                                child: Icon(
                                  Icons.arrow_back_ios,
                                  color: const Color(0xffC0C0C0),
                                  size: screenHeight * 0.033,
                                ),
                              ),
                              Icon(
                                Icons.arrow_back_ios_new_rounded,
                                color: const Color(0xffC0C0C0),
                                size: screenHeight * 0.033,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              Container(
                width: screenWidth * 0.74,
                padding: EdgeInsets.only(left: screenWidth * 0.04),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      nameTela ?? ' ',
                      style: TextStyle(
                          fontSize: screenHeight * 0.025,
                          color: const Color(0xff1265B1),
                          fontWeight: FontWeight.w800),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: screenHeight * 0.02),
        Container(
          margin:
              EdgeInsets.fromLTRB(screenWidth * 0.0, 0, screenWidth * 0.0, 0),
          height: 1.5,
          color: Colors.black87,
        ),
      ],
    );
  }
}
