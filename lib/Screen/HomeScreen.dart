import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:money_banking/services/auth_metho.dart';
import 'package:money_banking/utils/utils.dart';

import '../model/Transcations.dart';
import '../model/getUserProfile.dart';
import '../utils/Sum_of_Expenses.dart';
import '../utils/constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Uint8List? image;
  void selectedImage() async {
    Uint8List im = await getPicture(ImageSource.gallery);
    setState(() {
      image = im;
    });
  }



  Future<List<UserData>> fetchData() async {
    List<UserData> data = [];
    AuthMethods _authMethods = AuthMethods();
    List<UserData> user = await _authMethods.getTranscation();
    for (UserData transcation in user) {
      data.add(transcation);
    }

    return data;
  }
  int sum=0;
void Expenses()
async{
  Ammount _am = Ammount();
 final data = await _am.getExpenses();
 sum = int.parse(data.toString());
}

  @override
  void initState() {
    // TODO: implement initState
    Expenses();

    super.initState();


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: SafeArea(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 25),
                  child: Stack(
                    children: [
                      image != null
                          ? CircleAvatar(
                              radius: 60, backgroundImage: MemoryImage(image!))
                          : const CircleAvatar(
                              radius: 60,
                              backgroundImage:
                                  AssetImage('assets/images/avatar.jpeg')),
                      Positioned(
                          top: 80,
                          bottom: 0,
                          right: 0,
                          child: IconButton(
                              iconSize: 30,
                              color: Colors.black,
                              onPressed: () {
                                selectedImage();
                              },
                              icon: Icon(Icons.camera_alt_sharp)))
                    ],
                  ),
                ),
                Text("Hi Anil !"),
                Container(
                    margin: EdgeInsets.all(5),
                    child: Image.asset('assets/icons/bell.png')),
              ]),
              Row(children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                        color: primaryDark,
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Income",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                        Row(
                          children: [
                            Text("RS 2450",
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.w500)),
                            SizedBox(width: 10),
                            Icon(Icons.arrow_upward)
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                    child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                            color: accent,
                            borderRadius: BorderRadius.circular(20)),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Expenses",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold)),
                              SizedBox(width: 10),
                              Row(
                                children: [
                                  Text(sum.toString(),
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500)),
                                  SizedBox(width: 10),
                                  Icon(Icons.arrow_downward),
                                ],
                              ),
                            ])))
              ]),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(10),
                child: const Text('Recent Transcactions',
                    style:
                        TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
              ),
              Padding(
                  padding: const EdgeInsets.all(10),
                  child: const Text('Today', style: TextStyle(fontSize: 15))),
              FutureBuilder(
                  future: fetchData(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      List<UserData> data = snapshot.data!;


                      return Expanded(
                        child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: snapshot.data!.length,
                            itemBuilder: (context, index) {
                              return Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  margin: const EdgeInsets.symmetric(
                                      vertical: 8, horizontal: 8),
                                  height: 80,
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                      color: fontLight,
                                      borderRadius: BorderRadius.circular(8)),
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            //Name of the product
                                            Text(data[index]
                                                .seletedExpensesItems
                                                .toString()),
                                            //Price of the prodduct
                                            Text(
                                                'RS.${data[index].ExpensesAmmount}',
                                                style: TextStyle(
                                                    color: Colors.green))
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                                //Brand of the product
                                                data[index]
                                                    .NameofProduct
                                                    .toString()),
                                            //Date of the Transcation
                                            Text('Aug 26')
                                          ],
                                        )
                                      ]));
                            }),
                      );
                    } else {
                      return const Center(
                          child: CircularProgressIndicator(color: Colors.cyan));
                    }
                  }),
            ]),
          )),
    );
  }
}
