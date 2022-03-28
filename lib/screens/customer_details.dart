import 'package:agenda/models/pos_customers.dart';
import 'package:flutter/material.dart';
import '../components/mycolors.dart' as c;

class CustomerDetails extends StatelessWidget {
  const CustomerDetails({Key? key, required this.customer}) : super(key: key);
  final Customer customer;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          foregroundColor: c.myPrimaryColor,
          bottom: PreferredSize(
              child: Container(
                color: c.myPrimaryColor,
                height: size.height * .005,
              ),
              preferredSize: Size.fromHeight(8.0)),
          title: const Text(
            'iSales',
            style: TextStyle(
              fontSize: 25,
            ),
          ),
        ),
      ),
    );
  }
}
