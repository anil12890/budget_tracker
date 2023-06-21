import 'package:flutter/material.dart';

class WalletDisplay extends StatefulWidget {
  const WalletDisplay({Key? key}) : super(key: key);

  @override
  State<WalletDisplay> createState() => _WalletDisplayState();
}

class _WalletDisplayState extends State<WalletDisplay> {
  @override
  Widget build(BuildContext context) {
    return Center(child:Text('Wallet'));
  }
}

