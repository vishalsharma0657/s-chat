import 'package:flutter/material.dart';
import 'package:s_chat/Chat_Page/mesaagechat.dart';
class ChatDetailPage extends StatefulWidget{
  const ChatDetailPage({Key? key}) : super(key: key);

  @override
  _ChatDetailPageState createState() => _ChatDetailPageState();
 

}
 List<ChatMessage> messages = [
    ChatMessage(messageContent: "Hello, Nitesh", messageType: "receiver"),
    ChatMessage(messageContent: "Tumse call kiye hue kitna din ho gaya", messageType: "receiver"),
    ChatMessage(messageContent: "Hey Nitesh babu aisa mat bolo Hey Nitesh babu aisa mat bolo Hey Nitesh babu aisa mat bolo Hey Nitesh babu aisa mat bolo Hey Nitesh babu aisa mat bolo Hey Nitesh babu aisa mat bolo Hey Nitesh babu aisa mat bolo Hey Nitesh babu aisa mat bolo Hey Nitesh babu aisa mat bolo Hey Nitesh babu aisa mat bolo ", messageType: "sender"),
    ChatMessage(messageContent: "ehhhh, doing OK.", messageType: "receiver"),
    ChatMessage(messageContent: "Is there any thing wrong?", messageType: "sender"),
  ];

class _ChatDetailPageState extends State<ChatDetailPage> {

  @override
  Widget build(BuildContext context) {
   return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        flexibleSpace: SafeArea(
          child: Container(
            padding: const EdgeInsets.only(right: 16),
            child: Row(
              children: <Widget>[
                IconButton(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back,color: Colors.black,),
                ),
                const SizedBox(width: 2,),
                CircleAvatar(
                  child: Icon(Icons.person,color: Colors.blue[400],),
                  maxRadius: 20,
                  
                ),
                const SizedBox(width: 12,),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text("VISHAL SHARMA",style: TextStyle( fontSize: 16 ,fontWeight: FontWeight.w600),),
                      const SizedBox(height: 6,),
                      Text("Online",style: TextStyle(color: Colors.grey.shade600, fontSize: 13),),
                    ],
                  ),
                ),
                const Icon(Icons.settings,color: Colors.black54,),
              ],
            ),
          ),
        ),
      ),
     body: Stack(
        children: <Widget>[
           ListView.builder(
            itemCount: messages.length,
            shrinkWrap: true,
            padding: const EdgeInsets.only(top: 10,bottom: 10),
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index){
              return Container(
                padding: const EdgeInsets.only(left: 16,right: 16,top: 10,bottom: 10),
                 child: Align(
        alignment: (messages[index].messageType == "receiver"?Alignment.topRight:Alignment.topLeft),
        child: Container(
        constraints: const BoxConstraints(maxWidth: 250),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: (messages[index].messageType  == "receiver"?Colors.white:Colors.blue[200]),
          ),
          padding: const EdgeInsets.all(16),
                child: Text(messages[index].messageContent,style: const TextStyle(color: Colors.black),),
                
             ),
      ),
    );
  },
),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              padding: const EdgeInsets.only(left: 10,bottom: 10,top: 10),
              height: 60,
              width: double.infinity,
              color: Colors.white,
              child: Row(
                children: <Widget>[
                  GestureDetector(
                    onTap: (){
                    },
                    child: Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        color: Colors.indigo[900],
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: const Icon(Icons.add, color: Colors.white, size: 20, ),
                    ),
                  ),
                  const SizedBox(width: 15,),
                  const Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Write message...",
                        hintStyle: TextStyle(color: Colors.black54),
                        border: InputBorder.none
                      ),
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  const SizedBox(width: 15,),
                  FloatingActionButton(
                    onPressed: (){},
                    child: const Icon(Icons.send,color: Colors.white,size: 18,),
                    backgroundColor: Colors.indigo[900],
                    elevation: 0,
                  ),
                ],
                
              ),
            ),
          ),
        ],
      ),
    );
  }
  
}
