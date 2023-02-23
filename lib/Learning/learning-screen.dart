import 'package:flutter/material.dart';

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


