import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:flutter_triple/flutter_triple.dart';

import '../../../widgets/cabecalhoNavigation.dart';
import '../../../widgets/imagePets.dart';
import '../domain/listCats_model.dart';
import '../store/listCats_store.dart';

class InfoCatSelect {
  static String? weightImperial;
  static String? weightMetric;
  static String? heightImperial;
  static String? heightMetric;

  static String? name;
  static String? bredFor;
  static String? lifeSpan;
  static String? temperament;
  static String? origin;
  static String? image;
  static String? description;
}

class ListCatsPage extends StatefulWidget {
  final String title;
  const ListCatsPage({Key? key, this.title = 'ListCatPage'}) : super(key: key);
  @override
  ListCatsPageState createState() => ListCatsPageState();
}

class ListCatsPageState extends State<ListCatsPage> {
  final ListCatsStore storeCats = Modular.get();

  @override
  void initState() {
    super.initState();
    storeCats.listCats();
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            CabecalhoNavigation(nameTela: 'GATOS'),
            SingleChildScrollView(
              child: Column(
                children: [
                  ScopedBuilder<ListCatsStore, Exception, List<ListCatsModel>>(
                    store: storeCats,
                    onLoading: (context) =>
                        const Center(child: CircularProgressIndicator()),
                    onState: (context, List<ListCatsModel> state) {
                      return Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                              left: screenWidth * 0.01,
                              right: screenWidth * 0.01,
                              top: screenHeight * 0.01,
                              bottom: screenHeight * 0.02,
                            ),
                            child: Container(
                              padding: const EdgeInsets.only(
                                bottom: 5,
                                top: 5,
                              ),
                              width: screenWidth,
                              height: screenHeight * 0.83,
                              child: ListView.builder(
                                itemCount: state.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: EdgeInsets.only(
                                      left: screenHeight * 0.015,
                                      right: screenHeight * 0.015,
                                      top: screenHeight * 0.008,
                                      bottom: screenHeight * 0.008,
                                    ),
                                    child: Container(
                                      child: Container(
                                        height: screenHeight * 0.31,
                                        width: screenWidth,
                                        decoration: BoxDecoration(
                                          boxShadow: <BoxShadow>[
                                            BoxShadow(
                                              color:
                                                  Colors.black.withOpacity(0.3),
                                              offset: Offset(1, 1),
                                              blurRadius: 6,
                                              spreadRadius: 1,
                                            )
                                          ],
                                          borderRadius: BorderRadius.circular(
                                            15,
                                          ),
                                          color: Colors.white,
                                        ),
                                        child: InkWell(
                                          onTap: () async {
                                            setState(() {
                                              InfoCatSelect.name =
                                                  state[index].name;
                                              InfoCatSelect.lifeSpan =
                                                  state[index].lifeSpan;
                                              InfoCatSelect.temperament =
                                                  state[index].temperament;
                                              InfoCatSelect.origin =
                                                  state[index].origin;
                                              InfoCatSelect.image =
                                                  state[index].image!.url;
                                              InfoCatSelect.description =
                                                  state[index].description;

                                              Modular.to.pushNamed(
                                                  '/listPets/infoCat');
                                            });
                                          },
                                          child: Container(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                ImagePets(
                                                    imageDataBase:
                                                        '${state[index].image?.url}'),
                                                SizedBox(
                                                    height:
                                                        screenHeight * 0.015),
                                                RichText(
                                                  text: TextSpan(
                                                    text:
                                                        '${state[index].name}',
                                                    style: TextStyle(
                                                      fontSize:
                                                          screenHeight * 0.025,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: const Color(
                                                          0xffE15D00),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
