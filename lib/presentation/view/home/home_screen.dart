import 'package:carousel_slider/carousel_slider.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trogon/core/utils/utils.dart';
import 'package:trogon/presentation/bloc/home_cubit.dart';
import 'package:trogon/presentation/view/home/chat_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static final route = MaterialPageRoute(builder: (_) => const HomeScreen());

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CarouselSliderController buttonCarouselController =
      CarouselSliderController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ClipPath(
            clipper: MyClipper(),
            child: Container(
                padding: const EdgeInsets.only(top: 50),
                height: 200,
                width: sW(context),
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                      Color.fromRGBO(164, 13, 238, 1),
                      Color.fromRGBO(156, 30, 194, 0.93),
                    ])),
                child: SizedBox(
                  height: 50,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      spaceWidth(10),
                      Container(
                        height: 45,
                        width: 45,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white),
                            shape: BoxShape.circle),
                        child: const Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                        ),
                      ),
                      const Expanded(child: SizedBox()),
                      const Text(
                        "Flash Card",
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                            fontSize: 25),
                      ),
                      const Expanded(child: SizedBox()),
                    ],
                  ),
                )),
          ),

          // Stack(
          //   children: [
          //     Container(
          //       height: 200,
          //       width: sW(context),
          //       color: Colors.white,
          //     ),
          //     Positioned(
          //       top: -250,
          //       left: -50,
          //       right: -50,
          //       child: Container(
          //         height: 450,
          //         width: 500,
          //         decoration: const BoxDecoration(
          //             shape: BoxShape.circle,
          //             gradient: LinearGradient(
          //                 begin: Alignment.topLeft,
          //                 end: Alignment.bottomRight,
          //                 colors: [
          //                   Color.fromRGBO(164, 13, 238, 1),
          //                   Color.fromRGBO(156, 30, 194, 0.93),
          //                 ])),
          //       ),
          //     ),
          //     Positioned(
          //       top: 30,
          //       left: 0,
          //       right: 0,
          // child: SizedBox(
          //   height: 50,
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     children: [
          //       spaceWidth(10),
          //       Container(
          //         height: 45,
          //         width: 45,
          //         decoration: BoxDecoration(
          //             border: Border.all(color: Colors.white),
          //             shape: BoxShape.circle),
          //         child: const Icon(
          //           Icons.arrow_back_ios,
          //           color: Colors.white,
          //         ),
          //       ),
          //       const Expanded(child: SizedBox()),
          //       const Text(
          //         "Flash Card",
          //         style: TextStyle(
          //             fontWeight: FontWeight.w400,
          //             color: Colors.white,
          //             fontSize: 25),
          //       ),
          //       const Expanded(child: SizedBox()),
          //     ],
          //   ),
          //       ),
          //     )
          //   ],
          // ),

          spaceHeight(20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Everyday Phrases",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
              spaceWidth(50),
              BlocBuilder<HomeCubit, int>(
                builder: (context, state) {
                  return Stack(
                    alignment: Alignment.center,
                    children: [
                      CircularProgressIndicator(
                        semanticsLabel: "kkk",
                        value: state / (15 - 1),
                        strokeWidth: 8,
                        strokeAlign: 2,
                        color: const Color.fromRGBO(164, 13, 238, 1),
                        strokeCap: StrokeCap.round,
                      ),
                      Text(
                        "$state/15",
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      )
                    ],
                  );
                },
              ),
              // Container(
              //   height: 60,
              //   width: 60,
              //   alignment: Alignment.center,
              //   decoration: BoxDecoration(
              //       border: Border.all(
              //         width: 5,
              //         color: const Color.fromRGBO(164, 13, 238, 1),
              //       ),
              //       shape: BoxShape.circle),
              //   child: BlocBuilder<HomeCubit, int>(
              //     builder: (context, state) {
              //       return Text(
              //         "$state/15",
              //         style: const TextStyle(fontWeight: FontWeight.bold),
              //       );
              //     },
              //   ),
              // ),
            ],
          ),

          spaceHeight(50),

          /// slider

          CarouselSlider(
            carouselController: buttonCarouselController,
            options: CarouselOptions(
              height: 300,
              autoPlay: false,
              enlargeCenterPage: true,
              viewportFraction: 0.7,
              // aspectRatio: 2.0,
              // initialPage: 2,
            ),
            items: dummyData.map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return FlipCard(
                    fill: Fill
                        .fillBack, // Fill the back side of the card to make in the same size as the front.
                    direction: FlipDirection.HORIZONTAL, // default
                    side: CardSide.FRONT, // The side to initially display.
                    front: Container(
                      height: 300,
                      width: sW(context) - 10,
                      margin: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          gradient: const LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Color.fromRGBO(164, 13, 238, 1),
                                Color.fromRGBO(156, 30, 194, 0.93),
                              ])),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            i['txt'].toString(),
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.white),
                          ),
                          spaceHeight(30),
                          Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                              boxShadow: const [
                                BoxShadow(color: Colors.black26, blurRadius: 2)
                              ],
                              color: Colors.grey[100],
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Icon(
                              Icons.arrow_forward_ios_rounded,
                            ),
                          )
                        ],
                      ),
                    ),

                    back: Container(
                      height: 300,
                      width: sW(context) - 20,
                      padding: const EdgeInsets.all(8),
                      margin: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          gradient: const LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Color.fromRGBO(164, 13, 238, 1),
                                Color.fromRGBO(156, 30, 194, 0.93),
                              ])),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            i['meaning'].toString(),
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 17,
                                color: Colors.white),
                          )
                        ],
                      ),
                    ),
                  );

                  // Container(
                  //   width: MediaQuery.of(context).size.width,
                  //   margin: EdgeInsets.symmetric(horizontal: 5.0),
                  //   decoration: BoxDecoration(
                  //     color: Colors.amber
                  //   ),
                  //   child: Text('text $i', style: TextStyle(fontSize: 16.0),)
                  // );
                },
              );
            }).toList(),
          ),
          spaceHeight(50),
          BlocBuilder<HomeCubit, int>(
            builder: (context, state) {
              return Row(
                mainAxisAlignment: state != 1
                    ? MainAxisAlignment.spaceAround
                    : MainAxisAlignment.center,
                children: [
                  state != 1
                      ? OutlinedButton(
                          onPressed: () {
                            context.read<HomeCubit>().updatePrevius();
                            buttonCarouselController.previousPage(
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.linear);
                          },
                          style: OutlinedButton.styleFrom(
                              foregroundColor: Colors.black,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  side: const BorderSide(
                                      width: 1,
                                      color: Color.fromRGBO(164, 13, 238, 1)))),
                          child: const Text("Previous"))
                      : const SizedBox(),
                  OutlinedButton(
                      onPressed: () {
                        if (state != 15) {
                          context.read<HomeCubit>().updateNext();

                          buttonCarouselController.nextPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.linear);
                        } else {
                          navigatorKey.currentState!.push(MaterialPageRoute(
                              builder: (_) => const ChatScreen()));
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                              side: const BorderSide(
                                  width: 5,
                                  color: Color.fromRGBO(164, 13, 238, 1)))),
                      child: const Text("Next"))
                ],
              );
            },
          )
        ],
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height / 2);

    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height / 2);

    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}

