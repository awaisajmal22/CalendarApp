
  import 'package:calenderapp/App/Screens/home/home_page_screen/provider/home_page_provider.dart';
import 'package:calenderapp/App/Screens/notification/notification_screen.dart';
import 'package:flutter/material.dart';

PreferredSize customAppBar(Size size, HomePageProvider provider,BuildContext context) {
    return PreferredSize(
          preferredSize: Size(size.width * 100, size.height * 1),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                    onTap: () {
                      provider.key.currentState!.openDrawer();
                      // provider.openDrawer(
                      //     isOpen: !provider.isOpenDrawer);
                    },
                    child: const Icon(Icons.menu)),
                GestureDetector(
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=> NotificationScreen()));
                  },
                  child: Image.asset(
                    'assets/images/Icon.png', // Replace with your image asset path
                    color: Colors.black, // Change image color if needed
                    width: 24.0, // Adjust image size if needed
                    height: 24.0,
                  ),
                )
              ],
            ),
          ),
        );
  }
