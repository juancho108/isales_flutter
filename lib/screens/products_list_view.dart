/*
import 'package:agenda/components/customer_card.dart';
import 'package:agenda/data/occurrences_providers.dart';
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
    final size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            foregroundColor: Colors.orange.shade900,
            bottom: PreferredSize(
                child: Container(
                  color: Colors.orange.shade900,
                  height: size.height * .005,
                ),
                preferredSize: Size.fromHeight(8.0)),
            title: Text('iSales Clientes', style: TextStyle(fontSize: 25))),
        body: FutureBuilder(
          future: Provider.of<OccurrencesProvider>(context, listen: false)
              .loadCustomer(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  color: Colors.grey.shade200,
                  height: size.height * .055,
                ),
                Container(
                  height: size.height * .08,
                  decoration: BoxDecoration(
                    color: Colors.orange.shade900,
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
                  height: size.height * .8 - 44,
                  child: ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (BuildContext context, int index) {
                      return CustomerCard(
                          customer: snapshot.data[index], );
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

*/