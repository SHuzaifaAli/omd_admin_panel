import 'package:flutter/material.dart';
import 'package:omd_admin_panel/DataProvider/user_data_provider.dart';
import 'package:omd_admin_panel/Model/Response/UserModel/OneUserData.dart';

class OneResponseUser extends StatefulWidget {
  const OneResponseUser(this.userId,this.userName, {Key? key}) : super(key: key);
  final int userId;
  final String userName;

  @override
  State<OneResponseUser> createState() => _OneResponseUserState();

}

class _OneResponseUserState extends State<OneResponseUser> {


  final UserDataProvider _userData = UserDataProvider();

  @override
  void initState() {
    widget.userId;
    _userData.getOneUser(widget.userId);
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

            Expanded(
              flex: 2,
              child: Center(
                child: Card(
                  elevation: 20,
                  child: SizedBox(
                    width: 120,
                    height: 100,
                    child: FutureBuilder(
                      future: _userData.getOneUser(widget.userId),
                      builder: (BuildContext context, AsyncSnapshot<OneUserData?> oneUserData) {
                        if(oneUserData.hasData){
                          var data = oneUserData.data!.response!;
                          return Column(
                            children: <Widget>[
                              Text(data.name.toString()),
                              Text(data.email.toString()),
                              Text(data.phone.toString()),
                              Text(data.address.toString()),
                            ],
                          );
                        }
                        else if(oneUserData.hasError){
                          return const SizedBox(height:50,width:200,child: Center(child: Text("Unable to get the Users")));

                        }
                        return const CircularProgressIndicator();
                      },

                    ),
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
