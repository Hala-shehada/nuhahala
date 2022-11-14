
import 'package:flutter/material.dart';
import 'package:flutter_application_1/pallete.dart';

enum DialogsAction {cancel, delete}

class AlertDialogs {
   static Future<DialogsAction> yesCancelDialog(
    BuildContext context,
    String title,
    String body,
   ) async {
    final action= await showDialog(
      context: context,
  barrierDismissible: false,
builder: (BuildContext context) {
   return AlertDialog(
     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
    title: Text (title, textAlign: TextAlign.center,style: pText,),
     content: Text(body,textAlign: TextAlign.center),
    actions: <Widget>[
        
       TextButton(
         onPressed: () => Navigator.of(context).pop(DialogsAction.cancel),
         child: const Text(
           'Cancel',
           style: TextStyle(
               color: Color(0xFFC41A38), fontWeight: FontWeight.w700), // TextStyle
         ), 
        ) ,
      TextButton(
        onPressed: () =>
            Navigator.of(context).pop(DialogsAction.delete),
         child: const Text(
           'Delete',
           style: TextStyle(
               color: Color (0xFFC41A3B), fontWeight: FontWeight.bold), // TextStyle
          ), // Text
       ), 
    ],
   ); 
},);
        return (action != null) ? action : DialogsAction.cancel;

        }
        }
