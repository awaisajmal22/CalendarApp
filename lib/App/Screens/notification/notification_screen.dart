import 'package:calenderapp/App/Screens/home/home_page_screen/provider/home_page_provider.dart';
import 'package:calenderapp/App/services/notification_services.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    Provider.of<HomePageProvider>(context, listen: false).getEvents();
    return Scaffold(
      body: SafeArea(
        child: Consumer<HomePageProvider>(
          builder: (context, provider, __) {
            // provider.getEvents();
            print(provider.events.length);
            return Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  // height: size.height * 0.040,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Icon(Icons.arrow_back),
                      ),
                      Text(
                        'Notifications',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Icon(
                          Icons.arrow_back,
                          color: Colors.transparent,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                      physics: BouncingScrollPhysics(),
                      padding: const EdgeInsets.all(0),
                      itemCount: provider.events.length,
                      itemBuilder: (context, index) {
                        return Container(
                          // color: Colors.red,
                          margin: const EdgeInsets.all(10),
                          // height: size.height * 0.12,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 20),
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: Color(int.parse(
                                  '0xff${provider.events[index].color}')),
                              boxShadow: [
                                BoxShadow(
                                  color: const Color(0xff000000)
                                      .withOpacity(0.0588),
                                  offset: const Offset(0, 3),
                                  spreadRadius: 0,
                                  blurRadius: 30,
                                ),
                              ],
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Container(
                                        alignment: Alignment.center,
                                        height: 10,
                                        width: 10,
                                        decoration: BoxDecoration(
                                          color: Colors.green,
                                          shape: BoxShape.circle,
                                        ),
                                        child: Container(
                                          height: 5,
                                          width: 5,
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              shape: BoxShape.circle),
                                        ),
                                      ),
                                      SizedBox(
                                        width: size.width * 0.020,
                                      ),
                                      Text(
                                          "${DateFormat.jm().format(DateTime.fromMillisecondsSinceEpoch(provider.events[index].startTime!))}-${DateFormat.jm().format(DateTime.fromMillisecondsSinceEpoch(provider.events[index].endTime!))}",
                                          style: TextStyle(
                                            color: Colors.white,
                                          ))
                                    ],
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      provider.deleteSpecificEvent(
                                          id: provider.events[index].id!);
                                      provider.getEvents();
                                    },
                                    child:
                                        Icon(Icons.close, color: Colors.white),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: size.height * 0.005,
                              ),
                              Text(
                                "${provider.events[index].category} ${provider.events[index].eventName}",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(
                                height: size.height * 0.005,
                              ),
                              provider.viewMoreText == false
                                  ? Row(
                                      children: [
                                        SizedBox(
                                          height: size.height * 0.02,
                                          width: size.width * 0.4,
                                          child: Text(
                                              provider.events[index]
                                                  .eventDescription
                                                  .toString(),
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                color: Colors.white,
                                              )),
                                        ),
                                        provider.events[index].eventDescription!
                                                    .length >
                                                20
                                            ? GestureDetector(
                                                onTap: () {
                                                  provider.viewMore(
                                                      viewMore: true);
                                                },
                                                child: const Text('View more',
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                    )),
                                              )
                                            : const SizedBox.shrink()
                                      ],
                                    )
                                  : RichText(
                                      text: TextSpan(children: [
                                      TextSpan(
                                          style: const TextStyle(
                                              color: Colors.white),
                                          text: provider
                                              .events[index].eventDescription!),
                                      provider.events[index].eventDescription!
                                                  .length >
                                              20
                                          ? TextSpan(
                                              style: const TextStyle(
                                                  color: Colors.white),
                                              text: '. View less',
                                              recognizer: TapGestureRecognizer()
                                                ..onTap = () {
                                                  provider.viewMore(
                                                      viewMore: false);
                                                })
                                          : const TextSpan()
                                    ]))
                            ],
                          ),
                        );
                      }),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
