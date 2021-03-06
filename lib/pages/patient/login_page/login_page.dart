import 'package:app/components/button.dart';
import 'package:app/components/header.dart';
import 'package:app/components/themed_scaffold.dart';
import 'package:app/components/themed_text_field.dart';
import 'package:app/globals/app_theme.dart';
import 'package:app/pages/patient/sign_up_page.dart';
import 'package:flutter/material.dart';

import '../home_page.dart';
import 'login_function.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String patientNumber, password;

  @override
  Widget build(BuildContext context) {
    return ThemedScaffold([
      Header(
        'Patient Login',
        color: AppTheme.scaffoldColor,
        showBack: true,
      ),
      SliverToBoxAdapter(
        child: Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: ClipRRect(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(32), topRight: Radius.circular(32)),
            child: Container(
              height: MediaQuery.of(context).size.height,
              color: AppTheme.scaffoldColor,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 32),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        'assets/vaxifiedicon.png',
                        height: 142,
                      ),
                    ),
                  ),
                  ThemedTextField(
                    text: 'Patient Number',
                    onChanged: (v) => patientNumber = v,
                  ),
                  ThemedTextField(
                    text: 'Password',
                    onChanged: (v) => password = v,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          child: Text('Sign Up'),
                          onPressed: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignUpPage())),
                        ),
                        TextButton(
                          child: Text('Forgot Password'),
                          onPressed: () {},
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: double.infinity,
                      child: Button('Log In', onPressed: () async {
                        if (patientNumber == null) return;
                        bool canLogin = await login(
                            int.parse(patientNumber), password ?? '', context);
                        canLogin
                            ? Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomePage(
                                          patientNumber:
                                              int.parse(patientNumber),
                                        )))
                            : print('no');
                      }),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      )
    ], color: AppTheme.primary);
  }
}
