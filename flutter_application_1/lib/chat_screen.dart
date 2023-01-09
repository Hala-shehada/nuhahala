// import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/messageModel.dart';
import 'package:flutter_application_1/widgets/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatScreen extends StatefulWidget {
  static const String screenRoute = 'chat_Screen';
  const ChatScreen({Key? key}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}


class _ChatScreenState extends State<ChatScreen> {
  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  late User signedInUser ;
  String? messageText;

  // static String? id;
  // static FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  // static FirebaseFirestore firestore = FirebaseFirestore.instance;
  // static final storageRef = FirebaseStorage.instance.ref();

  //   static Future sendMessage(String uid, MessageModel message) async {
  //   await firestore
  //       .collection("users")
  //       .doc(firebaseAuth.currentUser!.uid)
  //       .collection("message")
  //       .doc(uid)
  //       .collection("chat")
  //       .doc(message.dateSend)
  //       .set(message.toJson());
  //   await firestore
  //       .collection("users")
  //       .doc(uid)
  //       .collection("message")
  //       .doc(firebaseAuth.currentUser!.uid)
  //       .collection("chat")
  //       .doc(message.dateSend)
  //       .set(message.toJson());
  // }


  @override
  void initState() {
    super.initState();
    getCurrentUser();

  }

  void getCurrentUser(){
    try{
      final user = _auth.currentUser;
      if(user != null){
          signedInUser = user;
        print(signedInUser.email);
      }

    }catch(e){
      print(e);
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Row(
          children: const [
            Icon(Icons.message,size: 25,),
            SizedBox(width: 10),
            Text('MessageMe')
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {
              _auth.signOut();
              Navigator.pop(context);
              
            },
            icon: const Icon(Icons.close),
          )
        ],
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(),
            Container(
              decoration: const BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: primaryColor,
                    width: 2,
                  ),
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: TextField(
                      onChanged: (value) {
                        messageText = value;
                        print(messageText);
                      },
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 20,
                        ),
                        hintText: 'Write your message here...',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () async{
                      await _firestore.collection('users').doc(FirebaseAuth.instance.currentUser!.uid).collection("chat").add({
                        // 'sender':signedInUser.email,
                        'text':messageText,
                      }).then((value) {
                        print("Success");
                      }).catchError((e){
                        print("===================");
                        print(e.toString());
                      });
                    },
                    child: const Text(
                      'send',
                      style: TextStyle(
                        color:Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
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