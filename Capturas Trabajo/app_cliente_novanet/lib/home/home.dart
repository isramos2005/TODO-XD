// ignore_for_file: non_constant_identifier_names, constant_identifier_names, prefer_typing_uninitialized_variables

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gobank/home/notifications.dart';
import 'package:gobank/screens/payservice_screen.dart';
import 'package:gobank/screens/referir_screen.dart';
import 'package:gobank/screens/services_screen.dart';
import 'package:gobank/screens/webviewtest_screen.dart';
import 'package:gobank/utils/colornotifire.dart';
import 'package:gobank/utils/string.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import '../profile/profile.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late ColorNotifire notifire;
  late String selectedMonth;
  String fcNombreUsuario = '';
  List produtosdelservicioactual = [];
  List json2 = [];

  Future<void> _loadData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //obtención de datos personales
    String fcNombreUsuarioFull = prefs.getString('fcNombreUsuario') ?? '';
    List<String> parts = fcNombreUsuarioFull.split(' ');
    String fcNombreUsuarioFirstWord = parts.isNotEmpty ? parts.first : '';

    //json 4 : productos del cliente
    String dataAsString = prefs.getString('datalogin[3]') ?? '';

    //json 2 de información
    String dataAsString2 = prefs.getString('datalogin[1]') ?? '';

    setState(() {
      produtosdelservicioactual = jsonDecode(dataAsString);
      json2 = jsonDecode(dataAsString2);
      fcNombreUsuario = fcNombreUsuarioFirstWord;
    });
  }

  getdarkmodepreviousstate() async {
    final prefs = await SharedPreferences.getInstance();
    bool? previusstate = prefs.getBool("setIsDark");
    if (previusstate == null) {
      notifire.setIsDark = false;
    } else {
      notifire.setIsDark = previusstate;
    }
  }

  @override
  void initState() {
    _loadData();
    super.initState();
    selectedMonth = '1';
  }

  String _getMonthName(int op) {
    switch (op) {
      case 1:
        return CustomStrings.op1;
      case 2:
        return CustomStrings.op2;
      case 3:
        return CustomStrings.op3;
      default:
        return '';
    }
  }

  
  bool selection = true;
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    notifire = Provider.of<ColorNotifire>(context, listen: true);
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          automaticallyImplyLeading: false,
          backgroundColor: notifire.getorangeprimerycolor,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                CustomStrings.hello + ' ' + fcNombreUsuario,
                style: TextStyle(
                    color: notifire.getdarkscolor,
                    fontWeight: FontWeight.w200,
                    fontSize: 20,
                    fontFamily: 'Gilroy'),
              ),
            ],
          ),
          actions: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        const Notificationindex(CustomStrings.notification),
                  ),
                );
              },
              child: Image.asset(
                "images/notification.png",
                color: notifire.getdarkscolor,
                scale: 4,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const WebviewTest_screen(),
                  ),
                );
              },
              child: Image.asset(
                "images/high-speed.png",
                color: notifire.getdarkscolor,
                scale: 20,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Profile(),
                  ),
                );
              },
              child: Image.asset(
                "images/user_outline.png",
                color: notifire.getdarkscolor,
                scale: 20,
              ),
            ),
          ],
        ),
        backgroundColor: notifire.getprimerycolor,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SingleChildScrollView(
                primary: true,
                child: Expanded(
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          Container(
                            height: double.parse(
                                (MediaQuery.of(context).size.height * 0.1)
                                    .toStringAsFixed(2)),
                            width: width / 1,
                            color: notifire.getorangeprimerycolor,
                          ),
                          Column(
                            children: [
                              SizedBox(
                                height: height / 20,
                              ),
                              Center(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: width / 38),
                                  child: SizedBox(
                                    height: height / 10,
                                    width: width,
                                    child: Stack(
                                      children: [
                                        Positioned(
                                          top: 5,
                                          left: 0,
                                          right: 0,
                                          height: height / 19,
                                          child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  const BorderRadius.only(
                                                topLeft: Radius.circular(10),
                                                topRight: Radius.circular(10),
                                              ),
                                              color: notifire.getprimerycolor,
                                            ),
                                            child: Center(
                                              child: Text(
                                                "Mis creditos",
                                                style: TextStyle(
                                                  color: notifire
                                                      .getorangeprimerycolor,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w300,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          bottom: 0,
                                          left: 0,
                                          right: 0,
                                          height: height / 20,
                                          child: Container(
                                            decoration: BoxDecoration(
                                              boxShadow: <BoxShadow>[
                                                BoxShadow(
                                                  color: notifire.getdarkscolor
                                                      .withOpacity(0.1),
                                                  blurRadius: 15.0,
                                                  offset:
                                                      const Offset(0.0, 0.75),
                                                ),
                                              ],
                                              borderRadius:
                                                  const BorderRadius.only(
                                                bottomLeft: Radius.circular(10),
                                                bottomRight:
                                                    Radius.circular(10),
                                              ),
                                              color: notifire.gettabwhitecolor,
                                            ),
                                            child: Center(
                                              child: Text(
                                                "L. 0.00",
                                                style: TextStyle(
                                                  color: notifire
                                                      .getorangeprimerycolor,
                                                  fontSize: 25,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: height / 60,
                              ),
                              Center(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: width / 38),
                                  child: Container(
                                    height: height / 7,
                                    width: width,
                                    decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(10),
                                      ),
                                      color: notifire.getwhite,
                                      boxShadow: <BoxShadow>[
                                        BoxShadow(
                                          color: notifire.getdarkscolor
                                              .withOpacity(0.3),
                                          blurRadius: 5.0,
                                          offset: const Offset(0.0, 0.75),
                                        ),
                                      ],
                                    ),
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          height: height / 50,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            const SizedBox(
                                              width: 20.00,
                                            ),
                                            Column(
                                              children: [
                                                GestureDetector(
                                                  onTap: () {
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) =>
                                                            const Scan(),
                                                      ),
                                                    );
                                                  },
                                                  child: Container(
                                                    height: height / 15,
                                                    width: width / 7,
                                                    decoration: BoxDecoration(
                                                      color: notifire
                                                          .getprimerycolor,
                                                      borderRadius:
                                                          const BorderRadius
                                                              .all(
                                                        Radius.circular(10),
                                                      ),
                                                      boxShadow: const <
                                                          BoxShadow>[
                                                        BoxShadow(
                                                          color: Color.fromARGB(
                                                              34, 82, 79, 79),
                                                          blurRadius: 15.0,
                                                          offset:
                                                              Offset(0.0, 0.75),
                                                        ),
                                                      ],
                                                    ),
                                                    child: Center(
                                                      child: Image.asset(
                                                        "images/metodo-de-pago.png",
                                                        color: notifire
                                                            .getdarkscolor,
                                                        height: height / 20,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: height / 60,
                                                ),
                                                Text(
                                                  CustomStrings.pay,
                                                  style: TextStyle(
                                                      fontFamily: "Gilroy Bold",
                                                      color: notifire
                                                          .getdarkscolor,
                                                      fontSize: height / 55),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(
                                              width: 20.00,
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                _showWPDialog(context);
                                              },
                                              child: Column(
                                                children: [
                                                  Container(
                                                    height: height / 15,
                                                    width: width / 7,
                                                    decoration: BoxDecoration(
                                                      color: notifire
                                                          .getprimerycolor,
                                                      borderRadius:
                                                          const BorderRadius
                                                              .all(
                                                        Radius.circular(10),
                                                      ),
                                                      boxShadow: const <
                                                          BoxShadow>[
                                                        BoxShadow(
                                                          color: Color.fromARGB(
                                                              34, 82, 79, 79),
                                                          blurRadius: 15.0,
                                                          offset:
                                                              Offset(0.0, 0.75),
                                                        ),
                                                      ],
                                                    ),
                                                    child: Center(
                                                      child: Image.asset(
                                                        "images/apoyo.png",
                                                        color: notifire
                                                            .getdarkscolor,
                                                        height: height / 20,
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: height / 60,
                                                  ),
                                                  Text(
                                                    CustomStrings.soporte,
                                                    style: TextStyle(
                                                      fontFamily: "Gilroy Bold",
                                                      color: notifire
                                                          .getdarkscolor,
                                                      fontSize: height / 55,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 20.00,
                                            ),
                                            Column(
                                              children: [
                                                GestureDetector(
                                                  onTap: () {
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) =>
                                                            const AddServices_Screen(
                                                                'Servicios'),
                                                      ),
                                                    );
                                                  },
                                                  child: Container(
                                                    height: height / 15,
                                                    width: width / 7,
                                                    decoration: BoxDecoration(
                                                      color: notifire
                                                          .getprimerycolor,
                                                      borderRadius:
                                                          const BorderRadius
                                                              .all(
                                                        Radius.circular(10),
                                                      ),
                                                      boxShadow: const <
                                                          BoxShadow>[
                                                        BoxShadow(
                                                          color: Color.fromARGB(
                                                              34, 82, 79, 79),
                                                          blurRadius: 15.0,
                                                          offset:
                                                              Offset(0.0, 0.75),
                                                        ),
                                                      ],
                                                    ),
                                                    child: Center(
                                                      child: Image.asset(
                                                        "images/caja.png",
                                                        color: notifire
                                                            .getdarkscolor,
                                                        height: height / 20,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: height / 60,
                                                ),
                                                Text(
                                                  CustomStrings.addservice,
                                                  style: TextStyle(
                                                      fontFamily: "Gilroy Bold",
                                                      color: notifire
                                                          .getdarkscolor,
                                                      fontSize: height / 55),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(
                                              width: 20.00,
                                            ),
                                            Column(
                                              children: [
                                                GestureDetector(
                                                  onTap: () {
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) =>
                                                            const ReferirScreen(),
                                                      ),
                                                    );
                                                  },
                                                  child: Container(
                                                    height: height / 15,
                                                    width: width / 7,
                                                    decoration: BoxDecoration(
                                                      color: notifire
                                                          .getprimerycolor,
                                                      borderRadius:
                                                          const BorderRadius
                                                              .all(
                                                        Radius.circular(10),
                                                      ),
                                                      boxShadow: const <
                                                          BoxShadow>[
                                                        BoxShadow(
                                                          color: Color.fromARGB(
                                                              34, 82, 79, 79),
                                                          blurRadius: 15.0,
                                                          offset:
                                                              Offset(0.0, 0.75),
                                                        ),
                                                      ],
                                                    ),
                                                    child: Center(
                                                      child: Image.asset(
                                                        "images/referir.png",
                                                        color: notifire
                                                            .getdarkscolor,
                                                        height: height / 20,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: height / 60,
                                                ),
                                                Text(
                                                  CustomStrings.referir,
                                                  style: TextStyle(
                                                      fontFamily: "Gilroy Bold",
                                                      color: notifire
                                                          .getdarkscolor,
                                                      fontSize: height / 55),
                                                ),
                                                const SizedBox(
                                                  width: 20.00,
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: height / 30,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: width / 18),
                        child: Row(
                          children: [
                            Text(
                              CustomStrings.service,
                              style: TextStyle(
                                  fontFamily: "Gilroy Bold",
                                  color: notifire.getdarkscolor,
                                  fontSize: height / 40),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: height / 50,
                      ),
                      Padding(
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
                              initiallyExpanded: false,
                              title: Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: width * 0.02,
                                  vertical: height * 0.005,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          height: height * 0.07,
                                          width: height * 0.07,
                                          decoration: BoxDecoration(
                                            color: notifire.getprimerycolor,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: Center(
                                            child: Icon(
                                              Icons.wifi,
                                              color: notifire.getdarkscolor,
                                              size: height * 0.035,
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: width * 0.02),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(height: height * 0.01),
                                              Text(
                                                "Servicio Residencial Novanet",
                                                style: TextStyle(
                                                  fontFamily: "Gilroy Bold",
                                                  color: notifire.getdarkscolor,
                                                  fontSize: height * 0.015,
                                                ),
                                              ),
                                              SizedBox(height: height * 0.005),
                                              Text(
                                                "Fecha de conexión: 15/04/2024",
                                                style: TextStyle(
                                                  fontFamily: "Gilroy Medium",
                                                  color: notifire.getdarkscolor
                                                      .withOpacity(0.6),
                                                  fontSize: height * 0.013,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(width: width * 0.02),
                                        Column(
                                          children: [
                                            SizedBox(height: height * 0.04),
                                            Text(
                                             json2[0]["fcEstadoSolicitud"].toString(),
                                              style: TextStyle(
                                                fontFamily: "Gilroy Bold",
                                                color: Colors.green,
                                                fontSize: height * 0.02,
                                              ),
                                            ),
                                            SizedBox(height: height * 0.04),
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
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Productos',
                                      style: TextStyle(
                                        fontFamily: "Gilroy Medium",
                                        color: notifire.getdarkscolor
                                            .withOpacity(0.6),
                                        fontSize: height * 0.013,
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: width * 0.02),
                                  child: ListView.builder(
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemCount: produtosdelservicioactual.length,
                                    itemBuilder: (context, index) => Padding(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: width * 0.05,
                                        vertical: height * 0.01,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Icon(
                                                Icons.circle,
                                                color: notifire.getdarkscolor,
                                                size: 10,
                                              ),
                                            ],
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                produtosdelservicioactual[index]
                                                    ["fcProducto"],
                                                style: TextStyle(
                                                  fontFamily: "Gilroy Medium",
                                                  color: notifire.getdarkscolor
                                                      .withOpacity(0.6),
                                                  fontSize: height * 0.013,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Text(
                                                NumberFormat.currency(
                                                  locale: 'es',
                                                  symbol: '\$',
                                                ).format(
                                                    produtosdelservicioactual[
                                                            index]
                                                        ["fnValorProductoME"]),
                                                style: TextStyle(
                                                  fontFamily: "Gilroy Medium",
                                                  color: notifire.getdarkscolor
                                                      .withOpacity(0.6),
                                                  fontSize: height * 0.013,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: height / 30,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: width / 18),
                        child: Row(
                          children: [
                            Flexible(
                              child: Text(
                                'Pagos de ${_getMonthName(int.parse(selectedMonth))}',
                                style: TextStyle(
                                  fontFamily: "Gilroy Bold",
                                  color: notifire.getdarkscolor,
                                  fontSize: height / 40,
                                ),
                                overflow: TextOverflow.fade,
                              ),
                            ),
                            const Spacer(),
                            DropdownButton<String>(
                              value: selectedMonth,
                              dropdownColor: notifire.getprimerycolor,
                              onChanged: (String? newValue) {
                                setState(() {
                                  selectedMonth = newValue!;
                                });
                              },
                              items: <String>[
                                for (int i = 1; i <= 3; i++) i.toString()
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(
                                    _getMonthName(int.parse(value)),
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: notifire.getdarkscolor,
                                    ),
                                    overflow: TextOverflow.fade,
                                  ),
                                );
                              }).toList(),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: height / 50,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  Future<void> _showWPDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: AssetImage(
                      'images/fondo.png',
                    ),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                margin: const EdgeInsets.all(15.0),
                height: 300,
                padding: const EdgeInsets.all(40),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () => _launchUrl(),
                      child: Container(
                        height: 40,
                        width: 200,
                        decoration: BoxDecoration(
                          color: notifire.getorangeprimerycolor,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(Icons.message_outlined, color: Colors.white),
                            SizedBox(width: 5),
                            Text(
                              'Soporte Técnico',
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Gilroy Bold',
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    GestureDetector(
                      onTap: () => _launchUrl(),
                      child: Container(
                        height: 40,
                        width: 200,
                        decoration: BoxDecoration(
                          color: notifire.getorangeprimerycolor,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(Icons.message_outlined, color: Colors.white),
                            SizedBox(width: 5),
                            Text(
                              'Servicio al Cliente',
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Gilroy Bold',
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    GestureDetector(
                      onTap: () => _launchUrl(),
                      child: Container(
                        height: 40,
                        width: 200,
                        decoration: BoxDecoration(
                          color: notifire.getorangeprimerycolor,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(Icons.message_outlined, color: Colors.white),
                            SizedBox(width: 5),
                            Text(
                              'Contabilidad',
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Gilroy Bold',
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    GestureDetector(
                      onTap: () => _launchTelefono(),
                      child: Container(
                        height: 40,
                        width: 200,
                        decoration: BoxDecoration(
                          color: notifire.getorangeprimerycolor,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(Icons.message_outlined, color: Colors.white),
                            SizedBox(width: 5),
                            Text(
                              'Otra Opción',
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Gilroy Bold',
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _launchUrl() async {
    String Url =
        "https://api.whatsapp.com/send/?phone=50495906256&text=Hola&type=phone_number&app_absent=0";
    if (!await launchUrl(Uri.parse(Url))) {
      throw Exception('Could not launch $Url');
    }
  }

  Future<void> _launchTelefono() async {
    const Url = 'tel:+1 555 010 999';

    if (!await launchUrl(Uri.parse(Url))) {
      throw Exception('Could not launch $Url');
    }
  }
}
