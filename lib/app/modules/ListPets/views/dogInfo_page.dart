import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';

import '../../../widgets/cabecalhoNavigation.dart';
import '../../../widgets/imagePets.dart';
import '../store/listDogs_store.dart';
import 'listDogs_page.dart';

class dogInfoPage extends StatefulWidget {
  final String title;
  const dogInfoPage({Key? key, this.title = 'ListPetsPage'}) : super(key: key);
  @override
  dogInfoPageState createState() => dogInfoPageState();
}

class dogInfoPageState extends State<dogInfoPage> {
  // final ListPetsStore store = Modular.get();

  info(text1, {width, alignment, text2}) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      padding: EdgeInsets.only(
        top: screenWidth * 0.013,
      ),
      child: RichText(
        textAlign: alignment ?? TextAlign.left,
        text: TextSpan(
            text: text1,
            style: TextStyle(
              fontSize: screenHeight * 0.024,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
            children: <TextSpan>[
              TextSpan(
                text: text2,
                style: TextStyle(
                  fontSize: screenHeight * 0.022,
                  fontWeight: FontWeight.w500,
                  color: Colors.black87,
                ),
              ),
            ]),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            CabecalhoNavigation(nameTela: InfoDogSelect.name),
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
                        ImagePets(
                          imageDataBase: InfoDogSelect.image,
                          heightImage: screenHeight * 0.28,
                          widthImage: screenWidth * 0.9,
                        ),
                        SizedBox(height: screenHeight * 0.04),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Infos',
                              style: TextStyle(
                                fontSize: screenHeight * 0.03,
                                fontWeight: FontWeight.w700,
                                color: const Color(0xffF15A23),
                              ),
                            ),
                            SizedBox(height: screenHeight * 0.01),
                            info('Name: ', text2: InfoDogSelect.name),
                            info('Life span: ', text2: InfoDogSelect.lifeSpan),
                            info('Temperament: ',
                                text2: InfoDogSelect.temperament),
                            info('Bred for: ', text2: InfoDogSelect.bredFor),
                            if (InfoDogSelect.origin != null)
                              info('Origin: ', text2: InfoDogSelect.origin),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