const dummyData = [
  {
    "txt": "obvious",
    "meaning":
        "easily perceived or understood; clear, self-evident, or apparent."
  },
  {
    "txt": "obvious",
    "meaning":
        "easily perceived or understood; clear, self-evident, or apparent."
  },
  {
    "txt": "obvious",
    "meaning":
        "easily perceived or understood; clear, self-evident, or apparent."
  },
  {
    "txt": "obvious",
    "meaning":
        "easily perceived or understood; clear, self-evident, or apparent."
  },
  {
    "txt": "obvious",
    "meaning":
        "easily perceived or understood; clear, self-evident, or apparent."
  },
  {
    "txt": "obvious",
    "meaning":
        "easily perceived or understood; clear, self-evident, or apparent."
  },
  {
    "txt": "obvious",
    "meaning":
        "easily perceived or understood; clear, self-evident, or apparent."
  },
  {
    "txt": "obvious",
    "meaning":
        "easily perceived or understood; clear, self-evident, or apparent."
  },
  {
    "txt": "obvious",
    "meaning":
        "easily perceived or understood; clear, self-evident, or apparent."
  },
  {
    "txt": "obvious",
    "meaning":
        "easily perceived or understood; clear, self-evident, or apparent."
  },
  {
    "txt": "obvious",
    "meaning":
        "easily perceived or understood; clear, self-evident, or apparent."
  },
  {
    "txt": "obvious",
    "meaning":
        "easily perceived or understood; clear, self-evident, or apparent."
  },
  {
    "txt": "obvious",
    "meaning":
        "easily perceived or understood; clear, self-evident, or apparent."
  },
  {
    "txt": "obvious",
    "meaning":
        "easily perceived or understood; clear, self-evident, or apparent."
  },
  {
    "txt": "obvious",
    "meaning":
        "easily perceived or understood; clear, self-evident, or apparent."
  },
];
