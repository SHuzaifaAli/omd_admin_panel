import 'package:flutter/material.dart';
import 'package:omd_admin_panel/DataProvider/order_data_provider.dart';
import 'package:omd_admin_panel/Model/Response/OrderListModels/list_all_orders.dart';
import 'package:omd_admin_panel/Screens/One%20Response/one_response_order.dart';
import 'package:omd_admin_panel/Services/Services.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class OrderListing extends StatefulWidget {
  String title;
  OrderListing(this.title,{Key? key}) : super(key: key);

  @override
  State<OrderListing> createState() => _OrderListingState();
}

class _OrderListingState extends State<OrderListing> {
  final OrderDataProvider _orderDataProvider = OrderDataProvider();


  @override
  void initState() {
    _orderDataProvider.getOrder();
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
              future: _orderDataProvider.getOrder(),
              builder: (BuildContext context,
                  AsyncSnapshot<ListAllOrders?> userResponse) {
                return Expanded(
                  flex: 2,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: userResponse.hasData
                        ? userResponse.data!.response!.length
                        : 0,
                    itemBuilder: (BuildContext context, int index) {
                      if (userResponse.hasData) {
                        return GestureDetector(
                          onTap: (){
                            var invoiceNumber = userResponse.data!.response![index].invoice!.toString();
                            var productID = userResponse.data!.response![index].idProduct!.toInt();
                            debugPrint(index.toString());
                            Services().changeScreenWithDelayAndPush(context, () => OneResponseOrder(invoiceNumber), 1);
                            // _userData.getOneUser(userResponse.data!.response![index].idUser!.toInt(),);
                          },
                          child: Card(
                            elevation: 20,
                            child: SizedBox(
                              width: double.maxFinite,
                              child: ListTile(
                                title: Text("Invoice # ${userResponse.data!.response![index].invoice}",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline3!
                                      .copyWith(color: Colors.black),
                                ),
                                subtitle: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Quantity of Item : ${userResponse.data!.response![index].quantity}",
                                    ),
                                    Text("Price of Item : ${userResponse.data!.response![index].price}",
                                    ),
                                  ],
                                )
                              ),
                            ),
                          ),
                        );
                      }
                      else if (userResponse.hasError) {
                        return const Center(
                          child: Card(
                            elevation: 12,
                            child: SizedBox(height:50,width:200,child: Center(child: Text("Unable to get the Orders"),),),
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
