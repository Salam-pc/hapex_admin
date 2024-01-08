import 'package:flutter/material.dart';
import 'package:hapex_admin/core/constants.dart';
import 'package:hapex_admin/core/function.dart';
import 'package:hapex_admin/presentation/sub_pages/functions.dart';

class VerifyNewUsers extends StatelessWidget {
  const VerifyNewUsers({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kMainBlueColor,
        centerTitle: true,
        title: Text(
          'Verify New Users',
          style: TextStyle(letterSpacing: 1),
        ),
      ),
      body: ListView.separated(
        itemCount: 5,
        separatorBuilder: (context, index) => Divider(),
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage('assets/images/user_icon.png'),
            ),
            title: Text(
              'USER $index',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('USER$index@gmail'),
                Text('123456789$index'),
              ],
            ),
            tileColor: kMainCreamColor,
            trailing: MaterialButton(
                color: kMainOrengeColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
                onPressed: () {
                  userVerification(context);
                },
                child: Text(
                  'Verified',
                  style: TextStyle(color: kTextWhiteColor),
                )),
          );
        },
      ),
    );
  }
}
