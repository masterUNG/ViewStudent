import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:viewstudent/models/user_model.dart';
import 'package:viewstudent/states/add_profile_student.dart';
import 'package:viewstudent/utility/my_constant.dart';
import 'package:viewstudent/widgets/show_button.dart';
import 'package:viewstudent/widgets/show_progress.dart';
import 'package:viewstudent/widgets/show_text.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  bool load = true;
  bool? haveData;
  UserModel? userModel;

  @override
  void initState() {
    super.initState();
    findProfile();
  }

  Future<void> findProfile() async {
    var user = FirebaseAuth.instance.currentUser;

    await FirebaseFirestore.instance
        .collection('user')
        .doc(user!.uid)
        .get()
        .then((value) {
      if (value.data() == null) {
        haveData = false;
      } else {
        haveData = true;

        userModel = UserModel.fromMap(value.data()!);
      }
      load = false;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return load
        ? const ShowProgress()
        : haveData!
            ? ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 16),
                    width: 250,
                    height: 250,
                    child: Image.network(userModel!.urlProfile),
                  ),
                  newContent(head: 'รหัส:', value: userModel!.idStudent),
                  newContent(head: 'ชื่อ:', value: userModel!.name),
                  newContent(head: 'ชั้นปี:', value: userModel!.yearStudent),
                  newContent(head: 'แผนก:', value: userModel!.divition),
                  newContent(
                      head: 'อาจารย์ที่ปรึกษา:', value: userModel!.teacher),
                ],
              )
            : newNoProfile(context);
  }

  Column newContent({required String head, required String value}) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 1,
              child: ShowText(
                text: head,
                textStyle: MyConstant().h2Style(),
              ),
            ),
            Expanded(
              flex: 1,
              child: ShowText(text: value),
            ),
          ],
        ),
        Divider(color: MyConstant.dark,thickness: 1,),
      ],
    );
  }

  Center newNoProfile(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ShowText(
            text: 'No Profile',
            textStyle: MyConstant().h1Style(),
          ),
          ShowButton(
            label: 'Create Profile',
            pressFunc: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AddProfileStudent(),
                ),
              ).then((value) {
                load = true;
                findProfile();
                setState(() {});
              });
            },
          )
        ],
      ),
    );
  }
}
