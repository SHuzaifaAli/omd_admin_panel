import 'package:flutter/material.dart';
import 'package:omd_admin_panel/DataProvider/medicine_data_provider.dart';
import 'package:omd_admin_panel/Model/Response/MedicineListModel/list_all_medicine.dart';
import 'package:omd_admin_panel/Screens/One%20Response/one_response_medicien.dart';
import 'package:omd_admin_panel/Services/Services.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class MedicineListing extends StatefulWidget {
  const MedicineListing(this.title,{Key? key}) : super(key: key);
  final String title;
  @override
  State<MedicineListing> createState() => _MedicineListingState();
}

class _MedicineListingState extends State<MedicineListing> {

  final MedicineDataProvider medData = MedicineDataProvider();

  @override
  void initState() {
    medData.getMedicine();
    // TODO: implement initState
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
                Text(widget.title,
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
              animationDuration: 1000,
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
            FutureBuilder(
              future:medData.getMedicine(),
              builder: (BuildContext context,
                  AsyncSnapshot<ListAllMedicine?> medResponse) {
                return Expanded(
                  flex: 2,
                  child: ListView.builder(
                    shrinkWrap: false,
                    itemCount: medResponse.hasData
                        ? medResponse.data!.response!.length
                        : 0,
                    itemBuilder: (BuildContext context, int index) {
                      if (medResponse.hasData) {
                        return GestureDetector(
                          onTap: (){
                            var userId = medResponse.data!.response![index].idProduct!.toInt();
                            var userName = medResponse.data!.response![index].name!.toString();
                            debugPrint(index.toString());
                            Services().changeScreenWithDelayAndPush(context, () => OneResponseMedic(userId,userName), 1);
                            // _userData.getOneUser(userResponse.data!.response![index].idUser!.toInt(),);
                          },
                          child: Card(
                            elevation: 20,
                            child: SizedBox(
                              width: double.maxFinite,
                              child: ListTile(
                                leading: Text("${index+1}" , style: Theme.of(context)
                                    .textTheme
                                    .headline3!
                                    .copyWith(color: Colors.black),),
                                title: Text(
                                  medResponse.data!.response![index].name
                                      .toString(),
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline3!
                                      .copyWith(color: Colors.black),
                                ),
                              ),
                            ),
                          ),
                        );
                      }
                      else if (medResponse.hasError) {
                        return const Center(
                          child: Card(
                            elevation: 12,
                            child: SizedBox(height:50,width:200,child: Center(child: Text("Unable to get the Users"))),
                          ),
                        );
                      }
                      return const CircularProgressIndicator();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
