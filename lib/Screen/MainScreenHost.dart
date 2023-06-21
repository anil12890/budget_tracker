import 'package:flutter/material.dart';
import 'package:money_banking/Screen/AddTranscations.dart';
import 'package:money_banking/Screen/CharDisplay.dart';
import 'package:money_banking/Screen/HomeScreen.dart';
import 'package:money_banking/Screen/Profile.dart';
import 'package:money_banking/Screen/Wallet.dart';
import 'package:provider/provider.dart';



import '../utils/constants.dart';

class MainScreenHost extends StatefulWidget {
  const MainScreenHost({Key? key}) : super(key: key);

  @override
  State<MainScreenHost> createState() => _MainScreenHostState();
}

class _MainScreenHostState extends State<MainScreenHost> {
  var currentIndex=0;

Widget buildContent(index)
{
  switch(index)
      {
    case 0:
      return const HomeScreen();
    case 1:
      return const ChartDisplay();
    case 2:
      return const WalletDisplay();
    case 3:
      return const HomeProfile();
    default:
      return const  HomeScreen();

  }

}



  @override
void initState()
  {
    // addData();
  }
 //  addData()
 // async {
 //  UserProvider _userProvider = Provider.of<UserProvider>(context,listen:false);
 //  await _userProvider.refreshUser();
 // }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(

        onPressed:()
            {
              Navigator.of(context).push(MaterialPageRoute(builder:(context)=>AddTranscations()));
            },
        child:const Icon(Icons.add,),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      bottomNavigationBar:BottomNavigationBar(

        currentIndex:currentIndex,
        selectedItemColor: secondaryDark,
        unselectedItemColor:fontLight,
        onTap:(index)
          {
            setState((){
              currentIndex = index;
            });

          },
        items:[
          BottomNavigationBarItem(icon: Image.asset('assets/icons/home-1.png'),label:"Home"),
          BottomNavigationBarItem(icon: Image.asset('assets/icons/chart-vertical.png'),label:'Chart Vertical'),
          BottomNavigationBarItem(icon: Image.asset('assets/icons/wallet.png'),label:'Wallet'),
          BottomNavigationBarItem(icon: Image.asset('assets/icons/user-1.png'),label:"Profile"),
        ]
      ),
          body:buildContent(currentIndex)
    );
  }
}

