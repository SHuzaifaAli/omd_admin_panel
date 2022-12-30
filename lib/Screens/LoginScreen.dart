
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:omd_admin_panel/Screens/LandingScreen.dart';
import 'package:omd_admin_panel/Services/Services.dart';
import 'package:omd_admin_panel/main.dart';

class LoginPageWidget extends StatefulWidget {
  const LoginPageWidget({Key? key}) : super(key: key);

  @override
  _LoginPageWidgetState createState() => _LoginPageWidgetState();
}

class _LoginPageWidgetState extends State<LoginPageWidget> {
  TextEditingController? textController1;
  TextEditingController? textController2;

  late bool passwordVisibility;
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    textController1 = TextEditingController();
    textController2 = TextEditingController();
    passwordVisibility = false;
  }

  @override
  void dispose() {
    textController1?.dispose();
    textController2?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Theme.of(context).backgroundColor,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Container(
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
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/splash_illustrations.png',
                width: 150,
                height: 150,
                fit: BoxFit.cover,
              ),
              Form(
                key: formKey,
                autovalidateMode: AutovalidateMode.disabled,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    SizedBox(
                      width: 250,
                      child: TextFormField(
                        controller: textController1,
                        autofocus: true,
                        obscureText: false,
                        validator: (value){
                          if(value == null || value != "admin"){
                            return "provide a valid email";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          isDense: true,
                          labelText: 'Admin',
                          hintText: 'Admin Name',
                          hintStyle: Theme.of(context).textTheme.bodyText2,
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0x00000000),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0x00000000),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0xFFF80202),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0xFFF80202),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          prefixIcon: Icon(
                            Icons.person_sharp,
                            color: Theme.of(context)
                                .colorScheme.onPrimary,
                          ),
                        ),
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                    ),
                    const SizedBox(height: 10,),
                    SizedBox(
                      width: 250,
                      child: TextFormField(
                        controller: textController2,
                        autofocus: true,
                        obscureText: !passwordVisibility,
                        validator: (value){
                          if(value == null || value != "admin"){
                            return "provide a valid password";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          isDense: true,
                          labelText: 'Password',
                          hintText: 'Password',
                          hintStyle: Theme.of(context).textTheme.bodyText2,
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0x00000000),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0x00000000),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0xFFF80202),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0xFFF80202),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          prefixIcon: Icon(
                            Icons.content_paste,
                            color: Theme.of(context)
                                .colorScheme.onPrimary,
                          ),
                          suffixIcon: InkWell(
                            onTap: () => setState(
                                  () =>
                              passwordVisibility = !passwordVisibility,
                            ),
                            focusNode: FocusNode(skipTraversal: true),
                            child: Icon(
                              passwordVisibility
                                  ? Icons.visibility_outlined
                                  : Icons.visibility_off_outlined,
                              color: Theme.of(context)
                                  .colorScheme.onPrimary,
                              size: 22,
                            ),
                          ),
                        ),
                          style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                      child: ElevatedButton(
                        onPressed: () async {
                          if(formKey.currentState!.validate()) {
                            Services().changeScreenWithDelayAndReplace(
                                context, () =>
                            const LadingPageWidget(), 1);
                            // context.goNamed(
                            //   'loginPage',
                            //   extra: <String, dynamic>{
                            //     kTransitionInfoKey: TransitionInfo(
                            //       hasTransition: true,
                            //       transitionType: PageTransitionType.topToBottom,
                            //       duration: const Duration(milliseconds: 200),
                            //     ),
                            //   },
                            // );
                          }
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
