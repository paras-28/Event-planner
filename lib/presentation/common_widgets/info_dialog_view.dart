import 'package:flutter/material.dart';

import 'text_view.dart';


class InfoDialogViewGet extends StatelessWidget {
  final String message;
  final String title;
  final Function? onPressed;

  const InfoDialogViewGet(
      {super.key,
        required this.message,
        this.onPressed,
        this.title = "Message"});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Dialog(
      child:  Container(
          width: size.width * .85,
          height: size.height * .25,
          padding: const EdgeInsets.symmetric(horizontal: 13.0),
          child: Column(
            children: [
              TextView(
                title:  title,
                fontSize: 20,
                fontWeight: FontWeight.w800,
                margin: const EdgeInsets.only(top: 20),
              ),
              const Spacer(
                flex: 2,
              ),
              TextView(
                title:  message,
                maxLine: 4,
                overflow: TextOverflow.ellipsis,
                fontSize: 16,
              ),
              const Spacer(
                flex: 2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      if (onPressed != null) {
                        onPressed!();
                      } else {
                        // Get.back();
                      }
                    },
                    child: const TextView(
                      title: 'Dismiss',
                      fontSize: 17,
                      textColor: Colors.black,
                    ),
                  ),
                  // const SizedBox(
                  //   width: 50,
                  // ),
                ],
              ),
              const Spacer(),
            ],
          )),
    );
  }
}