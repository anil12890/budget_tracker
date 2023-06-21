import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:money_banking/model/Transcations.dart';


DateTime date = DateTime.now();
TextEditingController _NameofProductcontroller = TextEditingController();
TextEditingController _descriptioncontroller = TextEditingController();
TextEditingController _Expenseammountcontroller = TextEditingController();
TextEditingController _Incomeammountcontroller = TextEditingController();

List<String> item = [
  'food',
  'Shopping',
];

class AddTranscations extends StatefulWidget {
  const AddTranscations({Key? key}) : super(key: key);

  @override
  State<AddTranscations> createState() => _AddTranscationsState();
}

class _AddTranscationsState extends State<AddTranscations> {

  void AddData()
  async{
    final _auth = FirebaseAuth.instance;
    final _firebase = FirebaseFirestore.instance;
    UserData userData = UserData(
      seletedExpensesItems: selectedItems.toString(),
      // date:date,
      NameofProduct:_NameofProductcontroller.text.toString(),
      Description: _descriptioncontroller.text.toString(),
      ExpensesAmmount: _Expenseammountcontroller.text.toString(),
      IncomeAmmount: _Incomeammountcontroller.text.toString(),
    );
     final data = await _firebase.collection('users').doc(_auth.currentUser!.uid).collection('Transcations').add(userData.toJson());



  }
  @override




  @override
  void dispose() {
    _NameofProductcontroller.dispose();
    _descriptioncontroller.dispose();
    _Expenseammountcontroller.dispose();
    _Incomeammountcontroller.dispose();
    super.dispose();
  }

  String ?selectedItems;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade100,
        body: SafeArea(
          child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Stack(alignment: Alignment.center, children: [
                Column(children: [

                  Container(
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 45),
                        child: Text('Adding Transcations ',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.bold)),
                      ),
                      height: 240,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20)),
                          color: Color(0xff368983))),
                ]),
                Positioned(
                    top: 150,
                    child: Container(
                        height: 550,
                        width: 340,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20)),
                        child: Column(children: [
                          const SizedBox(height: 20),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 8),
                            width: 300,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  width: 2,
                                  color: Color(0xffC5C5C5),
                                )),
                            child: DropdownButtonFormField(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                icon: Icon(
                                  Icons.arrow_drop_down_circle,
                                  color: Colors.deepPurple,
                                ),
                                decoration: InputDecoration(
                                    focusColor: Color(0xffC5C5C5),
                                    border: UnderlineInputBorder(),
                                    labelText: 'Expenses Items'),
                                dropdownColor: Colors.deepPurple.shade50,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                                items: item
                                    .map((e) => DropdownMenuItem(
                                        value: e,
                                        child: Container(
                                            alignment: Alignment.center,
                                            child: Text(e.toString()))))
                                    .toList(),
                                onChanged: (value) {
                                  setState(() {
                                    selectedItems = value as String;
                                  });
                                }),
                          ),
                          const SizedBox(height: 10),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 16),
                            width: 300,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  width: 2,
                                  color: Color(0xffC5C5C5),
                                )),
                            child: TextField(
                              keyboardType: TextInputType.text,
                              controller: _NameofProductcontroller,

                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  hintText: 'Name of items'),
                            ),
                          ),
                          SizedBox(height: 10),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 16),
                            width: 300,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  width: 2,
                                  color: Color(0xffC5C5C5),
                                )),
                            child: TextField(
                              keyboardType: TextInputType.text,
                              controller: _descriptioncontroller,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  hintText: 'Descriptions'),
                            ),
                          ),
                          SizedBox(height: 10),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 16),
                            width: 300,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  width: 2,
                                  color: Color(0xffC5C5C5),
                                )),
                            child: TextField(
                              keyboardType: TextInputType.number,
                              controller: _Incomeammountcontroller,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  hintText: 'Income Ammount'),
                            ),
                          ),
                          SizedBox(height: 10),
                          Container(
                            width: 300,
                            padding: EdgeInsets.symmetric(horizontal: 16),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  width: 2,
                                  color: Color(0xffC5C5C5),
                                )),
                            child: TextField(
                              keyboardType: TextInputType.number,
                              controller: _Expenseammountcontroller,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  hintText: 'Expenses Ammount'),
                            ),
                          ),
                          SizedBox(height: 10),
                          Container(
                            width: 300,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    width: 2, color: Color(0xffC5C5C5)),
                                borderRadius: BorderRadius.circular(10)),
                            child: TextButton(
                                onPressed: () async {
                                  DateTime? newDate = await showDatePicker(
                                      context: context,
                                      initialDate: date,
                                      firstDate: DateTime(2023),
                                      lastDate: DateTime(2100));
                                  if (newDate == null) {
                                    return;
                                  }
                                  setState(() {
                                    date = newDate;
                                  });
                                },
                                child: Text(
                                    'Date: ${date.year} / ${date.month} / ${date.day}')),
                          ),
                          SizedBox(height: 10),
                          ElevatedButton(
                              onPressed: () {
                                AddData();
                                print(_NameofProductcontroller.text);
                                _Incomeammountcontroller.clear();
                                _Expenseammountcontroller.clear();
                                _descriptioncontroller.clear();
                                _NameofProductcontroller.clear();

                              },
                              child: Text('Save',
                                  style: TextStyle(color: Colors.deepPurple))),
                        ])))
              ])),
        ));
  }
}

