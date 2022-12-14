import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:viewstudent/utility/my_constant.dart';
import 'package:viewstudent/utility/my_dialog.dart';
import 'package:viewstudent/widgets/show_button.dart';
import 'package:viewstudent/widgets/show_form.dart';
import 'package:viewstudent/widgets/show_image.dart';
import 'package:viewstudent/widgets/show_text.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String? user, password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: MyConstant().bgBox(),
        child: ListView(
          children: [
            makeCenter(widget: newLogo()),
            makeCenter(
                widget: ShowText(
              text: 'วิทยาลัยเทคนิคสมุทรสงคราม',
              textStyle: MyConstant().h2WhiteStyle(),
            )),
            makeCenter(
                widget: ShowForm(
              hint: 'ชื่อผู้ใช้งาน',
              iconData: Icons.person,
              changeFunc: (String string) {
                user = string.trim();
              },
            )),
            makeCenter(
                widget: ShowForm(
              obsecu: true,
              hint: 'รหัสผ่าน',
              iconData: Icons.lock,
              changeFunc: (p0) {
                password = p0.trim();
              },
            )),
            makeCenter(
                widget: Container(
              margin: const EdgeInsets.only(top: 16),
              width: 250,
              child: ShowButton(
                colorPrimary: Colors.white,
                label: 'เข้าสู่ระบบ',
                pressFunc: () {
                  if ((user?.isEmpty ?? true) || (password?.isEmpty ?? true)) {
                    MyDialog(context: context).normalDialog(
                        title: 'Have Space ?',
                        subTitle: 'Please Fill Every Blank');
                  } else {
                    processCheckLogin();
                  }
                },
              ),
            ))
          ],
        ),
      ),
    );
  }

  Row makeCenter({required Widget widget}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        widget,
      ],
    );
  }

  Container newLogo() {
    return Container(
      margin: const EdgeInsets.only(top: 16, bottom: 32),
      width: 150,
      child: const ShowImage(),
    );
  }

  Future<void> processCheckLogin() async {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: user!, password: password!)
        .then((value) {
      Navigator.pushNamedAndRemoveUntil(
          context, '/appService', (route) => false);
    }).catchError((error) {
      MyDialog(context: context)
          .normalDialog(title: error.code, subTitle: error.message);
    });
  }
}
