import 'package:agenda/models/pos_customers.dart';
import 'package:agenda/models/pos_products.dart';
import 'package:flutter/widgets.dart';

import '../data/db_util.dart';
import '../models/activity.dart';

class OccurrencesProvider with ChangeNotifier {
  List<Activity> items = [];
  Future<List<Activity>> loadItems() async {
    items.clear();
    final listactivities = await DbLite.getData();
    listactivities.forEach((element) {
      Activity activity = Activity(
        id: element['id'],
        classId: element['classID'],
        dataAgendada: element['date'],
        hora: element['hour'],
        name: element['name'] ?? '',
        type: element['type'] ?? '',
      );
      activity.name = activity.name!.toUpperCase();
      items.add(activity);
    });
    items.sort(
      (a, b) => a.dataAgendada.compareTo(b.dataAgendada),
    );
    items = items.reversed.toList();
    notifyListeners();

    return items;
  }
/*
  Future<List<Customer>> loadCustomer() async {
    List<Customer> customers = [];
    final listcustomers = await DbLite.getClients();
    try {
      listcustomers.forEach((element) {
        Customer customer = Customer.minimum(
          nif: element['NIF'].toString(),
          name: element['NAME'],
          address: element['ADDRESS'],
          city: element['CITY'],
          phone: element['PHONE'] ?? 'sem telefone',
          email: element['EMAIL'] ?? 'nome@email.com',
          is_visit: element['IS_VISIT'],
          next_visit: element['NEXT_VISIT'] ?? -1,
          pos_customers_id: element['POS_CUSTOMERS_ID'],
        );
        customers.add(customer);
      });
    } catch (e) {
      print(e);
    }

    // print(listcustomers);
    return customers;
  }

  Future<List<Product>> loadProducts() async {
    List<Product> products = [];
    final listcustomers = await DbLite.getProducts();
    try {
      listcustomers.forEach((element) {
        Product product = Product(
          
          name: element['NAME'],
          pos_products_id: element['POS_PRODUCTS_ID'],
          unit_per_box: element['UNIT_PER_BOX'],
        );
        products.add(product);
      });
    } catch (e) {
      print(e);
    }

    // print(listcustomers);
    return products;
  }
  */
}
