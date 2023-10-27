import 'package:flutter/material.dart';
import 'package:flutter_auth/base/base_widget.dart';


class InputDoneView extends BaseStateLessWidget {
   InputDoneView({Key? key, this.pFocusNode, this.nFocusNode}) : super(key: key);
  final FocusNode? pFocusNode;
  final FocusNode? nFocusNode;


  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.grey[200],
      elevation: 4.0,
      child: SizedBox(
        height: 45.0,
        width: double.infinity,
        child: SafeArea(
          top: false,
          bottom: false,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [

              IconButton(
                icon: const Icon(Icons.keyboard_arrow_up),
                tooltip: 'Previous',
                onPressed:  pFocusNode != null ? () {
                  FocusScope.of(context).requestFocus(pFocusNode ?? FocusNode());
                } : null,
              ),
              IconButton(
                icon: const Icon(Icons.keyboard_arrow_down),
                tooltip: 'Next',
                onPressed:  nFocusNode != null ? () {
                  FocusScope.of(context).requestFocus(nFocusNode ?? FocusNode());
                } : null,
              ),
            ],
          ),
        ),
      ),
    );
  }
}