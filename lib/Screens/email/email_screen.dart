import 'package:flutter/material.dart';

import '../../colors.dart';
import '../../models/Email.dart';
import 'components/header.dart';

class EmailScreen extends StatelessWidget {
  const EmailScreen({
    Key? key,
    this.email,
  }) : super(key: key);

  final Email? email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: SafeArea(
          child: Column(
            children: [
              const Header(),
              const Divider(thickness: 1),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(kDefaultPadding),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(width: kDefaultPadding),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        " ${emails[1].name}",
                                      ),
                                      Text(
                                        "UBHVvhgmYVH7878ghvKHJB",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline6,
                                      )
                                    ],
                                  ),
                                ),
                                const SizedBox(width: kDefaultPadding / 2),
                                Text(
                                  "Today at 15:32",
                                  style: Theme.of(context).textTheme.caption,
                                ),
                              ],
                            ),
                            const SizedBox(height: kDefaultPadding),
                            const Text("Geliefert an"),

                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              height: 200,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black),
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text("Bezahlverfahren"),

                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              "PAYPAL",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text("Kundenkontakt"),

                            const SizedBox(
                              height: 10,
                            ),
                            Card(
                              color: Colors.black,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              child: const ListTile(
                                title: Text(
                                  "+4915777655015",
                                  style: TextStyle(
                                      fontSize: 18,

                                      color: Colors.white),
                                ),
                                trailing: CircleAvatar(
                                  radius: 20,
                                  backgroundColor: Colors.white,
                                  child: Icon(Icons.call, color: Colors.black,size: 15,),),
                              ),
                            )

                            // LayoutBuilder(
                            //   builder: (context, constraints) => SizedBox(
                            //     width: constraints.maxWidth > 850
                            //         ? 800
                            //         : constraints.maxWidth,
                            //     child: Column(
                            //       crossAxisAlignment: CrossAxisAlignment.start,
                            //       children: [
                            //         Text(
                            //           "Hello my love, \n \nSunt architecto voluptatum esse tempora sint nihil minus incidunt nisi. Perspiciatis natus quo unde magnam numquam pariatur amet ut. Perspiciatis ab totam. Ut labore maxime provident. Voluptate ea omnis et ipsum asperiores laborum repellat explicabo fuga. Dolore voluptatem praesentium quis eos laborum dolores cupiditate nemo labore. \n \nLove you, \n\nElvia",
                            //           style: TextStyle(
                            //             height: 1.5,
                            //             color: Color(0xFF4D5875),
                            //             fontWeight: FontWeight.w300,
                            //           ),
                            //         ),
                            //         SizedBox(height: kDefaultPadding),
                            //         Row(
                            //           children: [
                            //             Text(
                            //               "6 attachments",
                            //               style: TextStyle(fontSize: 12),
                            //             ),
                            //             Spacer(),
                            //             Text(
                            //               "Download All",
                            //               style: Theme.of(context)
                            //                   .textTheme
                            //                   .caption,
                            //             ),
                            //             SizedBox(width: kDefaultPadding / 4),
                            //             Icon(Icons.ac_unit)
                            //           ],
                            //         ),
                            //         Divider(thickness: 1),
                            //         SizedBox(height: kDefaultPadding / 2),
                            //
                            //       ],
                            //     ),
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
