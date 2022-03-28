import 'package:agenda/models/pos_customers.dart';
import 'package:flutter/material.dart';

class CustomerCard extends StatelessWidget {
  const CustomerCard({Key? key, required this.customer}) : super(key: key);
  final Customer customer;

  @override
  Widget build(BuildContext context) {
    final mWidth = MediaQuery.of(context).size.width;
    final double mHeight;
    if (MediaQuery.of(context).orientation == Orientation.portrait) {
      mHeight = MediaQuery.of(context).size.height * .95;
    } else {
      mHeight = MediaQuery.of(context).size.width;
    }
    return Container(
      height: mHeight * .09,
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
              bottom: BorderSide(width: 1, color: Colors.grey.shade200))),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.only(left: 5, right: 5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    customer.name != null ? customer.name!.toUpperCase() : '',
                    maxLines: 1,
                    style: TextStyle(
                      fontSize: mHeight * .022,
                      // overflow: TextOverflow.fade,
                      fontWeight: FontWeight.bold,

                      color: Color(0xed616161),
                    ),
                  ),
                  Text(
                    customer.address != null ? customer.address! : '',
                    maxLines: 2,
                    style: TextStyle(
                      fontSize: mHeight * .02,
                      color: Colors.grey,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 5, right: 5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    customer.email != null ? customer.email!.toLowerCase() : '',
                    maxLines: 1,
                    style: const TextStyle(
                      fontSize: 12,
                      // overflow: TextOverflow.fade,
                      fontWeight: FontWeight.bold,
                      color: Color(0xed616161),
                    ),
                  ),
                  Text(
                    customer.phone != null ? customer.phone! : '',
                    maxLines: 2,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
