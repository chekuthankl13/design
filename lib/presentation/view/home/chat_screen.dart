import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:trogon/core/utils/utils.dart';
import 'package:trogon/presentation/view/home/flash_card_screen.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();

  static final route = MaterialPageRoute(builder: (_) => const ChatScreen());

}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        elevation: 10,
        leading:Container(
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
          child: const Icon(Icons.close),
        ),
        title:Row(
          children: [
          const  Icon(Icons.message),
            spaceWidth(20), 
           const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [Text(
                "JHON DOE", 
                style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),
              ), 
              
              Text("online",style: TextStyle(fontSize: 10,color:Color.fromRGBO(164, 13, 238, 1) ),)
              ],
            )
          ],
        ) ,
        actions:const [ Icon(Icons.more_vert_outlined)],
      ),
      bottomNavigationBar: btmBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
        backgroundColor:const Color.fromRGBO(164, 13, 238, 1),
        onPressed: (){}, 
      child:Image.network("https://s3-alpha-sig.figma.com/img/89eb/2c9a/d0f8b070422ad1e9e907c29c8a7726e6?Expires=1732492800&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=e5PQkbede-vdcOyvNChtzrHSFQYghdjuVxcEagbb9P7p-y5Eysan02q8Y9x~LHSIEjNv-EZLkcl-Ru9H8UDdM9J-K4LAE9z5eMCctij2IRZrQ672q1vZSahvc26FGWC0nlVvNeZ7DIO0qybwBiKR5MPpeIAtC38LORBrxxoGWbeXNgvSpTzMMLhmwidZ1-PbbMb1QgM71F64Uhe8FOETeEpbXpRzDCtjIVA9li7MUF7~Fn2CanS5SeXlnAagnjS4qe4FxVOE6BKG6AKMalLAcAyOKmdvrQgZFYOI~nyWLg98phlrRdE-lO7oRG4TjfCb~n6eSZGi~JjjstKRsGDCAw__"),
      ),
      body: ListView.builder(
        itemCount: dummy.length,
        shrinkWrap: true,
        physics: const ScrollPhysics(),
        itemBuilder: (context, index) {
          var data = dummy[index];
          return dummytile(context,txt1: data['txt1'],txt2: data['txt2']);
        },),
    );
  }

  BottomAppBar btmBar() {
    return BottomAppBar(
      height: kToolbarHeight+10,
    padding: const EdgeInsets.symmetric(horizontal: 10),

    surfaceTintColor: Colors.transparent,
    elevation: 5,
    color: Colors.white, // Colors.grey[100],
    notchMargin: 25,
    shape: const CircularNotchedRectangle(),
    
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        GestureDetector(
          onTap: (){
            SystemChannels.textInput.invokeMethod("TextInput.show");
          },
          child: Container(
            height: 50,
            width: 50, 
            decoration: BoxDecoration(
              shape: BoxShape.circle, 
              color: Colors.grey[200]
            ),
            child:const Icon(Icons.keyboard),
          ),
        ),
         GestureDetector(
          onTap: (){
            navigatorKey.currentState!.push(MaterialPageRoute(builder: (_)=>const FlashCardScreen()));
          },
           child: Container(
            height: 50,
            width: 50, 
            decoration: BoxDecoration(
              shape: BoxShape.circle, 
              color: Colors.grey[200]
            ),
            child:const Icon(Icons.arrow_forward_ios_outlined),
                   ),
         ),
      ],
    ),
    );
  }

  Container dummytile(BuildContext context,{txt1,txt2}) {
    return Container(
      padding:const EdgeInsets.all(10),
      
      width: sW(context),
      
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                "https://s3-alpha-sig.figma.com/img/89eb/2c9a/d0f8b070422ad1e9e907c29c8a7726e6?Expires=1732492800&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=e5PQkbede-vdcOyvNChtzrHSFQYghdjuVxcEagbb9P7p-y5Eysan02q8Y9x~LHSIEjNv-EZLkcl-Ru9H8UDdM9J-K4LAE9z5eMCctij2IRZrQ672q1vZSahvc26FGWC0nlVvNeZ7DIO0qybwBiKR5MPpeIAtC38LORBrxxoGWbeXNgvSpTzMMLhmwidZ1-PbbMb1QgM71F64Uhe8FOETeEpbXpRzDCtjIVA9li7MUF7~Fn2CanS5SeXlnAagnjS4qe4FxVOE6BKG6AKMalLAcAyOKmdvrQgZFYOI~nyWLg98phlrRdE-lO7oRG4TjfCb~n6eSZGi~JjjstKRsGDCAw__", 
                height: 50,
                width: 50,
                ),
              spaceWidth(10),
              Expanded(
                child: Container(
                  padding:const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                
                 
                  decoration:const BoxDecoration(
                    borderRadius: BorderRadius.only(topRight: Radius.circular(30),bottomLeft:  Radius.circular(30),bottomRight:  Radius.circular(30)),
                    color: Color.fromRGBO(18, 56, 87, 1)
                  ),
                  child:Text(txt1,style:const TextStyle(fontSize: 15, color: Colors.white,fontWeight: FontWeight.w500)) ,
                ),
              ),
            ],
          ), 
          spaceHeight(20), 
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                child: Container(
                  padding:const EdgeInsets.all(10),
                  
                  decoration:const BoxDecoration(
                    borderRadius: BorderRadius.only(topRight: Radius.circular(30),bottomLeft:  Radius.circular(30),topLeft:  Radius.circular(30)),
                    color: Colors.white
                  ),
                  child: Text(txt2,style:const TextStyle(fontSize: 15,fontWeight: FontWeight.w500),),
                ),
              ),
              spaceWidth(15),
             const CircleAvatar()
            ],
          ), 
          spaceHeight(10)
        ],
      ),
    );
  }
}

