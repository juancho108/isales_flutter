import 'package:agenda/components/customer_card.dart';
import 'package:agenda/data/db_provider.dart';
import 'package:agenda/data/occurrences_providers.dart';
import 'package:agenda/models/pos_customers.dart';
import 'package:agenda/screens/customer_details.dart';
import '../components/mycolors.dart' as c;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomerList extends StatefulWidget {
  const CustomerList({Key? key}) : super(key: key);

  @override
  _CustomerListState createState() => _CustomerListState();
}

class _CustomerListState extends State<CustomerList> {
  @override
  Widget build(BuildContext context) {
    final mWidth = MediaQuery.of(context).size.width;
    final double mHeight;
    if (MediaQuery.of(context).orientation == Orientation.portrait) {
      mHeight = MediaQuery.of(context).size.height;
    } else {
      mHeight = MediaQuery.of(context).size.width;
    }

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 2,
          backgroundColor: c.myTextColor,
          foregroundColor: c.myPrimaryColor,
          bottom: PreferredSize(
              child: Container(
                color: c.myPrimaryColor,
                height: mHeight * .005,
              ),
              preferredSize: Size.fromHeight(8.0)),
          title: const Text(
            'iSales Clientes',
            style: TextStyle(
              fontSize: 25,
            ),
          ),
        ),
        body: FutureBuilder(
          // future: Provider.of<OccurrencesProvider>(context, listen: false)
          //     .loadCustomer(),
          future: DbLite.db.getClients(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else {
              List<Customer> customers = snapshot.data;
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    color: Colors.grey.shade200,
                    height: mHeight * .055,
                  ),
                  Container(
                    height: mHeight * .08,
                    decoration: BoxDecoration(
                      color: c.myPrimaryColor,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          flex: 2,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 5, right: 5),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: const [
                                Text(
                                  'Nome',
                                  maxLines: 1,
                                  style: TextStyle(
                                    fontSize: 14,
                                    // overflow: TextOverflow.fade,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xeeffffff),
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
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: const [
                                Text(
                                  'email',
                                  maxLines: 1,
                                  style: TextStyle(
                                    fontSize: 14,
                                    // overflow: TextOverflow.fade,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xeeffffff),
                                  ),
                                ),
                                Text(
                                  'phone',
                                  maxLines: 2,
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Color(0xeeffffff),
                                    overflow: TextOverflow.fade,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: mHeight * .7 - 10,
                    child: ListView.builder(
                      itemCount: customers.length,
                      itemBuilder: (BuildContext context, int index) {
                        Customer cli = customers[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => CustomerDetails(
                                  customer: cli,
                                ),
                              ),
                            );
                          },
                          child: CustomerCard(
                            customer: cli,
                          ),
                        );
                      },
                    ),
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
