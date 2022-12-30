import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:omd_admin_panel/DataProvider/order_data_provider.dart';
import 'package:omd_admin_panel/Model/Response/OrderListModels/one_order.dart' as ORDER_DETAIL;

class OneResponseOrder extends StatefulWidget {
  const OneResponseOrder(this.invoiceId, {Key? key}) : super(key: key);
  final String invoiceId;

  @override
  State<OneResponseOrder> createState() => OneResponseOrderState();

}

class OneResponseOrderState extends State<OneResponseOrder> {


  final OrderDataProvider _orderDataProvider = OrderDataProvider();

  @override
  void initState() {
    widget.invoiceId;
    _orderDataProvider.getOneOrder(widget.invoiceId);
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
                Text("Order # ${widget.invoiceId}",
                    style: Theme.of(context)
                        .textTheme
                        .headline3!
                        .copyWith(
                        color: const Color(0xFFC8DEE7),
                        fontFamily: "Poppins")),
              ],
            ),

            Expanded(
              flex: 2,
              child: Center(
                child:  FutureBuilder(
                  future: _orderDataProvider.getOneOrder(widget.invoiceId),
                  builder: (BuildContext context, AsyncSnapshot<List<ORDER_DETAIL.Response>?> oneUserData) {
                    if(oneUserData.hasData){
                      var data = oneUserData.data!;
                      return ListView.builder(itemCount: oneUserData.data!.length,
                        itemBuilder: (BuildContext context,
                            int index) {
                          return Card(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 12),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      // Text("Invoice : ${data[index].invoice}"),
                                      Text("product Id : ${data[index].idProduct}"),
                                      Text("order Id : ${data[index].idOrders}"),
                                      Text("quantity : ${data[index].quantity}"),
                                      Text("Name : ${data[index].name}"),
                                      Text("Rs : ${data[index].price}"),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 100,
                                  height: 50,
                                  child: CachedNetworkImage(
                                    imageUrl: data[index].image.toString(),
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
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    }
                    else if(oneUserData.hasError){
                      return const SizedBox(height:50,width:200,child: Center(child: Text("Unable to get the Users")));

                    }
                    return const Center(child: CircularProgressIndicator());
                  },


                ),
                  ),
                ),
          ],
        ),
      ),
    );
  }
}
