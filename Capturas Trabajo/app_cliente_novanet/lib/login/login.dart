import 'package:cherry_toast/cherry_toast.dart';
import 'package:flutter/material.dart';
import 'package:gobank/login/register.dart';
import 'package:gobank/profile/forgotpassword.dart';
import 'package:gobank/service/pruebaService.dart';
import 'package:gobank/utils/button.dart';
import 'package:gobank/utils/string.dart';
import 'package:gobank/utils/textfeilds.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../utils/colornotifire.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
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

  TextEditingController fcUsuarioAcceso = TextEditingController();
  TextEditingController fcPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    notifire = Provider.of<ColorNotifire>(context, listen: true);
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: notifire.getprimerycolor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: height,
                  width: width,
                  color: Colors.transparent,
                  child:
                      Image.asset("images/background.png", fit: BoxFit.cover),
                ),
                Column(
                  children: [
                    SizedBox(
                      height: height / 3,
                    ),
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Center(
                          child: Container(
                            height: height / 1.2,
                            width: width / 1.1,
                            decoration: BoxDecoration(
                              color: notifire.gettabwhitecolor,
                              borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(40),
                                topLeft: Radius.circular(40),
                              ),
                            ),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: height / 10,
                                ),
                                Row(
                                  children: [
                                    SizedBox(
                                      width: width / 18,
                                    ),
                                    Text(
                                      CustomStrings.user,
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
                                LoginTxt.textField(
                                    notifire.getdarkscolor,
                                    notifire.getdarkgreycolor,
                                    notifire.getbluecolor,
                                    "images/user.png",
                                    CustomStrings.userhint,
                                    notifire.getdarkwhitecolor,
                                    fcUsuarioAcceso),
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
                                LoginTxt.textField(
                                    notifire.getdarkscolor,
                                    notifire.getdarkgreycolor,
                                    notifire.getbluecolor,
                                    "images/password.png",
                                    CustomStrings.passwordhint,
                                    notifire.getdarkwhitecolor,
                                    fcPassword),
                                SizedBox(
                                  height: height / 35,
                                ),
                                Row(
                                  children: [
                                    const Spacer(),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const Register(),
                                          ),
                                        );
                                      },
                                      child: Container(
                                        height: height / 40,
                                        color: Colors.transparent,
                                        child: Text(
                                          'Registrarse',
                                          style: TextStyle(
                                              color: notifire.getdarkscolor,
                                              fontSize: height / 60,
                                              fontFamily: 'Gilroy Medium'),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: width / 18,
                                    ),
                                    const Spacer(),
                                    const Spacer(),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const ForgotPassword(),
                                          ),
                                        );
                                      },
                                      child: Container(
                                        height: height / 40,
                                        color: Colors.transparent,
                                        child: Text(
                                          CustomStrings.forgotpassword,
                                          style: TextStyle(
                                              color: notifire.getdarkscolor,
                                              fontSize: height / 60,
                                              fontFamily: 'Gilroy Medium'),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: width / 18,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: height / 20,
                                ),
                                GestureDetector(
                                  onTap: () { 
                                    if (fcUsuarioAcceso.text.isEmpty || fcPassword.text.isEmpty) {
                                      CherryToast.warning(
                                              backgroundColor:
                                                  notifire.getbackcolor,
                                              title: Text('Llene los campos vacios',
                                                  style: TextStyle(
                                                      color: notifire
                                                          .getdarkscolor),
                                                  textAlign: TextAlign.start),
                                              borderRadius: 5,
                                            ).show(context);
                                    }
                                    else{
                                    fetchLogin(context, fcUsuarioAcceso.text, fcPassword.text,notifire.getbackcolor,notifire.getdarkscolor);
                                    
                                    }
                                  },
                                  child: Custombutton.button(
                                      notifire.getorangeprimerycolor,
                                      CustomStrings.login,
                                      width / 2),
                                ),
                                SizedBox(
                                  height: height / 50,
                                ),
                                const SizedBox(height: 50),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          left: 0,
                          right: 0,
                          top: -55,
                          child: Center(
                            child: Image.asset(
                              "images/NOVANETLOGO.png",
                              height: height / 12.5,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  children: [
                    SizedBox(
                      height: height / 15,
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
}
