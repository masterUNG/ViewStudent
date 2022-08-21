import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:viewstudent/utility/my_constant.dart';
import 'package:viewstudent/utility/my_dialog.dart';
import 'package:viewstudent/widgets/show_text.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  var titles = <String>[
    'ประวัตินักศึกษา',
    'ผลการเรียน',
    'สถานะตรวจสภาพ',
    'ตารางสอน',
    'ออกจากระบบ',
  ];

  var iconDatas = <IconData>[
    Icons.history_edu,
    Icons.school,
    Icons.check_box,
    Icons.table_chart,
    Icons.exit_to_app,
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: titles.length,
      itemBuilder: (context, index) => InkWell(
        onTap: () {
          print('you click index ===>> $index');

          switch (index) {
            case 4:
              processSignOut();
              break;
            default:
          }
        },
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    iconDatas[index],
                    size: 36,
                    color: Colors.grey.shade700,
                  ),
                ),
                ShowText(
                  text: titles[index],
                  textStyle: MyConstant().h2Style(),
                ),
              ],
            ),
            Divider(
              color: Colors.grey.shade700,
            ),
          ],
        ),
      ),
    );
  }

  Future<void> processSignOut() async {
    MyDialog(context: context).normalDialog(
      title: 'Confirm SignOut ?',
      subTitle: 'Please Confirm SignOut',
      label: 'SignOut',
      pressFunc: () async {
        await FirebaseAuth.instance.signOut().then((value) {
          Navigator.pushNamedAndRemoveUntil(
              context, '/login', (route) => false);
        });
      },
    );
  }
}
