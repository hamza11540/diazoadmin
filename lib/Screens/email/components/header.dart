import 'package:flutter/material.dart';


import '../../../colors.dart';
import '../../../responsive.dart';

class Header extends StatelessWidget {
  const Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kDefaultPadding),
      child: Row(
        children: [
          // We need this back button on mobile only
          if (Responsive.isMobile(context)) BackButton(),
          IconButton(
            icon: const Icon(Icons.access_time, color: Colors.transparent,),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.access_time, color: Colors.transparent,),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.access_time, color: Colors.transparent,),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.access_time, color: Colors.transparent,),
            onPressed: () {},
          ),
          Spacer(),
          // We don't need print option on mobile
          if (Responsive.isDesktop(context))
            IconButton(
              icon: const Icon(Icons.print),
              onPressed: () {},
            ),
          IconButton(
            icon: const Icon(Icons.save_alt),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.more_vert_sharp),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
