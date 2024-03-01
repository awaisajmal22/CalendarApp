import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width * 0.7,
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
              height: 300,
              child: DrawerHeader(
                  // padding: EdgeInsets.all(value),
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "CALENDER app",
                    style: TextStyle(
                        fontFamily: 'Roboto Flex',
                        fontWeight: FontWeight.w400,
                        fontSize: 22),
                  ),
                  ListTile(
                    contentPadding: EdgeInsets
                        .zero, // Set contentPadding to remove left space

                    leading: Image.asset(
                      'assets/images/Frame 1.png', // Replace with your image asset path
                      color: Colors.black, // Change image color if needed
                      width: 24.0, // Adjust image size if needed
                      height: 24.0,
                    ),
                    title: const Text('Day'),
                    onTap: () {},
                  ),
                  ListTile(
                    contentPadding: EdgeInsets
                        .zero, // Set contentPadding to remove left space

                    leading: Image.asset(
                      'assets/images/Frame 1.png', // Replace with your image asset path
                      color: Colors.black, // Change image color if needed
                      width: 24.0, // Adjust image size if needed
                      height: 24.0,
                    ),
                    title: const Text('Week'),
                    onTap: () {},
                  ),
                  ListTile(
                    contentPadding: EdgeInsets
                        .zero, // Set contentPadding to remove left space

                    leading: Image.asset(
                      'assets/images/Group 35.png', // Replace with your image asset path
                      color: Colors.black, // Change image color if needed
                      width: 24.0, // Adjust image size if needed
                      height: 24.0,
                    ),
                    title: const Text('Month'),
                    onTap: () {},
                  ),
                  ListTile(
                    contentPadding: EdgeInsets
                        .zero, // Set contentPadding to remove left space

                    leading: Image.asset(
                      'assets/images/Group 36.png', // Replace with your image asset path
                      color: Colors.black, // Change image color if needed
                      width: 24.0, // Adjust image size if needed
                      height: 24.0,
                    ),
                    title: const Text('Events'),
                    onTap: () {},
                  ),
                ],
              )),
            ),
            ListTile(
              // contentPadding: EdgeInsetero,  // Set contentPadding to remove left space

              leading: Image.asset(
                'assets/images/Group 36.png', // Replace with your image asset path
                color: Colors.black, // Change image color if needed
                width: 24.0, // Adjust image size if needed
                height: 24.0,
              ),
              title: const Text('Holidays'),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
