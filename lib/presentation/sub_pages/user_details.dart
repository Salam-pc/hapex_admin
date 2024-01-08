import 'package:flutter/material.dart';
import 'package:hapex_admin/core/common_widgets.dart';

class UserDetails extends StatelessWidget {
  const UserDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.arrow_back_ios_new_outlined),
                    )
                  ],
                ),
                kSizedBoxHeight(height: 20),
                CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage('assets/images/user_icon.png'),
                ),
                kSizedBoxHeight(height: 10),
                Text('Philiph'),
                kSizedBoxHeight(height: 10),
                Text(
                  '1234567890 | test@gmail.com',
                  style: TextStyle(fontSize: 12),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
