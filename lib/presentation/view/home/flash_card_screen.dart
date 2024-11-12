import 'package:flutter/material.dart';
import 'package:trogon/core/utils/utils.dart';
import 'package:trogon/presentation/view/home/upgrade_screen.dart';

class FlashCardScreen extends StatefulWidget {
  const FlashCardScreen({super.key});

  @override
  State<FlashCardScreen> createState() => _FlashCardScreenState();
}

class _FlashCardScreenState extends State<FlashCardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        elevation: 5,
      leading:   Container(
          margin:const EdgeInsets.all(8),
          height: 20,
          width: 20,
          decoration:const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle, 
            boxShadow: [
              BoxShadow(color: Colors.black12,blurRadius: 2)
            ]
          ),
          child: const Icon(Icons.arrow_back_ios),
        ),
        centerTitle: true,
        title:const Text("Flash Cards"),
        actions: [IconButton(onPressed: (){
          navigatorKey.currentState!.push(MaterialPageRoute(builder: (_)=>const UpgradeScreen()));
        }, icon:const Icon(Icons.add))],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextFormField(
            decoration: InputDecoration(
              hintText: " search",
              prefixIcon:const Icon(Icons.search),
              fillColor: Colors.grey[200],
              enabled: true,
              filled: true,
              border:const OutlineInputBorder(borderSide: BorderSide.none)
            ),
          ), 
          spaceHeight(20), 
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                physics: const ScrollPhysics(),
                itemBuilder: (context, index) => tile(context),),
            ),
          ],
        ),
      ),
    );
  }

  Padding tile(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
         
Container(
padding: const EdgeInsets.all(10),
height: 200,
width: sW(context),
decoration: BoxDecoration(
  borderRadius: BorderRadius.circular(10),
  color: const Color.fromRGBO(249, 240, 205, .5)
),
child: Column(
  children: [
    const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("Everyday phrases",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
      
      Icon(Icons.more_vert_outlined)
      ],
    ), 
    spaceHeight(5), 
    const Text("Master Commoom Expression Used in Daily Conversations"), 
    spaceHeight(40), 
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ElevatedButton.icon(onPressed: (){},
        style: ElevatedButton.styleFrom(
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
          foregroundColor: Colors.white, 
          backgroundColor: const Color.fromRGBO(164, 13, 238, 1)
        ),
        icon: const Icon(Icons.add),label: const Text("Add Card"), ), 

        OutlinedButton(onPressed: (){},
         style: ElevatedButton.styleFrom(
          side: const BorderSide(color: Color.fromRGBO(164, 13, 238, 1)),
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
          foregroundColor: Colors.black, 
     
        ),
         child: const Text("Pratice"))
      ],
    )
  ],
),
),
Container(
height: 20,
width: sW(context)-50,
decoration: const BoxDecoration(
  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10),bottomRight: Radius.circular(10)),
  color: Color.fromRGBO(252, 244, 211, 1)
),
)

        ],
      ),
    );
  }
}