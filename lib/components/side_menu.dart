import 'package:flutter/material.dart';
import 'package:flutter_auth/view_model/order_detail_view_model.dart';
import 'package:provider/provider.dart';
import '../colors.dart';
import '../responsive.dart';
import 'side_menu_item.dart';

import 'package:flutter/foundation.dart' show kIsWeb;

class SideMenu extends StatelessWidget {
  const SideMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final OrderDetailViewModel orderDetailViewModel =
        context.watch<OrderDetailViewModel>();
    return Container(
      height: double.infinity,
      padding: const EdgeInsets.only(top: kIsWeb ? kDefaultPadding : 0),
      color: kBgLightColor,
      child: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    "assets/images/logo.png",
                    height: 200,
                    width: 150,
                  ),
                  const Spacer(),
                  // We don't want to show this close button on Desktop mood
                  if (!Responsive.isDesktop(context)) const CloseButton(),
                ],
              ),

              SideMenuItem(
                press: () {
                  orderDetailViewModel.changeCurrentIndex(0);
                },
                title: "Cooking",
                iconSrc: "assets/images/cooking.png",
                isActive: false,
              ),
              SideMenuItem(
                press: () {
                  orderDetailViewModel.changeCurrentIndex(1);
                },
                title: "On the Way",
                iconSrc: "assets/images/two-ways.png",
                isActive: false,
              ),
              SideMenuItem(
                press: () {
                  orderDetailViewModel.changeCurrentIndex(2);
                },
                title: "Delivered",
                iconSrc: "assets/images/takeaway.png",
                isActive: false,
              ),
              SideMenuItem(
                press: () {
                  orderDetailViewModel.changeCurrentIndex(3);
                },
                title: "Cancelled",
                iconSrc: "assets/images/cancelled.png",
                isActive: false,
                showBorder: false,
              ),

              // SizedBox(height: kDefaultPadding * 2),
              // // Tags
              // Tags(),
            ],
          ),
        ),
      ),
    );
  }
}
