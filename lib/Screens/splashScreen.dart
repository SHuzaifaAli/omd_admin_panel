import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:omd_admin_panel/Screens/LoginScreen.dart';
import 'package:omd_admin_panel/Services/Services.dart';
import 'package:omd_admin_panel/main.dart';
import 'package:page_transition/page_transition.dart';

class SplashScreenWidget extends StatefulWidget {
  const SplashScreenWidget({Key? key}) : super(key: key);

  @override
  _SplashScreenWidgetState createState() =>
      _SplashScreenWidgetState();
}

class _SplashScreenWidgetState extends State<SplashScreenWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFF4B39EF),
                Color(0xFF39D2C0),
              ],
              stops: [0, 1],
              begin: AlignmentDirectional(1, -0.98),
              end: AlignmentDirectional(-1, 0.98),
            ),
            shape: BoxShape.rectangle,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Align(
                alignment: const AlignmentDirectional(0, -0.05),
                child: Image.asset(
                  'assets/images/splash_illustrations.png',
                  width: 150,
                  height: 150,
                  fit: BoxFit.cover,
                ),
              ),
              const Text(
                'OMD Admin Panel',
                style: TextStyle(
                  fontFamily: 'Montserrat', fontSize: 30,
                  color: Colors.white,
                  fontStyle: FontStyle.italic,
                  // Theme!.of(context).textTheme.copyWith(
                  //   fontFamily: 'Montserrat',
                  //   fontSize: 30,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                child: ElevatedButton(
                  onPressed: () async {
                    Services().changeScreenWithDelayAndPush(context,()=>const LoginPageWidget(),1);
                  },
                  style: ElevatedButton.styleFrom(
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(8),
                      ),
                    ),
                    elevation: 20,
                    backgroundColor: const Color(0xFF39C9EF),
                    side: const BorderSide(
                      color: Colors.transparent,
                      width: 1,
                    ),
                  ),
                  child: const Text(
                    'Get Started',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
