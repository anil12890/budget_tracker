import 'package:cloud_firestore/cloud_firestore.dart';

class UserData {
  final String? NameofProduct;
  final String? Description;
  final String? ExpensesAmmount;
  final String? IncomeAmmount;
  final String? seletedExpensesItems;

  // final DateTime? date;
  UserData(
      {required this.NameofProduct,
      required this.Description,
      required this.ExpensesAmmount,
      this.IncomeAmmount,
      // required this.date,
      required this.seletedExpensesItems});
  Map<String, dynamic> toJson() => {
        'NameofProduct': NameofProduct,
        'Description': Description,
        'ExpensesAmmount': ExpensesAmmount,
        'IncomeAmmount': IncomeAmmount,
        // 'date': date,
        'selectedExpensesItems': seletedExpensesItems,
      };
  static UserData fromJson(Map<String,dynamic> snap)  {

    return UserData(
        NameofProduct: snap['NameofProduct'],
        Description: snap['Description'],
        ExpensesAmmount: snap['ExpensesAmmount'],
        IncomeAmmount: snap['IncomeAmmount'],
        // date: snap['date'],
        seletedExpensesItems: snap['selectedExpensesItems']);



  }
}
