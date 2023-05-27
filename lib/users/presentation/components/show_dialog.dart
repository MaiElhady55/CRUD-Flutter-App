import 'package:flutter/material.dart';
import 'package:rise_up_task/core/utils/styles.dart';
import 'package:rise_up_task/users/presentation/components/main_text_button.dart';

void showDeleteDialog(BuildContext context,void Function() function) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text('Delete Users ', style: Styles.textStyle18),
        content: Text('Do You sure to delete user ?', style: Styles.textStyle18.copyWith(fontWeight: FontWeight.normal)),
        actions: [
          MainTextButton(
            text: 'Cancel',
            function: () => Navigator.pop(context),
            textStyle: Styles.textStyle18,
          ),
          MainTextButton(
            text: 'Delete',
            function:function ,
            textStyle: Styles.textStyle18.copyWith(color: Colors.red),
          ),
        ],
        elevation: 24,
      );
    },
  );
}