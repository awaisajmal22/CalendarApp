import 'package:calenderapp/App/Screens/home/home_page_screen/provider/home_page_provider.dart';
import 'package:calenderapp/App/Screens/notification/notification_screen.dart';
import 'package:calenderapp/App/services/notification_services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

customDrawer(BuildContext context, {required HomePageProvider provider}) {
  final size = MediaQuery.of(context).size;
  return Container(
    height: MediaQuery.of(context).size.height,
    width: MediaQuery.of(context).size.width * 0.75,
    decoration: const BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.only(
        topRight: Radius.circular(32.0), // Adjust the radius as needed
        bottomRight: Radius.circular(32.0),
      ),
    ),
    child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: size.height * 0.020,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "Calender App",
              style: TextStyle(
                  fontFamily: 'Roboto Flex',
                  fontWeight: FontWeight.w400,
                  fontSize: 22),
            ),
          ),
          SizedBox(
            height: size.height * 0.02,
          ),
          Column(
            children: List.generate(
                provider.drawerTileList.length,
                (index) => GestureDetector(
                      onTap: () {
                        
                        provider.getSelectedTileIndex(index: index);
                      },
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 10),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        height: size.height * 0.08,
                        width: size.width * 0.6,
                        decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(32),
                                bottomRight: Radius.circular(32)),
                            color: provider.tileIndex == index
                                ? Color(0xff222B45).withOpacity(0.1)
                                : Colors.transparent),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              provider.drawerTileList[index].icon,
                              width: 14,
                              height: 14,
                            ),
                            SizedBox(
                              width: size.width * 0.030,
                            ),
                            Text(provider.drawerTileList[index].title)
                          ],
                        ),
                      ),
                    )),
          ),
          Container(
            height: 1,
            color: Color(0xff292D32).withOpacity(0.24),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 10),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            height: size.height * 0.08,
            width: size.width * 0.6,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(32),
                    bottomRight: Radius.circular(32)),
                color: Colors.transparent),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/tick-square.png',
                  width: 14,
                  height: 14,
                ),
                SizedBox(
                  width: size.width * 0.030,
                ),
                Text('Holidays')
              ],
            ),
          ),
          // ListTile(
          //   // contentPadding: EdgeInsetero,  // Set contentPadding to remove left space

          //   leading: Image.asset(
          //     'assets/images/Group 36.png', // Replace with your image asset path
          //     color: Colors.black, // Change image color if needed
          //     width: 24.0, // Adjust image size if needed
          //     height: 24.0,
          //   ),
          //   title: const Text('Holidays'),
          //   onTap: () {},
          // ),
        ],
      ),
    ),
  );
}
