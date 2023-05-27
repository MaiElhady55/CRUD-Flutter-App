import 'package:flutter/material.dart';
 
 showMySnackBar({required BuildContext context,required String text,required Color color}){
  return  ScaffoldMessenger.of(context)
                  .showSnackBar( SnackBar(
                    duration:const Duration(seconds: 2),
                    backgroundColor:color ,
                    content: Text(text)));
            }
