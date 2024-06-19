import 'package:flutter/material.dart';
import 'package:gobank/utils/colornotifire.dart';
import 'package:provider/provider.dart';

class ReferirScreen extends StatefulWidget {
  const ReferirScreen({Key? key}) : super(key: key);

  @override
  _ReferirScreenState createState() => _ReferirScreenState();
}

class _ReferirScreenState extends State<ReferirScreen> {
  late ColorNotifire notifire;

  @override
  Widget build(BuildContext context) {
    notifire = Provider.of<ColorNotifire>(context, listen: true);
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Referir',
          style: TextStyle(
            fontSize: 20,
            fontFamily: 'Gilroy Bold',
            color: notifire.getdarkscolor,
          ),
        ),
        backgroundColor: notifire.getorangeprimerycolor,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            height: 40,
            width: 40,
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: notifire.getdarkscolor),
            ),
            child: Icon(Icons.arrow_back, color: notifire.getdarkscolor),
          ),
        ),
      ),
      body: Container(
        color: notifire.getprimerycolor,
        child: Center(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'images/referidos.png',
                  height: 300,
                  width: 300,
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextField(
                    decoration: InputDecoration(
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Color(0xffd3d3d3)),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      hintText: 'Ingrese su código de referido',
                      hintStyle: TextStyle(
                        color: notifire.getdarkgreycolor,
                        fontSize: height / 60,
                      ),
                      fillColor: notifire.getbackcolor,
                      border: const OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: notifire.getorangeprimerycolor),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),


              ],
            ),
          ),
        ),
      ),
    );
  }
}
