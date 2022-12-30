import 'package:flutter/material.dart';
import 'package:omd_admin_panel/Services/Services.dart';

import 'Listing/MediceinLisiting.dart';
import 'Listing/OrderListing.dart';
import 'Listing/UserListing.dart';

class LadingPageWidget extends StatefulWidget {
  const LadingPageWidget({Key? key}) : super(key: key);

  @override
  _LadingPageWidgetState createState() => _LadingPageWidgetState();
}

class _LadingPageWidgetState extends State<LadingPageWidget> {
  TextEditingController? textController;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
  }

  @override
  void dispose() {
    textController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      // backgroundColor: Theme.of(context).backgroundColor,
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
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 120,
              decoration: const BoxDecoration(
                shape: BoxShape.rectangle,
              ),
              child: Padding(
                padding:
                    const EdgeInsetsDirectional.fromSTEB(0, 44, 0, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          20, 0, 0, 0),
                      child: Image.asset(
                        'assets/images/splash_illustrations.png',
                        width: 100,
                        height: 100,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          0, 16, 0, 0),
                      child: Container(
                        width:
                            MediaQuery.of(context).size.width * 0.55,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.white70,
                          // const Color(0xFF4B39EF),

                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: const Color(0xFF000000),
                            width: 2,
                          ),
                        ),
                        child: Padding(
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(
                                  8, 0, 8, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              const Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(
                                        4, 0, 4, 0),
                                child: Icon(
                                  Icons.search_rounded,
                                  color: Color(0xFF95A1AC),
                                  size: 24,
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsetsDirectional
                                      .fromSTEB(4, 0, 0, 0),
                                  child: TextFormField(
                                    controller: textController,
                                    obscureText: false,
                                    decoration: const InputDecoration(
                                      labelText: 'Search...',
                                      enabledBorder:
                                          OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 1,
                                        ),
                                        borderRadius:
                                            BorderRadius.only(
                                          topLeft:
                                              Radius.circular(4.0),
                                          topRight:
                                              Radius.circular(4.0),
                                        ),
                                      ),
                                      focusedBorder:
                                          OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 1,
                                        ),
                                        borderRadius:
                                            BorderRadius.only(
                                          topLeft:
                                              Radius.circular(4.0),
                                          topRight:
                                              Radius.circular(4.0),
                                        ),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 1,
                                        ),
                                        borderRadius:
                                            BorderRadius.only(
                                          topLeft:
                                              Radius.circular(4.0),
                                          topRight:
                                              Radius.circular(4.0),
                                        ),
                                      ),
                                      focusedErrorBorder:
                                          OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 1,
                                        ),
                                        borderRadius:
                                            BorderRadius.only(
                                          topLeft:
                                              Radius.circular(4.0),
                                          topRight:
                                              Radius.circular(4.0),
                                        ),
                                      ),
                                    ),
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1!
                                        .copyWith(
                                          fontFamily: 'Poppins',
                                          color:
                                              const Color(0xFF95A1AC),
                                        ),
                                    maxLines: null,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: const AlignmentDirectional(-1, 0),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(
                    20, 12, 0, 12),
                child: Text(
                  'Activities you can perform',
                  style:
                      Theme.of(context).textTheme.headline6!.copyWith(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.bold,
                          ),
                ),
              ),
            ),
            Wrap(
              spacing: 20,
              runSpacing: 20,
              alignment: WrapAlignment.center,
              crossAxisAlignment: WrapCrossAlignment.start,
              direction: Axis.horizontal,
              runAlignment: WrapAlignment.center,
              verticalDirection: VerticalDirection.down,
              clipBehavior: Clip.none,
              children: [
                InkWell(
                  onTap: () async {
                    Services().changeScreenWithDelayAndPush(context, () => UserListing("User Listing"), 1);
                    // context.pushNamed(
                    //   'UserListing',
                    //   extra: <String, dynamic>{
                    //     kTransitionInfoKey: TransitionInfo(
                    //       hasTransition: true,
                    //       transitionType: PageTransitionType.fade,
                    //       duration: const Duration(milliseconds: 200),
                    //     ),
                    //   },
                    // );
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.45,
                    decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                          blurRadius: 4,
                          color: Color(0x3600000F),
                          offset: Offset(0, 2),
                        )
                      ],
                      gradient: const LinearGradient(
                        colors: [
                          Color(0xFF4B39EF),
                          Color(0xFF39D2C0),
                        ],
                        stops: [0, 1],
                        begin: AlignmentDirectional(1, -0.34),
                        end: AlignmentDirectional(-1, 0.34),
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    alignment: const AlignmentDirectional(-0.0, 0),
                    child: Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          0, 0, 0, 12),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: ClipRRect(
                                  borderRadius:
                                      const BorderRadius.only(
                                    bottomLeft: Radius.circular(0),
                                    bottomRight: Radius.circular(0),
                                    topLeft: Radius.circular(8),
                                    topRight: Radius.circular(8),
                                  ),
                                  child: Image.asset(
                                    'assets/images/users.png',
                                    width: 100,
                                    height: 110,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding:
                                const EdgeInsetsDirectional.fromSTEB(
                                    0, 4, 0, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: const EdgeInsetsDirectional
                                      .fromSTEB(8, 4, 0, 0),
                                  child: Text(
                                    'See Users',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1!,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () async {
                    Services().changeScreenWithDelayAndPush(context, () => MedicineListing("Medicine Listing"), 1);

                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.45,
                    decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                          blurRadius: 4,
                          color: Color(0x3600000F),
                          offset: Offset(0, 2),
                        )
                      ],
                      gradient: const LinearGradient(
                        colors: [
                          Color(0xFF4B39EF),
                          Color(0xFF39D2C0),
                        ],
                        stops: [0, 1],
                        begin: AlignmentDirectional(1, -0.34),
                        end: AlignmentDirectional(-1, 0.34),
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          0, 0, 0, 12),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: ClipRRect(
                                  borderRadius:
                                      const BorderRadius.only(
                                    bottomLeft: Radius.circular(0),
                                    bottomRight: Radius.circular(0),
                                    topLeft: Radius.circular(8),
                                    topRight: Radius.circular(8),
                                  ),
                                  child: Image.asset(
                                    'assets/images/mediciens.jpeg',
                                    width: 100,
                                    height: 110,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding:
                                const EdgeInsetsDirectional.fromSTEB(
                                    0, 4, 0, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: const EdgeInsetsDirectional
                                      .fromSTEB(8, 4, 0, 0),
                                  child: Text(
                                    'See Medicine',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1!,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () async {
                    Services().changeScreenWithDelayAndPush(context, () => OrderListing("Order Listing"), 1);

                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.45,
                    decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                          blurRadius: 4,
                          color: Color(0x3600000F),
                          offset: Offset(2, 2),
                        )
                      ],
                      gradient: const LinearGradient(
                        colors: [
                          Color(0xFF4B39EF),
                          Color(0xFF39D2C0),
                        ],
                        stops: [0, 1],
                        begin: AlignmentDirectional(1, -0.34),
                        end: AlignmentDirectional(-1, 0.34),
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          0, 0, 0, 12),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: ClipRRect(
                                  borderRadius:
                                      const BorderRadius.only(
                                    bottomLeft: Radius.circular(0),
                                    bottomRight: Radius.circular(0),
                                    topLeft: Radius.circular(8),
                                    topRight: Radius.circular(8),
                                  ),
                                  child: Image.asset(
                                    'assets/images/orders.jpeg',
                                    width: 100,
                                    height: 110,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding:
                                const EdgeInsetsDirectional.fromSTEB(
                                    0, 4, 0, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: const EdgeInsetsDirectional
                                      .fromSTEB(8, 4, 0, 0),
                                  child: Text('See Orders',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText1),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
