import 'package:agenda/components/activity_card.dart';
import 'package:agenda/data/occurrences_providers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Minha Agenda - Felipe Pinheiro'),
        backgroundColor: Color(0xff9CBE00),
        toolbarHeight: 80,
      ),
      body: Container(
        // color: Colors.amber.shade50.withOpacity(0.4),
        child: FutureBuilder(
          future: Provider.of<OccurrencesProvider>(context, listen: false)
              .loadItems(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  // return ActivityCard(
                  //   activity: snapshot.data[index],
                  // );
                  return ActivityCard(
                    activity: snapshot.data[index],
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
