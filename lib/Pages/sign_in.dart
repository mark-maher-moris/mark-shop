import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mark_shop/provider/modelHub.dart';
import 'package:provider/provider.dart';
import '/Constance/custm_textfeild.dart';
import '/Learning/learning-screen.dart';
import '/Pages/home.dart';
import '/Pages/sign_up.dart';
import '/serveses/auth.dart';
import 'package:rive/rive.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:provider/provider.dart';

class SignIn extends StatelessWidget {
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  Auth authObj = Auth();
  String? errorMsg;
  String? gEmail;
  String? gPass;
  //String _email, Pass;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ChangeNotifierProvider<ModelHub>(
        create: (context) => ModelHub(),
        child: Scaffold(
          backgroundColor: Color(0xfff03c5c),
          body: Center(child: SingleChildScrollView(
            child: ProgressHUD(
              child: Builder(builder: (context) {
                return Form(
                  key: _globalKey,
                  child: Column(
                    children: [
                      Container(
                        height: 200,
                        width: 400,
                        child: RiveAnimation.network(
                          'https://cdn.rive.app/animations/vehicles.riv',
                        ),
                      ),
                      CustemTextFeild(
                          onClick: (val) {
                            gEmail = val;
                          },
                          isPassword: false,
                          hint: 'Enter your email'),
                      CustemTextFeild(
                          onClick: (pval) {
                            gPass = pval;
                          },
                          isPassword: true,
                          hint: 'Enter your password'),
                      ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignUp()));
                          },
                          child: Text('do\'t have an account : Sign up Now'),
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                Color.fromARGB(255, 138, 137, 243)),
                          )),
                      ElevatedButton(
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text("e.message.toString()")));
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Learning()));
                          },
                          child: Text('Leaning')),
                      ElevatedButton(
                          child: Text('Go'),
                          onPressed: () async {
                            if (_globalKey.currentState!.validate()) {
                              try {
                                print('there is no problem go to the backend ');
                                _globalKey.currentState!.save();
                               await authObj.signUp(
                                    emil: gEmail.toString(),
                                    pass: gPass.toString());
                                    
                                print('*************');
                              } on PlatformException catch (e) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content: Text(e.message.toString())));
                              }
                            }
                          }),
                    ],
                  ),
                );
              }),
            ),
          )),
        ),
      ),
    );
  }
}
/*
  Fluttertoast.showToast(
                          msg: errorMsg.toString(),
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.green,
                          textColor: Colors.white,
                          fontSize: 16.0);
*/