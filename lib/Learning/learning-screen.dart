import 'package:flutter/material.dart';

const String rubbish = 'lib/assets/rubbish.png';
const Color mainColor = Color.fromRGBO(54, 255, 4, 100);
const Color glowColor = Color.fromRGBO(18, 145, 6, 1);
const TextStyle ourStyle = TextStyle(
    fontSize: 20,
    color: Colors.black,
    fontWeight: FontWeight.bold,
    fontFamily: 'Anaqa');

Widget myBox({
  required int h,
  required int w,
  required Color c1,
  bool isCircle = false,
  required Widget child,
  final onClick,
}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: GestureDetector(
      onTap: onClick == null ? () {} : onClick,
      child: Container(
        child: Center(
          child: child,
        ),
        width: w.toDouble(),
        height: h.toDouble(),
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: glowColor,
                  spreadRadius: 5,
                  blurRadius: 12,
                  offset: Offset(0, 8))
            ],
            shape: isCircle ? BoxShape.circle : BoxShape.rectangle,
            color: c1,
            borderRadius:
                isCircle ? null : BorderRadius.all(Radius.circular(20))),
      ),
    ),
  );
}

Widget custemTF({required IconData icn, final saved}) {
  return Padding(
    padding: const EdgeInsets.all(15),
    child: TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return 'ادخل المطلوب هنا';
        }
      },
      onSaved: saved,
      decoration: InputDecoration(
          icon: Icon(
            icn,
            color: mainColor,
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              borderSide: BorderSide(color: mainColor)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              borderSide: BorderSide(color: mainColor)),
          fillColor: mainColor,
          filled: true,
          focusColor: mainColor),
    ),
  );
}

class Learning extends StatefulWidget {
  const Learning({super.key});

  @override
  State<Learning> createState() => _LearningState();
}

class _LearningState extends State<Learning> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "التالي",
            style: ourStyle,
          ),
        ),
        body: Center(child: custemTF(icn: Icons.lock)));
  }
}





/*
class Learning extends StatefulWidget {
  const Learning({super.key});

  @override
  State<Learning> createState() => _LearningState();
}

class _LearningState extends State<Learning> {
  List<UserModel> users = [
    UserModel(name: "7asabala", number: 012101023210, photo: 'gvbhjnmk'),
    UserModel(name: "gbhjnk", number: 012101023210, photo: 'gvbhjnmk'),
    UserModel(name: "f7t6yugjhl", number: 012101023210, photo: 'gvbhjnmk'),
    UserModel(name: "juh", number: 012101023210, photo: 'gvbhjnmk'),
    UserModel(name: "drtfgyuhjio", number: 012101023210, photo: 'gvbhjnmk'),
    UserModel(name: "cvbn", number: 012101023210, photo: 'gvbhjnmk'),
    UserModel(name: "ygihn", number: 012101023210, photo: 'gvbhjnmk'),
    UserModel(name: "6yu h", number: 012101023210, photo: 'gvbhjnmk'),
    UserModel(name: "yyiopi", number: 012101023210, photo: 'gvbhjnmk'),
  ];
  var _currentStep = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
        ),
        backgroundColor: Colors.amber,
        body: ListView.separated(
            itemBuilder: (context, index) => buildMyRow(users[index]),
            separatorBuilder: (context, index) => Divider(
                  color: Colors.black,
                ),
            itemCount: users.length));
  }
}

class UserModel {
  final String name;
  final int number;
  final String photo;
  UserModel({required this.name, required this.number, required this.photo});
}

Widget buildMyRow(UserModel userModel) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      width: double.infinity,
      height: 65,
      decoration: BoxDecoration(
          color: Colors.yellow,
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: Row(
        children: [
          CircleAvatar(
            radius: 30,
            child: FlutterLogo(
              size: 30,
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [Text(userModel.name), Text(userModel.photo.toString())],
          )
        ],
      ),
    ),
  );
}

*/