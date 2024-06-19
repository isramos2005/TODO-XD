import 'package:cherry_toast/cherry_toast.dart';
import 'package:flutter/material.dart';
import 'package:gobank/service/pruebaService.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../utils/button.dart';
import '../utils/colornotifire.dart';
import '../utils/media.dart';
import '../utils/string.dart';
import '../utils/textfeilds.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  late ColorNotifire notifire;

  getdarkmodepreviousstate() async {
    final prefs = await SharedPreferences.getInstance();
    bool? previusstate = prefs.getBool("setIsDark");
    if (previusstate == null) {
      notifire.setIsDark = false;
    } else {
      notifire.setIsDark = previusstate;
    }
  }

  final TextEditingController _identidadController = TextEditingController();
  final TextEditingController _nombreCompletoController =
      TextEditingController();
  final TextEditingController _nombreUsuarioController =
      TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _contraseniaController = TextEditingController();
  final TextEditingController _contraseniaconfirmarController =
      TextEditingController();

  bool inputsVisibles = false;
  @override
  Widget build(BuildContext context) {
    notifire = Provider.of<ColorNotifire>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        elevation: 0,
        backgroundColor: notifire.getprimerycolor,
        title: Text(
          CustomStrings.register,
          style: TextStyle(
              color: notifire.getdarkscolor,
              fontFamily: 'Gilroy Bold',
              fontSize: height / 35),
        ),
      ),
      backgroundColor: notifire.getprimerycolor,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: height * 0.9,
                  width: width,
                  color: Colors.transparent,
                  child: Image.asset(
                    "images/background.png",
                    fit: BoxFit.cover,
                  ),
                ),
                Column(
                  children: [
                    SizedBox(
                      height: height / 20,
                    ),
                    Stack(children: [
                      Center(
                        child: Container(
                          height: height / 1.22,
                          width: width / 1.1,
                          decoration: BoxDecoration(
                            color: notifire.gettabwhitecolor,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(40)),
                          ),
                          child: AnimatedSwitcher(
                            duration: const Duration(milliseconds: 200),
                            reverseDuration: const Duration(milliseconds: 200),
                            switchInCurve: Curves.decelerate,
                            switchOutCurve: Curves.decelerate,
                            child: inputsVisibles == true
                                ? SingleChildScrollView(
                                    scrollDirection: Axis.vertical,
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          height: height / 15,
                                        ),
                                        Row(
                                          children: [
                                            SizedBox(
                                              width: width / 18,
                                            ),
                                            Text(
                                              CustomStrings.fullname,
                                              style: TextStyle(
                                                color: notifire.getdarkscolor,
                                                fontSize: height / 50,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: height / 70,
                                        ),
                                        Registrar.textField(
                                            notifire.getdarkscolor,
                                            notifire.getdarkgreycolor,
                                            notifire.getorangeprimerycolor,
                                            "images/user.png",
                                            CustomStrings.fullnamehere,
                                            notifire.getdarkwhitecolor,
                                            _nombreCompletoController,
                                            true),
                                        SizedBox(
                                          height: height / 35,
                                        ),
                                        Row(
                                          children: [
                                            SizedBox(
                                              width: width / 18,
                                            ),
                                            Text(
                                              "Nombre de Usuario",
                                              style: TextStyle(
                                                color: notifire.getdarkscolor,
                                                fontSize: height / 50,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: height / 70,
                                        ),
                                        Registrar.textField(
                                            notifire.getdarkscolor,
                                            notifire.getdarkgreycolor,
                                            notifire.getorangeprimerycolor,
                                            "images/user.png",
                                            "Nombre de Usuario",
                                            notifire.getdarkwhitecolor,
                                            _nombreUsuarioController,
                                            false),
                                        SizedBox(
                                          height: height / 35,
                                        ),
                                        Row(
                                          children: [
                                            SizedBox(
                                              width: width / 18,
                                            ),
                                            Text(
                                              CustomStrings.email,
                                              style: TextStyle(
                                                color: notifire.getdarkscolor,
                                                fontSize: height / 50,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: height / 70,
                                        ),
                                        Registrar.textField(
                                            notifire.getdarkscolor,
                                            notifire.getdarkgreycolor,
                                            notifire.getorangeprimerycolor,
                                            "images/email.png",
                                            CustomStrings.emailhint,
                                            notifire.getdarkwhitecolor,
                                            _emailController,
                                            true),
                                        SizedBox(
                                          height: height / 35,
                                        ),
                                        Row(
                                          children: [
                                            SizedBox(
                                              width: width / 18,
                                            ),
                                            Text(
                                              CustomStrings.password,
                                              style: TextStyle(
                                                color: notifire.getdarkscolor,
                                                fontSize: height / 50,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: height / 70,
                                        ),
                                        textfieldss(
                                            notifire.getdarkscolor,
                                            notifire.getdarkgreycolor,
                                            notifire.getorangeprimerycolor,
                                            "images/password.png",
                                            CustomStrings.createpassword,
                                            "images/show.png",
                                            _contraseniaController),
                                        SizedBox(
                                          height: height / 35,
                                        ),
                                        Row(
                                          children: [
                                            SizedBox(
                                              width: width / 18,
                                            ),
                                            Text(
                                              CustomStrings.confirmpassword,
                                              style: TextStyle(
                                                color: notifire.getdarkscolor,
                                                fontSize: height / 50,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: height / 70,
                                        ),
                                        textfieldss(
                                            notifire.getdarkscolor,
                                            notifire.getdarkgreycolor,
                                            notifire.getorangeprimerycolor,
                                            "images/password.png",
                                            CustomStrings.retypepassword,
                                            "images/show.png",
                                            _contraseniaconfirmarController),
                                        SizedBox(
                                          height: height / 35,
                                        ),
                                        GestureDetector(
                                          onTap: () {},
                                          child: Custombutton.button(
                                              notifire.getorangeprimerycolor,
                                              CustomStrings.registeraccount,
                                              width / 2),
                                        ),
                                      ],
                                    ),
                                  )
                                : Column(
                                    children: [
                                      SizedBox(
                                        height: height / 15,
                                      ),
                                      Row(
                                        children: [
                                          SizedBox(
                                            width: width / 18,
                                          ),
                                          Text(
                                            "Ingrese su DNI",
                                            style: TextStyle(
                                              color: notifire.getdarkscolor,
                                              fontSize: height / 50,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: height / 70,
                                      ),
                                      DNI.textField(
                                          notifire.getdarkscolor,
                                          notifire.getdarkgreycolor,
                                          notifire.getorangeprimerycolor,
                                          "images/DNI.png",
                                          "DNI",
                                          notifire.getdarkwhitecolor,
                                          _identidadController),
                                      SizedBox(
                                        height: height / 35,
                                      ),
                                      GestureDetector(
                                        onTap: () async {
                                          if (_identidadController
                                              .text.isNotEmpty) {
                                            IdentidadRegistro(
                                                context, _identidadController);
                                            final prefs =
                                                await SharedPreferences
                                                    .getInstance();

                                            setState(() {
                                              inputsVisibles = true;

                                              _nombreCompletoController.text =
                                                  prefs
                                                      .getString("fcNombre")
                                                      .toString();
                                              _emailController.text = prefs
                                                  .getString("fcCorreo")
                                                  .toString();
                                            });
                                          } else {
                                            CherryToast.warning(
                                              backgroundColor:
                                                  notifire.getbackcolor,
                                              title: Text('Coloque su número de Identidad',
                                                  style: TextStyle(
                                                      color: notifire
                                                          .getdarkscolor),
                                                  textAlign: TextAlign.start),
                                              borderRadius: 5,
                                            ).show(context);
                                          }
                                        },
                                        child: Custombutton.button(
                                            notifire.getorangeprimerycolor,
                                            "Verificar",
                                            width / 2),
                                      ),
                                      SizedBox(
                                        height: height / 35,
                                      ),
                                    ],
                                  ),
                          ),
                        ),
                      ),
                    ]),
                    SizedBox(
                      height: height / 40,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          CustomStrings.accounts,
                          style: TextStyle(
                            color: notifire.getdarkgreycolor.withOpacity(0.6),
                            fontSize: height / 50,
                          ),
                        ),
                        SizedBox(
                          width: width / 100,
                        ),
                        Text(
                          CustomStrings.loginhear,
                          style: TextStyle(
                            color: notifire.getdarkscolor,
                            fontSize: height / 50,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  children: [
                    SizedBox(
                      height: height / 60,
                    ),
                    Center(
                      child: Image.asset(
                        "images/logos.png",
                        height: height / 8,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget textfieldss(textclr, hintclr, borderclr, img, hinttext, img2,
      TextEditingController controller) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width / 18),
      child: Container(
        color: Colors.transparent,
        height: height / 15,
        child: TextField(
          autofocus: false,
          style: TextStyle(
            fontSize: height / 50,
            color: textclr,
          ),
          decoration: InputDecoration(
            hintText: hinttext,
            filled: true,
            fillColor: notifire.getwhite,
            suffixIcon: Padding(
              padding: EdgeInsets.symmetric(
                  vertical: height / 50, horizontal: height / 70),
              child: Image.asset(
                img2,
                color: notifire.getorangeprimerycolor,
                height: height / 50,
              ),
            ),
            prefixIcon: Padding(
              padding: EdgeInsets.symmetric(
                  vertical: height / 100, horizontal: height / 70),
              child: Image.asset(
                img,
                height: height / 30,
              ),
            ),
            hintStyle: TextStyle(color: hintclr, fontSize: height / 60),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: borderclr),
              borderRadius: BorderRadius.circular(10),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.grey.withOpacity(0.4),
              ),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ),
    );
  }
}
