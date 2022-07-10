import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:flutter_triple/flutter_triple.dart';

import '../../../widgets/cabecalhoNavigation.dart';
import '../../../widgets/imagePets.dart';
import '../domain/listDogs_model.dart';
import '../store/listDogs_store.dart';

class InfoDogSelect {
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
}

class ListDogsPage extends StatefulWidget {
  final String title;
  const ListDogsPage({Key? key, this.title = 'ListDogPage'}) : super(key: key);
  @override
  ListDogsPageState createState() => ListDogsPageState();
}

class ListDogsPageState extends State<ListDogsPage> {
  final ListDogsStore storeDogs = Modular.get();

  @override
  void initState() {
    super.initState();
    storeDogs.listDogs();
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            CabecalhoNavigation(nameTela: 'CÃES'),
            SingleChildScrollView(
              child: Column(
                children: [
                  ScopedBuilder<ListDogsStore, Exception, List<ListDogsModel>>(
                    store: storeDogs,
                    onLoading: (context) =>
                        const Center(child: CircularProgressIndicator()),
                    onState: (context, List<ListDogsModel> state) {
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
                                              InfoDogSelect.weightImperial =
                                                  state[index].weight!.imperial;
                                              InfoDogSelect.weightMetric =
                                                  state[index].weight!.metric;
                                              InfoDogSelect.heightImperial =
                                                  state[index].height!.imperial;
                                              InfoDogSelect.heightMetric =
                                                  state[index].height!.metric;
                                              InfoDogSelect.name =
                                                  state[index].name;
                                              InfoDogSelect.bredFor =
                                                  state[index].bredFor;
                                              InfoDogSelect.lifeSpan =
                                                  state[index].lifeSpan;
                                              InfoDogSelect.temperament =
                                                  state[index].temperament;
                                              InfoDogSelect.origin =
                                                  state[index].origin;
                                              InfoDogSelect.image =
                                                  state[index].image!.url;

                                              Modular.to.pushNamed(
                                                  '/listPets/infoDog');
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
                                                      '${state[index].image!.url}',
                                                ),
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
