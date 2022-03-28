import 'package:agenda/models/activity.dart';
import 'package:agenda/screens/activity_details.dart';
import 'package:flutter/material.dart';

class ActivityCard extends StatelessWidget {
  ActivityCard({
    Key? key,
    required this.activity,
  }) : super(key: key);
  final Activity activity;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => ActivityPage(activity: activity)));
      },
      child: CardData(activity: activity),
    );
  }
}

class CardData extends StatelessWidget {
  const CardData({
    Key? key,
    required this.activity,
  }) : super(key: key);

  final Activity activity;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
        color: Color(0xfff8BA90),
        elevation: 4,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              title: Text(
                activity.name!.length > 20
                    ? activity.name!.substring(0, 20)
                    : activity.name!,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w500,
                ),
                overflow: TextOverflow.fade,
              ),
              subtitle: Text(
                activity.type!,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                ),
              ),
              trailing: Column(
                children: [
                  Text(
                    activity.hora,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    activity.dataAgendada
                        .substring(0, 10)
                        .split('-')
                        .reversed
                        .toList()
                        .join('/'),
                    style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