const dummy = [
  {"txt1":"imply dummy text of the printing and typesetting industry",
  "txt2":" their infancy. Various versions have evolved over the years, som"
  },
  {"txt1":"ease of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lo",
  "txt2":" their infancy. Various versions have "
  },
  {"txt1":"it has a more-or-",
  "txt2":" There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a diction "
  },
  {"txt1":"imply dummy text of the printing and typesetting industry",
  "txt2":" their infancy. Various versions have evolved over the years, som"
  },
  {"txt1":"ease of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lo",
  "txt2":" their infancy. Various versions have "
  },
  {"txt1":"it has a more-or-",
  "txt2":" There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a diction "
  },{"txt1":"imply dummy text of the printing and typesetting industry",
  "txt2":" their infancy. Various versions have evolved over the years, som"
  },
  {"txt1":"ease of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lo",
  "txt2":" their infancy. Various versions have "
  },
  {"txt1":"it has a more-or-",
  "txt2":" There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a diction "
  },{"txt1":"imply dummy text of the printing and typesetting industry",
  "txt2":" their infancy. Various versions have evolved over the years, som"
  },
  {"txt1":"ease of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lo",
  "txt2":" their infancy. Various versions have "
  },
  {"txt1":"it has a more-or-",
  "txt2":" There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a diction "
  },{"txt1":"imply dummy text of the printing and typesetting industry",
  "txt2":" their infancy. Various versions have evolved over the years, som"
  },
  {"txt1":"ease of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lo",
  "txt2":" their infancy. Various versions have "
  },
  {"txt1":"it has a more-or-",
  "txt2":" There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a diction "
  },{"txt1":"imply dummy text of the printing and typesetting industry",
  "txt2":" their infancy. Various versions have evolved over the years, som"
  },
  {"txt1":"ease of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lo",
  "txt2":" their infancy. Various versions have "
  },
  {"txt1":"it has a more-or-",
  "txt2":" There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a diction "
  },{"txt1":"imply dummy text of the printing and typesetting industry",
  "txt2":" their infancy. Various versions have evolved over the years, som"
  },
  {"txt1":"ease of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lo",
  "txt2":" their infancy. Various versions have "
  },
  {"txt1":"it has a more-or-",
  "txt2":" There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a diction "
  },{"txt1":"imply dummy text of the printing and typesetting industry",
  "txt2":" their infancy. Various versions have evolved over the years, som"
  },
  {"txt1":"ease of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lo",
  "txt2":" their infancy. Various versions have "
  },
  {"txt1":"it has a more-or-",
  "txt2":" There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a diction "
  },
];