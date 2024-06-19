import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/colornotifire.dart';
import '../utils/media.dart';
import '../utils/string.dart';

class Seealltransaction extends StatefulWidget {
  const Seealltransaction({Key? key}) : super(key: key);

  @override
  State<Seealltransaction> createState() => _SeealltransactionState();
}

class _SeealltransactionState extends State<Seealltransaction> {
  late ColorNotifire notifire;
  bool _isExpanded = false;

  getdarkmodepreviousstate() async {
    final prefs = await SharedPreferences.getInstance();
    bool? previusstate = prefs.getBool("setIsDark");
    if (previusstate == null) {
      notifire.setIsDark = false;
    } else {
      notifire.setIsDark = previusstate;
    }
  }

  List transaction = [
    "images/starbuckscoffee.png",
    "images/spotify.png",
    "images/netflix.png",
    "images/netflix.png",
    "images/netflix.png",
    "images/netflix.png",
  ];
  List transactionname = [
    "Servicio Residencial Novanet",
    "Servicio Residencial Novanet",
    "Servicio Residencial Novanet",
    "Servicio Residencial Novanet",
    "Servicio Residencial Novanet",
    "Servicio Residencial Novanet",
  ];
  List transactioncolor = [
    Colors.black,
    Colors.black,
    Colors.black,
    Colors.black,
    Colors.black,
    Colors.black,
  ];
  List transactionamount = [
    "L.55.00",
    "L.27.00",
    "L.27.00",
    "L.34.00",
    "L.34.00",
    "L.34.00",
  ];
  List transactiondate = [
    "12 Oct 2021 . 16:03",
    "12 Jun 2021 . 16:03",
    "12 May 2021 . 16:03",
    "12 Abri 2021 . 16:03",
    "8 Mar 2021 . 12:05",
    "4 Feb 2021 . 09:25",
  ];
  @override
  Widget build(BuildContext context) {
    notifire = Provider.of<ColorNotifire>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(color: notifire.getdarkscolor),
        backgroundColor: notifire.getprimerycolor,
        title: Text(
          CustomStrings.alltransaction,
          style: TextStyle(
              fontFamily: "Gilroy Bold",
              color: notifire.getdarkscolor,
              fontSize: height / 40),
        ),
      ),
      backgroundColor: notifire.getprimerycolor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: height / 50,
            ),
            Container(
              height: height / 1.15,
              color: Colors.transparent,
              child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                padding: EdgeInsets.zero,
                itemCount: transaction.length,
                                itemBuilder: (context, index) => Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: width * 0.05,
                                    vertical: height * 0.01,
                                  ),
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        _isExpanded = !_isExpanded;
                                      });
                                    },
                                    child: Card(
                                      color: notifire.getbackcolor,
                                      elevation: 0,
                                      shape: RoundedRectangleBorder(
                                        side: BorderSide(
                                          width: 2,
                                          color: Colors.grey.withOpacity(0.2),
                                        ),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: ExpansionTile(
                                        collapsedIconColor:
                                            notifire.getdarkscolor,
                                        iconColor:
                                            notifire.getorangeprimerycolor,
                                        initiallyExpanded: false,
                                        title: Padding(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: width * 0.02,
                                            vertical: height * 0.005,
                                          ),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  Container(
                                                    height: height * 0.07,
                                                    width: width / 7,
                                                    decoration: BoxDecoration(
                                                      color: notifire
                                                          .getprimerycolor,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                    ),
                                                    child: Center(
                                                      child: Image.asset(
                                                        "images/logos.png",
                                                        height: height / 30,
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(width: width * 0.02),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        transactionname[index],
                                                        style: TextStyle(
                                                          fontFamily:
                                                              "Gilroy Bold",
                                                          color: notifire
                                                              .getdarkscolor,
                                                          fontSize:
                                                              height * 0.015,
                                                        ),
                                                        maxLines: 2,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                      ),
                                                      SizedBox(
                                                          height:
                                                              height * 0.005),
                                                      Text(
                                                        transactiondate[index],
                                                        style: TextStyle(
                                                          fontFamily:
                                                              "Gilroy Medium",
                                                          color: notifire
                                                              .getdarkscolor
                                                              .withOpacity(0.6),
                                                          fontSize:
                                                              height * 0.013,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                          height:
                                                              height * 0.005),
                                                      Text(
                                                        transactionamount[
                                                            index],
                                                        style: TextStyle(
                                                          fontFamily:
                                                              "Gilroy Bold",
                                                          color: notifire
                                                              .getdarkscolor,
                                                          fontSize:
                                                              height * 0.02,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                              SizedBox(height: height * 0.005),
                                            ],
                                          ),
                                        ),
                                        children: [
                                          const Divider(),
                                          Text(
                                            "Más información aquí...",
                                            style: TextStyle(
                                              fontFamily: "Gilroy Medium",
                                              color: notifire.getdarkscolor
                                                  .withOpacity(0.6),
                                              fontSize: height * 0.013,
                                            ),
                                          ),
                                          SizedBox(height: height * 0.01),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              
              ),
            ),
          ],
        ),
      ),
    );
  }
}
