import 'package:agenda/data/db_provider.dart';
import 'package:agenda/models/pos_customers.dart';
import 'package:agenda/models/pos_customers_address.dart';
import 'package:agenda/models/pos_products.dart';
import 'package:agenda/webservices/webservicemanager.dart';

class LoadDB {
  static Future<void> downloadDb() async {
    print(
        '####################### SINCRONIZANDO ##############################');
    var res;

    print(
        '####################### SINCRONIZANDO CLIENTES...###################');
    res = await DbLite.db.deleteAllFromTable('POS_CUSTOMERS');
    if (res >= 0) {
      List<dynamic> customers =
          await WebServiceManager().getDataWithIndex('pos_customers');
      for (var element in customers) {
        DbLite.db.addElement(Customer.fromMap(element), 'POS_CUSTOMERS');
      }
    }

    // print(
    //     '####################### SINCRONIZANDO CUSTOMERS_ADDRESS...###################');
    // res = await DbLite.db.deleteAllFromTable('POS_CUSTOMERS_ADDRESS');
    // if (res >= 0) {
    //   List<CustomersAddress> customer_address =
    //       await WebServiceManager().getCustomersAddress();
    //   for (var element in customer_address) {
    //     DbLite.db.addElement(element, 'POS_CUSTOMERS_ADDRESS');
    //   }
    // }

    print(
        '####################### SINCRONIZANDO PRODUTOS...###################');
    res = await DbLite.db.deleteAllFromTable('POS_PRODUCTS');
    if (res >= 0) {
      List<dynamic> products =
          await WebServiceManager().getDataWithIndex('pos_products');
      for (var element in products) {
        DbLite.db.addElement(Product.fromMap(element), 'POS_PRODUCTS');
      }
    }

    //List<Tarefa> tarefas = await DatabaseManager.db.getAllTarefas();
    /*
    List<Tarefa> tarefas = await WebServiceManager().getTarefas();
    DatabaseManager.db.deleteAllTarefas();
    tarefas.forEach((element) {
      DatabaseManager.db.addTarefa(element);
    });

    List<StatusWorkflow> statusworkflow =
        await WebServiceManager().getStatusWorkflow();
    DatabaseManager.db.deleteAllStatusWorkflow();
    statusworkflow.forEach((element) {
      DatabaseManager.db.addStatusWorkflow(element);
    });

    List<Status> status = await WebServiceManager().getStatus();
    DatabaseManager.db.deleteAllStatus();
    status.forEach((element) {
      DatabaseManager.db.addStatus(element);
    });

    List<TipoTempo> tipotempos = await WebServiceManager().getTipoTempos();
    DatabaseManager.db.deleteAllTipoTempos();
    tipotempos.forEach((element) {
      DatabaseManager.db.addTipoTempo(element);
    });

    List<TipoOcorrencia> tipoocorrencias =
        await WebServiceManager().getTipoOcorrencias();
    DatabaseManager.db.deleteAllTipoOcorrencias();
    tipoocorrencias.forEach((element) {
      DatabaseManager.db.addTipoOcorrencia(element);
    });

    List<TipoTransacao> tipotransacoes =
        await WebServiceManager().getTipoTransacoes();
    DatabaseManager.db.deleteAllTipoTransacoes();
    tipotransacoes.forEach((element) {
      DatabaseManager.db.addTipoTransacao(element);
    });

    */

    print(
        '####################### FIN DE LA SINCRONIZACIÓN ##############################');
  }
}

/*
  // showLoadingDialog(context, _keyLoader);


  //     Navigator.of(_keyLoader.currentContext, rootNavigator: true)
  //       .pop(); //close the dialoge*/
