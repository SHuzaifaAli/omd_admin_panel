import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:omd_admin_panel/DataProvider/medicine_data_provider.dart';
import 'package:omd_admin_panel/DataProvider/user_data_provider.dart';
import 'package:omd_admin_panel/Model/Response/MedicineListModel/one_medicine.dart';
import 'package:omd_admin_panel/Model/Response/UserModel/OneUserData.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class OneResponseMedic extends StatefulWidget {
  const OneResponseMedic(this.userId, this.userName, {Key? key})
      : super(key: key);
  final userId;
  final userName;

  @override
  State<OneResponseMedic> createState() => _OneResponseMedicState();
}

class _OneResponseMedicState extends State<OneResponseMedic> {
  final MedicineDataProvider medData = MedicineDataProvider();

  @override
  void initState() {
    widget.userId;
    medData.getOneMedicine(widget.userId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
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
          shape: BoxShape.rectangle,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                IconButton(
                  icon: const Icon(Icons.arrow_back),
                  color: Colors.white,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                Text(widget.userName,
                    style: Theme.of(context)
                        .textTheme
                        .headline3!
                        .copyWith(
                            color: const Color(0xFFC8DEE7),
                            fontFamily: "Poppins")),
              ],
            ),
            LinearPercentIndicator(
              percent: 1,
              width: MediaQuery.of(context).size.width,
              lineHeight: 12,
              animationDuration: 1400,
              linearGradient: const LinearGradient(
                colors: [
                  Color(0xFF39D2C0),
                  Color(0xFF613DFF),
                ],
              ),

              animation: true,
              linearGradientBackgroundColor: const LinearGradient(
                colors: [
                  Color(0xFF39D2C0),
                  Color(0xFF4B39EF),
                ],
              ),
              // progressColor: const Color(0xFF39D2C0),
              // backgroundColor: const Color(0xFFE0E3E7),
              barRadius: const Radius.circular(0),
              padding: EdgeInsets.zero,
            ),
            SizedBox(
              height: 40,
            ),
            Center(
              child: Card(
                elevation: 20,
                child: SizedBox(
                  width: 850,
                  height: 500,
                  child: FutureBuilder(
                    future: medData.getOneMedicine(widget.userId),
                    builder: (BuildContext context,
                        AsyncSnapshot<OneMedicine?> oneMedData) {
                      if (oneMedData.hasData) {
                        var data = oneMedData.data!.response!;
                        return Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12.0, vertical: 20),
                              child: SizedBox(
                                width: 400,
                                height: 500,
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    Text(
                                      "Name",
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline5,
                                    ),
                                    Text(data.name.toString()),
                                    Text(
                                      "Description",
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline5,
                                    ),
                                    Text(
                                      data.description.toString(),
                                      textAlign: TextAlign.justify,
                                    ),
                                    Text(
                                      "Price",
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline5,
                                    ),
                                    Text("Rs: ${data.price}"),
                                    // Text(data..toString()),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 400,
                              width: 400,
                              child: CachedNetworkImage(
                                imageUrl: data.image.toString(),
                                progressIndicatorBuilder:
                                    (context, url, progress) =>
                                        Center(
                                  child: CircularProgressIndicator(
                                    value: progress.progress,
                                  ),
                                ),
                                // placeholder: (context, url) =>
                                //     Image.asset(
                                //         "assets/images/mediciens.jpeg"),
                                errorWidget: (context, url, error) =>
                                    const Icon(Icons.error),
                              ),
                              // Image(image: CachedNetworkImageProvider(data.image.toString(),),)
                              // Image.network(
                              //   data.image.toString(),
                              //   fit: BoxFit.cover,
                              //   loadingBuilder: (BuildContext context, Widget child,
                              //       ImageChunkEvent? loadingProgress) {
                              //     if (loadingProgress == null) return child;
                              //     return Center(
                              //       child: CircularProgressIndicator(
                              //         value: loadingProgress.expectedTotalBytes != null
                              //             ? loadingProgress.cumulativeBytesLoaded /
                              //             loadingProgress.expectedTotalBytes!
                              //             : null,
                              //       ),
                              //     );
                              //   },
                              // ),
                            ),
                          ],
                        );
                      } else if (oneMedData.hasError) {
                        return const SizedBox(
                            height: 50,
                            width: 200,
                            child: Center(
                                child:
                                    Text("Unable to get the Users")));
                      }
                      return const CircularProgressIndicator();
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
