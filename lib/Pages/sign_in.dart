import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mark_shop/Pages/Admin/adminScreen.dart';
import 'package:mark_shop/provider/modelHub.dart';
import 'package:provider/provider.dart';
import '../provider/adminMode.dart';
import '/Constance/custm_textfeild.dart';
import '/Learning/learning-screen.dart';
import '/Pages/home.dart';
import '/Pages/sign_up.dart';
import '/serveses/auth.dart';
import 'package:rive/rive.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:blurry_modal_progress_hud/blurry_modal_progress_hud.dart';
import 'package:flutter_gif/flutter_gif.dart';

class SignIn extends StatefulWidget {
  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  Auth authObj = Auth();

  String? errorMsg;

  String? gEmail;

  String? gPass;

  var adminPassword = 'Admin1234';
  late Image img1;
  @override
  void initState() {
    img1 = Image.asset(
      'lib/assets/gi.gif',
      fit: BoxFit.cover,
    );
    super.initState();
  }

  //String _email, Pass;
  @override
  Widget build(BuildContext context) {
    var hi = MediaQuery.of(context).size;
    return SafeArea(
      child: BlurryModalProgressHUD(
        blurEffectIntensity: 5,
        inAsyncCall: Provider.of<ModelHud>(context).isLoading,
        child: Scaffold(
          body: Center(child: SingleChildScrollView(
            child: Builder(builder: (context) {
              return Stack(
                children: [
                  Container(height: 700, width: 400, child: img1),
                  Center(
                    child: Form(
                      key: _globalKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 300,
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
                              child:
                                  Text('do\'t have an account : Sign up Now'),
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    Color.fromARGB(255, 138, 137, 243)),
                              )),
                          ElevatedButton(
                              onPressed: () {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text("Learning screen")));
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Learning()));
                              },
                              child: Text('Leaning')),
                          ElevatedButton(
                              onPressed: () async {
                                await authObj.namozag.signOut().whenComplete(
                                    () => ScaffoldMessenger.of(context)
                                        .showSnackBar(SnackBar(
                                            content: Text("Loged Out"))));
                                await authObj.namozag.currentUser;
                              },
                              child: Text('logOut')),
                          ElevatedButton(
                              child: Text('Go'),
                              onPressed: () {
                                _validate(context);
                              }),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            }),
          )),
        ),
      ),
    );
  }

  void _validate(BuildContext context) async {
    final modelHud = Provider.of<ModelHud>(context, listen: false);
    modelHud.cahngeLoading(true);

    if (_globalKey.currentState!.validate()) {
      _globalKey.currentState!.save();
      if (Provider.of<AdminMode>(context, listen: false).isAdmin) {
        //admin
        if (gPass == adminPassword) {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => AdminScreen()));
          //something
        } else {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text('Somthing Went wrong will auth as an admin')));
        }
      } else {
        try {
          await authObj.signIn(emil: gEmail.toString(), pass: gPass.toString());
          FocusManager.instance.primaryFocus?.unfocus();
          modelHud.cahngeLoading(false);
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => Home()));
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('sign in with email and password')));
          print(' -------------------------');
          print(authObj.namozag.currentUser);
        } on PlatformException catch (e) {
          print(' ------------------------- errorrrrrrr');
          modelHud.cahngeLoading(false);
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(e.message.toString())));
        } //
      }
    }
    modelHud.cahngeLoading(false);
  }
}

/*



                          //modelHud.cahngeLoading(true);
                          if (_globalKey.currentState!.validate()) {
                            try {
                              print('there is no problem go to the backend ');
                              _globalKey.currentState!.save();
                              await authObj.signUp(
                                  emil: gEmail.toString(),
                                  pass: gPass.toString());
                              //modelHud.cahngeLoading(false);
                              //  Navigator.push(context,MaterialPageRoute(builder: (context)=>Home());
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Home()));
                              print('*************');
                            } on PlatformException catch (e) {
                              //modelHud.cahngeLoading(false);
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      content: Text(e.message.toString())));
                            }
                          }
                          //modelHud.cahngeLoading(false);



*/














/*
  Fluttertoast.showToast(
                          msg: errorMsg.toString(),7
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.green,
                          textColor: Colors.white,
                          fontSize: 16.0);
*/