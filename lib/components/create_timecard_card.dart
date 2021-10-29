
import 'package:bundle_test/constants/styles.dart';
import 'package:bundle_test/views/timecard/create_timecard.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:getwidget/getwidget.dart';
import 'package:get/get.dart';

class Create_Timecard_Card extends StatefulWidget {
  const Create_Timecard_Card({Key? key}) : super(key: key);

  @override
  _Create_Timecard_CardState createState() => _Create_Timecard_CardState();
}

class _Create_Timecard_CardState extends State<Create_Timecard_Card> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 5, bottom: 0, left: 0),
            child: GestureDetector(
              onTap: () async {
                Get.to( () => const Create_Timecard());
              },
              child: Column(
                children: [
                  Card(
                    elevation: 5,
                    shape: BeveledRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: Container(
                        margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                        width: double.infinity,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                              image: const AssetImage(
                                  "assets/images/money-exchange.png"),
                              colorFilter: ColorFilter.mode(
                                  Colors.black.withOpacity(0.1),
                                  BlendMode.dstATop),
                              fit: BoxFit.cover,
                            ),
                            borderRadius:
                            BorderRadius.circular(5.0),
                            color: Colors.black87),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            ListTile(
                                leading: Container(
                                  decoration: BoxDecoration(
                                      color: AppColor.lightgrey,
                                      borderRadius: BorderRadius.circular(10)),
                                  padding: const EdgeInsets.all(0),
                                  margin: const EdgeInsets.all(4),
                                  child: GestureDetector(
                                    onTap: () {
                                      Get.snackbar("title", "message");
                                    },
                                    child: Container(
                                        padding: const EdgeInsets.all(8),
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: const AssetImage(
                                                  "assets/images/money-exchange.png"),
                                              colorFilter: ColorFilter.mode(
                                                  Colors.black.withOpacity(0.0),
                                                  BlendMode.dstATop),
                                              fit: BoxFit.cover,
                                            ),
                                            borderRadius:
                                            BorderRadius.circular(5.0),
                                            color: AppColor.purpleLight),
                                        height: 45,
                                        width: 45,
                                        child: Image.asset(
                                          "assets/images/money-exchange.png",
                                        )
                                    ),
                                  ),
                                ),
                                trailing:const Icon(FontAwesomeIcons.arrowRight,
                                  color: Colors.white70,
                                  size: 15,
                                )
                            ),
                            Container(
                              alignment: Alignment.centerLeft,
                              margin: const EdgeInsets.only(left: 16, top: 3, bottom: 3),
                              child: const Text(
                                "CREATE TIMECARD",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    color: Colors.white70,
                                    fontSize: 12,
                                    fontWeight: FontWeight.normal
                                ),
                              ),
                            ),
                            GFProgressBar(
                              padding: const EdgeInsets.only(
                                  top: 8,
                                  right: 8,
                                  left: 8),
                              percentage: 0.6,
                              lineHeight: 5,
                              alignment: MainAxisAlignment.spaceBetween,
                              child: const Text('60%', textAlign: TextAlign.end,
                                style: TextStyle(fontSize: 4, color: Colors.white),
                              ),
                              // leading  : Icon( Icons.sentiment_dissatisfied, color: GFColors.DANGER),
                              // trailing: Icon( Icons.sentiment_satisfied, color: GFColors.SUCCESS),
                              backgroundColor: AppColor.darkBlue,
                              progressBarColor: GFColors.INFO,
                            ),
                            const ListTile(
                              leading: Text(
                                "Total ",
                                style: TextStyle(color:
                                Colors.white70,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 12,
                                ),
                              ),
                              trailing: Text(
                                "200",
                                style: TextStyle(color:
                                Colors.white70,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                            ),

                          ],
                        )
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
