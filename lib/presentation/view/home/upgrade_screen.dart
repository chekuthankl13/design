import 'package:flutter/material.dart';
import 'package:flutter_dash/flutter_dash.dart';
import 'package:trogon/core/utils/utils.dart';

class UpgradeScreen extends StatefulWidget {
  const UpgradeScreen({super.key});

  @override
  State<UpgradeScreen> createState() => _UpgradeScreenState();
}

class _UpgradeScreenState extends State<UpgradeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: appbar(),
      body:SizedBox(
        height: sH(context),
        child: Stack(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              height: 300,
              width: sW(context),
              decoration:const BoxDecoration(
                 gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Color.fromRGBO(164, 13, 238, 1),
                            Color.fromRGBO(156, 30, 194, 0.93),
                          ])
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 20),
                        height: 50,
                        width: 50, 
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle, 
                          color: Colors.white60
                        ),
                        child: const Icon(Icons.close,color: Colors.white,),
                      ),
                      
                    ],
                  ), 
                  const Text("  UPGRADE", style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w500,color: Colors.white),),
const Text("Unlock Premium Features And Take \n Your English Skills tO tHE nEXT lEVEL.", 
style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w200,color: Colors.white)
), 
spaceHeight(20), 
Row(
  children: [
    Container(
      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20), 
        color: Colors.white
      ),
      child: const Text("Basic",style: TextStyle(fontWeight: FontWeight.bold),),
    ), 
    spaceWidth(10), 
     tile2("Gold"), 
     spaceWidth(10), 
     tile2("Platinum"), 
  ],
)
                ],
              ),
            ), 
Positioned(
  top: 250,
  child: Container(
    margin: const EdgeInsets.symmetric(horizontal: 20),
    height: 600,
    width: sW(context)-40,
    decoration: BoxDecoration(
      boxShadow: const [
        BoxShadow(color: Colors.black12,blurRadius: 2)
      ],
      color: Colors.white, 
      borderRadius: BorderRadius.circular(20)
    ),
    child: Column(
      children: [
        ClipPath(
          clipper: MySecondClipper(),
          child: Container(
            padding: const EdgeInsets.all(10),
            height: 80,
            decoration: const BoxDecoration(
                color: Color.fromRGBO(255, 230, 122, 1), 
                borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20))
              ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                
                Text("BASIC",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),), 
                 Text("₹ 4500",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),), 
                
              ],
            ),
          ),
        ), 
        spaceHeight(50), 
        tile4("Self-paced learning - I am self-motivated and disciplined to learn by myself through recorded lessons.")
      ,tile4("Recorded Lessons by Aparna (6-month validity)"), 
      tile4(
        isend: true,
        "AI-powered speech/pronunciation practice is available for 2 weeks with an option to extend with an additional add-on subscription.")
    , spaceHeight(30),
    //  RichText(text: TextSpan(
    //   text: "Anyone can add on more time with Ai features. ",
    //   children: [
    //     TextSpan(text: " Rs. 300/ month.")
    //   ]
    //  ))
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: RichText(
          
          softWrap: true,
          text: const TextSpan(
            text: 'Anyone can add on more time with Ai features.  ',
            style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500),
            children: <TextSpan>[
              TextSpan(
                  text: ' Rs. 300/ month.', style: TextStyle(fontWeight: FontWeight.bold,color:Color.fromRGBO(255, 230, 122, 1) )),
            ],
          ), textScaler: TextScaler.linear(1),
        ),
    ),
      spaceHeight(20), 
       Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: RichText(
          
          softWrap: true,
          text: const TextSpan(
            text: 'The difference is basic only has',
            style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500),
            children: <TextSpan>[
              TextSpan(
                  text: ' 2 weeks free vs. Gold ', style: TextStyle(fontWeight: FontWeight.bold,color:Color.fromRGBO(255, 230, 122, 1) )),
            ],
          ), textScaler: TextScaler.linear(1),
        ),
    ),
    //
      ],
    ),
  ),
)

          ],
        ),
      ) ,
    );
  }

  BottomAppBar appbar() => BottomAppBar(
    color: Colors.white,
    elevation: 10,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             Text("₹ 4500",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
             Text("For 3 Months Plan",style: TextStyle(fontSize: 12,color: Color.fromRGBO(139, 133, 133, 1)),)
          ],
        ), 
        ElevatedButton(onPressed: (){},
        style: ElevatedButton.styleFrom(
          
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
          foregroundColor: Colors.white, 
     backgroundColor: const Color.fromRGBO(164, 13, 238, 1)
        ),
         child:const Text("Buy Now") )
      ],
    ),
  );

  Padding tile4(txt,{isend=false}) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal:8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                Container(
                  height: 15,
                  width: 15,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle, 
                        border: Border.all(
                          width: 3,
                          color: const Color.fromRGBO(164, 13, 238, 1),),        
                    color: Colors.white
                  ),
                  
                
                ),
                !isend?
                const Dash(
                  dashColor: Colors.grey,
                  direction: Axis.vertical,
                  length: 70,
                ):const SizedBox()
              ],
            ), 
            spaceWidth(10), 
            Expanded(child: 
            Text(txt,style: const TextStyle(fontSize: 15),))
          ],
        ),
      );
  }

  Container tile2(txt) {
    return Container(
    padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20), 
      color: Colors.white24
    ),
    child: Text(txt,style: const TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
  );
  }
}

class MySecondClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, 0);


path.lineTo(0, size.height);





for (double i = 1; i < 500; i++) {
  path.lineTo(9 * i , size.height-8);
path.lineTo(9 *i , size.height);
}



    path.lineTo(size.width, size.height);

    path.lineTo(size.width, 0);
   path.close();
   return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}