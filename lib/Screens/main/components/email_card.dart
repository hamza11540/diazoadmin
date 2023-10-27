import 'package:flutter/material.dart';

import '../../../colors.dart';
import '../../../extensions.dart';
import '../../../models/Email.dart';
import '../../../models/order_model.dart';

class OrderItemWidget extends StatelessWidget {
  final int tabIndex;
  final OrdersModel ordersModel;
  final VoidCallback? press;
  const OrderItemWidget(
      {Key? key, required this.tabIndex, required this.ordersModel, this.press})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    //  Here the shadow is not showing properly
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: kDefaultPadding, vertical: kDefaultPadding / 2),
      child: InkWell(
        onTap: press,
        child: Stack(
          children: [
            Container(
              padding: const EdgeInsets.all(kDefaultPadding),
              decoration: BoxDecoration(
                color: Colors.black26,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Text(
                        "OrderId: ",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          height: 1.5,
                          // color: isActive! ? Colors.white70 : null,
                          color: Colors.white70,
                        ),
                      ),
                      Text(
                        ordersModel.orderId ?? "",
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          height: 1.5,
                          color: Colors.white70,
                          // color: isActive! ? Colors.white70 : null,
                        ),
                      ),
                    ],
                  ),
                  const Divider(),
                  // Text(
                  //   ordersModel??"",
                  //   style: TextStyle(
                  //     fontSize: 16,
                  //     fontWeight: FontWeight.w500,
                  //     color: isActive! ? Colors.white : kTextColor,
                  //   ),
                  // ),

                  // Row(
                  //   children: [
                  //     Expanded(
                  //       child: Text.rich(
                  //         TextSpan(
                  //           text: "${email?.name} \n",
                  //           style: TextStyle(
                  //             fontSize: 16,
                  //             fontWeight: FontWeight.w500,
                  //             color: isActive! ? Colors.white : kTextColor,
                  //           ),
                  //           children: [
                  //             TextSpan(
                  //               text: email?.subject,
                  //               style: Theme.of(context)
                  //                   .textTheme
                  //                   .bodyText2
                  //                   ?.copyWith(
                  //                     color:
                  //                         isActive! ? Colors.white : kTextColor,
                  //                   ),
                  //             ),
                  //           ],
                  //         ),
                  //       ),
                  //     ),
                  //     Column(
                  //       children: [
                  //         Text(
                  //           email?.time ?? "",
                  //           style:
                  //               Theme.of(context).textTheme.caption?.copyWith(
                  //                     color: isActive! ? Colors.white70 : null,
                  //                   ),
                  //         ),
                  //         SizedBox(height: 5),
                  //         if (email?.isAttachmentAvailable ?? true)
                  //           Icon(
                  //             Icons.abc,
                  //             color: isActive! ? Colors.white70 : kGrayColor,
                  //           )
                  //       ],
                  //     ),
                  //   ],
                  // ),
                  const SizedBox(height: kDefaultPadding / 2),
                  Row(
                    children: [
                      const Text(
                        "Customer: ",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          height: 1.5,
                          // color: isActive! ? Colors.white70 : null,
                          color: Colors.white70,
                        ),
                      ),
                      Text(
                        ordersModel.userName ?? "",
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          height: 1.5,
                          // color: isActive! ? Colors.white70 : null,
                          color: Colors.white70,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Row(
                    children: [
                      const Text(
                        "Items: ",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          height: 1.5,
                          // color: isActive! ? Colors.white70 : null,
                          color: Colors.white70,
                        ),
                      ),
                      Text(
                        ordersModel.totalItems.toString() ?? "",
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          height: 1.5,
                          // color: isActive! ? Colors.white70 : null,
                          color: Colors.white70,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Row(
                    children: [
                      const Text(
                        "Contact: ",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          height: 1.5,
                          // color: isActive! ? Colors.white70 : null,
                          color: Colors.white70,
                        ),
                      ),
                      Text(
                        ordersModel.userPhone ?? "",
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          height: 1.5,
                          // color: isActive! ? Colors.white70 : null,
                          color: Colors.white70,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ).addNeumorphism(
              blurRadius: 15,
              borderRadius: 15,
              offset: Offset(5, 5),
              topShadowColor: Colors.white60,
              bottomShadowColor: Color(0xFF234395).withOpacity(0.15),
            ),
            // if (email?.isChecked != null)
            //   Positioned(
            //     right: 8,
            //     top: 8,
            //     child: Container(
            //       height: 12,
            //       width: 12,
            //       decoration: const BoxDecoration(
            //         shape: BoxShape.circle,
            //         color: kBadgeColor,
            //       ),
            //     ).addNeumorphism(
            //       blurRadius: 4,
            //       borderRadius: 8,
            //       offset: const Offset(2, 2),
            //     ),
            //   ),
            // if (email?.tagColor != null)
            //   Positioned(
            //     left: 8,
            //     top: 0,
            //     child: Icon(
            //       Icons.accessible,
            //       size: 18,
            //       color: email?.tagColor,
            //     ),
            //   )
          ],
        ),
      ),
    );
  }
}
