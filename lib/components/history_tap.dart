
import 'package:bundle_test/constants/styles.dart';
import 'package:bundle_test/views/timecard/timecard_details.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';

class History_Tap extends StatefulWidget {
  const History_Tap({Key? key}) : super(key: key);

  @override
  _History_TapState createState() => _History_TapState();
}

class _History_TapState extends State<History_Tap> {

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Get.to(() => const Timecard_Details());
      },
      child: Container(
        margin: const EdgeInsets.only(left: 5, right: 5, top: 10),
        child: Card(
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
                        "assets/images/bill.png"),
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
                        height: 400,
                        decoration: BoxDecoration(
                            color: AppColor.lightgrey,
                            borderRadius: BorderRadius.circular(10)),
                        padding: const EdgeInsets.all(0),
                        margin: const EdgeInsets.all(4),
                        child: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: const AssetImage(
                                      "assets/images/bill.png"),
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
                              "assets/images/bill.png",
                            )
                        ),
                      ),
                      title: Row(
                        children: [
                          const Expanded(
                            flex: 3,
                            child: Text(
                            "Clovis Okonkwo",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                color: Colors.white70,
                                fontSize: 14,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: const [
                                Text(
                                  "3,000",
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                      color: Colors.green,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                                Text(
                                  "130",
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                      color: Colors.white60,
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                              ],
                            )
                          )
                        ],
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "Project Name",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                color: Colors.white70,
                                fontSize: 12,
                                fontWeight: FontWeight.normal
                            ),
                          ),
                          SizedBox(
                            height: 2,
                          ),
                          Text(
                            "Status",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                color: Colors.white70,
                                fontSize: 12,
                                fontWeight: FontWeight.normal
                            ),
                          ),
                        ],
                      ),
                      trailing: const Icon(FontAwesomeIcons.arrowRight,
                        color: Colors.white70,
                        size: 15,
                      )
                  ),

                ],
              )
          ),
        ),
      )
    );
  }
}
