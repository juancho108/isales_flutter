import 'dart:convert';
import 'dart:io';

import 'package:agenda/data/databasevalues.dart';
import 'package:agenda/models/pos_customers.dart';
import 'package:agenda/models/pos_customers_address.dart';
import 'package:agenda/models/pos_products.dart';
import 'package:agenda/share_prefs/user_preferences.dart';
import 'package:agenda/utils/utils.dart';
import 'package:device_info/device_info.dart';
import 'package:xml2json/xml2json.dart';

import 'package:http/http.dart' as http;
import 'package:agenda/utils/values.dart';
import 'package:package_info/package_info.dart';

class WebServiceManager {
  //String accessKey = "037037037037037";
  //String accessKeyStr = "myteambettertech";
  //String licence = "3059";

  UserPreferences prefs = UserPreferences();

  dynamic getOperatorData(String username, String password) async {
    String domain = prefs.domain;
    String accessKey = prefs.accessKey;
    String licence = prefs.licence;

    String url = domain +
        WEB_SERVICE_FLUTTER +
        "/" +
        BACKOFFICE_API_GET_OPERATOR_DATA +
        "?strKey=" +
        betterEncode(MY_TEAM_STR_KEY.toString()) +
        "&strAccess=" +
        betterEncode(accessKey.toString()) +
        "&strLicence=" +
        betterEncode(licence.toString()) +
        "&operador=" +
        username +
        "&password=" +
        password;

    // url = url.replaceFirst(RegExp('PTOTM/'), 'PTOTM');

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        String body = response.body;

        final Xml2Json xml2Json = Xml2Json();
        xml2Json.parse(body);
        dynamic jsonResponse = jsonDecode(xml2Json.toParker());

        return jsonResponse;
      } else {
        // If the server did not return a 200 OK response,
        // then throw an exception.
        throw Exception(response.statusCode.toString() +
            ' Failed to get operator data. url:' +
            url);
      }
    } on SocketException catch (_) {
      //throw Exception('Failed to get operator data. url:' + url);
      return null;
    } on Exception catch (e) {
      throw Exception(
          'Failed to get operator data. url:' + url + " exc: " + e.toString());
    }
  }

  dynamic validateLicence(String licence, String accessKey) async {
    String uniqueID = '';

    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    String appVersion = packageInfo.version;
    String local = Platform.localeName;

    if (Platform.isAndroid) {
      var androidInfo = await DeviceInfoPlugin().androidInfo;
      uniqueID = androidInfo.androidId;
    } else if (Platform.isIOS) {
      var iosInfo = await DeviceInfoPlugin().iosInfo;
      uniqueID = iosInfo.identifierForVendor;
    }

    String url = CONF_DOMAIN +
        CONF_WEBSERVICE +
        "/" +
        CONF_METHOD_LICENSE_RETURN_CONFIG +
        "?appName=" +
        CONF_APP_TYPE.toString() +
        "&idAndroid=" +
        uniqueID +
        "&customerLicense=" +
        licence +
        "&versionApp=" +
        appVersion +
        "&strKey=" +
        CONF_STR_KEY +
        "&accessKey=" +
        accessKey;

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        String body = response.body;

        final Xml2Json xml2Json = Xml2Json();
        xml2Json.parse(body);
        dynamic jsonResponse = jsonDecode(xml2Json.toParker());

        return jsonResponse;
      } else {
        // If the server did not return a 200 OK response,
        // then throw an exception.
        throw Exception(response.statusCode.toString() +
            ' Failed to get operator data. url:' +
            url);
      }
    } on SocketException catch (_) {
      //throw Exception('Failed to get operator data. url:' + url);
      return null;
    } on Exception catch (e) {
      throw Exception(
          'Failed to validateLicence. url:' + url + " exc: " + e.toString());
    }
  }

  dynamic validateMobileKey(String mobileKey) async {
    String domain = prefs.domain;
    String accessKey = prefs.accessKey;

    domain = domain.replaceFirst(RegExp('PTOTM/'), 'PTOTM');

    String url = domain +
        BACKOFFICE_API_WEBSERVICE +
        "/" +
        BACKOFFICE_API_CHECK_MOBILE_DATA +
        "?Key=" +
        MY_TEAM_STR_KEY.toString() +
        "&strAccess=" +
        accessKey +
        "&mobileKey=" +
        mobileKey;

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        String body = response.body;

        final Xml2Json xml2Json = Xml2Json();
        xml2Json.parse(body);
        dynamic jsonResponse = jsonDecode(xml2Json.toParker());

        return jsonResponse;
      } else {
        // If the server did not return a 200 OK response,
        // then throw an exception.
        throw Exception(response.statusCode.toString() +
            ' Failed to validateMobileKey. url:' +
            url);
      }
    } on SocketException catch (_) {
      //throw Exception('Failed to get operator data. url:' + url);
      return null;
    } on Exception catch (e) {
      throw Exception(
          'Failed to get operator data. url:' + url + " exc: " + e.toString());
    }
  }

  dynamic requestLicence(
      String licence,
      String acessKey,
      String operatorName,
      String operatorCode,
      String operatorPassword,
      String operatorMail,
      String operatorPhone) async {
    String osVersion = '';
    String name = '';
    String model = '';
    String uniqueID = '';

    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    String appVersion = packageInfo.version;
    String local = Platform.localeName;

    if (Platform.isAndroid) {
      var androidInfo = await DeviceInfoPlugin().androidInfo;
      osVersion = androidInfo.version.release;
      // var sdkInt = androidInfo.version.sdkInt;
      name = androidInfo.manufacturer;
      model = androidInfo.model;
      uniqueID = androidInfo.androidId;
      // print('Android $release (SDK $sdkInt), $manufacturer $model');
      // Android 9 (SDK 28), Xiaomi Redmi Note 7
    } else if (Platform.isIOS) {
      var iosInfo = await DeviceInfoPlugin().iosInfo;
      // var osType = iosInfo.systemName;
      osVersion = iosInfo.systemVersion;
      name = iosInfo.name;
      model = iosInfo.model;
      uniqueID = iosInfo.identifierForVendor;
      // print('$systemName $version, $name $model');
      // iOS 13.1, iPhone 11 Pro Max iPhone
    }

    String url = CONF_DOMAIN +
        CONF_WEBSERVICE +
        "/" +
        CONF_METHOD_REQUEST_LICENSE +
        "?comunicationKey=" +
        betterEncode(CONF_STR_KEY) +
        "&appType=" +
        CONF_APP_TYPE +
        "&appVersion=" +
        appVersion +
        "&osType=" +
        Platform.operatingSystem +
        "&osVersion=" +
        osVersion +
        "&deviceType=" +
        "${name}_$model" +
        "&code=" +
        operatorCode + //--923'
        "&store=" +
        "NA" +
        "&password=" +
        betterEncode(operatorPassword) + //-- 923' +
        "&deviceId=" +
        uniqueID + //(investigar MAC e UUID)
        "&license=" +
        betterEncode(licence) + //-- D010'
        "&mobileKey=" +
        betterEncode(acessKey) + //-- flutterotm-dev' +
        "&name=" +
        operatorName +
        "&email=" +
        operatorMail +
        "&phone=" +
        operatorPhone +
        "&userLanguage=" +
        local;

    final response = await http.get(Uri.parse(url));

    print(response);

    // try {
    //   final response = await http.get(Uri.parse(url));

    //   if (response.statusCode == 200) {
    //     String body = response.body;

    //     final Xml2Json xml2Json = Xml2Json();
    //     xml2Json.parse(body);
    //     dynamic jsonResponse = jsonDecode(xml2Json.toParker());

    //     return jsonResponse;
    //   } else {
    //     // If the server did not return a 200 OK response,
    //     // then throw an exception.
    //     throw Exception(response.statusCode.toString() +
    //         ' Failed to validateMobileKey. url:' +
    //         url);
    //   }
    // } on SocketException catch (_) {
    //   //throw Exception('Failed to get operator data. url:' + url);
    //   return null;
    // } on Exception catch (e) {
    //   throw Exception(
    //       'Failed to get operator data. url:' + url + " exc: " + e.toString());
    // }
  }

  Future<List<dynamic>> getData(String table) async {
    String domain = prefs.domain;
    String licence = prefs.licence;
    int operatorId = prefs.id_operador;
    String accessKey = prefs.accessKey;

    var data = DatabaseValues.information[table];

    String url = domain +
        WEB_SERVICE_FLUTTER +
        "/" +
        'Get_Data_WithFileName' +
        "?strKey=" +
        betterEncode(MY_TEAM_STR_KEY.toString()) +
        "&strAccess=" +
        betterEncode(accessKey.toString()) +
        "&strLicence=" +
        betterEncode(licence.toString()) +
        "&strOperatorId=" +
        operatorId.toString() +
        "&filename=" +
        data!['loadFile']! +
        "&folder=" +
        "Flutter/fa-v1";

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        String body = response.body;

        final Xml2Json xml2Json = Xml2Json();
        xml2Json.parse(body);
        dynamic jsonResponse = jsonDecode(xml2Json.toParker());

        List<dynamic> lista = [];

        var error = jsonResponse['PDAServiceReturnDataSet']['Error'] != null
            ? jsonResponse['PDAServiceReturnDataSet']['Error']
            : '0';
        var message = jsonResponse['PDAServiceReturnDataSet']['Message'] != null
            ? jsonResponse['PDAServiceReturnDataSet']['Message']
            : 'Ok';

        if (int.parse(error) >= 0) {
          List<dynamic> jsonList = jsonResponse['PDAServiceReturnDataSet']
              ['Data']['diffgr:diffgram']['NewDataSet']['DATASET_RETURN'];

          lista = jsonList;
        } else {
          throw Exception(response.statusCode.toString() +
              ' Failed to load Customers url:' +
              url +
              " - message: " +
              message);
        }

        return lista;
      } else {
        // If the server did not return a 200 OK response,
        // then throw an exception.
        throw Exception(response.statusCode.toString() +
            ' Failed to load Customers url:' +
            url);
      }
    } on SocketException catch (_) {
      throw Exception('Failed to load Customers url:' + url);
    } on Exception catch (e) {
      throw Exception(
          'Failed to load Customers url:' + url + " exc: " + e.toString());
    }
  }

  Future<List<dynamic>> getDataWithIndex(String table,
      {int beginIndex = 1, int endIndex = 1000}) async {
    String domain = prefs.domain;
    String licence = prefs.licence;
    int operatorId = prefs.id_operador;
    String accessKey = prefs.accessKey;

    var data = DatabaseValues.information[table];

    String url = domain +
        WEB_SERVICE_FLUTTER +
        "/" +
        'Get_Data_WithFileName' +
        "?strKey=" +
        betterEncode(MY_TEAM_STR_KEY.toString()) +
        "&strAccess=" +
        betterEncode(accessKey.toString()) +
        "&strLicence=" +
        betterEncode(licence.toString()) +
        "&strOperatorId=" +
        operatorId.toString() +
        "&filename=" +
        data!['loadFile']! +
        "&folder=" +
        "Flutter/fa-v1" +
        "&beginIndex=" +
        beginIndex.toString() +
        "&endIndex=" +
        endIndex.toString();

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        String body = response.body;

        final Xml2Json xml2Json = Xml2Json();
        xml2Json.parse(body);
        dynamic jsonResponse = jsonDecode(xml2Json.toParker());

        List<dynamic> lista = [];

        var error = jsonResponse['PDAServiceReturnDataSet']['Error'] != null
            ? jsonResponse['PDAServiceReturnDataSet']['Error']
            : '0';
        var message = jsonResponse['PDAServiceReturnDataSet']['Message'] != null
            ? jsonResponse['PDAServiceReturnDataSet']['Message']
            : 'Ok';

        if (int.parse(error) >= 0) {
          List<dynamic> jsonList = jsonResponse['PDAServiceReturnDataSet']
              ['Data']['diffgr:diffgram']['NewDataSet']['DATASET_RETURN'];

          lista = jsonList;
        } else {
          throw Exception(response.statusCode.toString() +
              ' Failed to load Customers url:' +
              url +
              " - message: " +
              message);
        }

        return lista;
      } else {
        // If the server did not return a 200 OK response,
        // then throw an exception.
        throw Exception(response.statusCode.toString() +
            ' Failed to load Customers url:' +
            url);
      }
    } on SocketException catch (_) {
      throw Exception('Failed to load Customers url:' + url);
    } on Exception catch (e) {
      throw Exception(
          'Failed to load Customers url:' + url + " exc: " + e.toString());
    }
  }

  Future<List<Customer>> getCustomers() async {
    String domain = prefs.domain;
    String licence = prefs.licence;
    int operatorId = prefs.id_operador;
    String accessKey = prefs.accessKey;

    var data = DatabaseValues.information['pos_customers'];

    String url = domain +
        WEB_SERVICE_FLUTTER +
        "/" +
        'Get_Data_WithFileName' +
        "?strKey=" +
        betterEncode(MY_TEAM_STR_KEY.toString()) +
        "&strAccess=" +
        betterEncode(accessKey.toString()) +
        "&strLicence=" +
        betterEncode(licence.toString()) +
        "&strOperatorId=" +
        operatorId.toString() +
        "&filename=" +
        "POSData_Customers.sql" +
        "&folder=" +
        "Flutter/fa-v1";

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        String body = response.body;

        final Xml2Json xml2Json = Xml2Json();
        xml2Json.parse(body);
        dynamic jsonResponse = jsonDecode(xml2Json.toParker());

        List<Customer> lista = [];

        var error = jsonResponse['PDAServiceReturnDataSet']['Error'] != null
            ? jsonResponse['PDAServiceReturnDataSet']['Error']
            : '0';
        var message = jsonResponse['PDAServiceReturnDataSet']['Message'] != null
            ? jsonResponse['PDAServiceReturnDataSet']['Message']
            : 'Ok';

        if (int.parse(error) >= 0) {
          List<dynamic> jsonList = jsonResponse['PDAServiceReturnDataSet']
              ['Data']['diffgr:diffgram']['NewDataSet']['DATASET_RETURN'];

          for (var jsonElem in jsonList) {
            lista.add(Customer.fromMap(jsonElem));
          }
        } else {
          throw Exception(response.statusCode.toString() +
              ' Failed to load Customers url:' +
              url +
              " - message: " +
              message);
        }

        return lista;
      } else {
        // If the server did not return a 200 OK response,
        // then throw an exception.
        throw Exception(response.statusCode.toString() +
            ' Failed to load Customers url:' +
            url);
      }
    } on SocketException catch (_) {
      throw Exception('Failed to load Customers url:' + url);
    } on Exception catch (e) {
      throw Exception(
          'Failed to load Customers url:' + url + " exc: " + e.toString());
    }
  }

  Future<List<CustomersAddress>> getCustomersAddress() async {
    String domain = prefs.domain;
    String licence = prefs.licence;
    int operatorId = prefs.id_operador;
    String accessKey = prefs.accessKey;

    String url = domain +
        WEB_SERVICE_FLUTTER +
        "/" +
        'Get_Data_WithFileName' +
        "?strKey=" +
        betterEncode(MY_TEAM_STR_KEY.toString()) +
        "&strAccess=" +
        betterEncode(accessKey.toString()) +
        "&strLicence=" +
        betterEncode(licence.toString()) +
        "&strOperatorId=" +
        operatorId.toString() +
        "&filename=" +
        "POSData_Customers_Address.sql" +
        "&folder=" +
        "Flutter/fa-v1";

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        String body = response.body;

        final Xml2Json xml2Json = Xml2Json();
        xml2Json.parse(body);
        dynamic jsonResponse = jsonDecode(xml2Json.toParker());

        List<CustomersAddress> lista = [];

        var error = jsonResponse['PDAServiceReturnDataSet']['Error'] != null
            ? jsonResponse['PDAServiceReturnDataSet']['Error']
            : '0';
        var message = jsonResponse['PDAServiceReturnDataSet']['Message'] != null
            ? jsonResponse['PDAServiceReturnDataSet']['Message']
            : 'Ok';

        if (int.parse(error) >= 0) {
          List<dynamic> jsonList = jsonResponse['PDAServiceReturnDataSet']
              ['Data']['diffgr:diffgram']['NewDataSet']['DATASET_RETURN'];

          for (var jsonElem in jsonList) {
            lista.add(CustomersAddress.fromMap(jsonElem));
          }
        } else {
          throw Exception(response.statusCode.toString() +
              ' Failed to load CustomersAddress url:' +
              url +
              " - message: " +
              message);
        }

        return lista;
      } else {
        // If the server did not return a 200 OK response,
        // then throw an exception.
        throw Exception(response.statusCode.toString() +
            ' Failed to load CustomersAddress url:' +
            url);
      }
    } on SocketException catch (_) {
      throw Exception('Failed to load CustomersAddress url:' + url);
    } on Exception catch (e) {
      throw Exception('Failed to load CustomersAddress url:' +
          url +
          " exc: " +
          e.toString());
    }
  }

  Future<List<Product>> getProducts() async {
    String domain = prefs.domain;
    String licence = prefs.licence;
    int operatorId = prefs.id_operador;
    String accessKey = prefs.accessKey;

    String url = domain +
        WEB_SERVICE_FLUTTER +
        "/" +
        'Get_Data_WithFileName' +
        "?strKey=" +
        betterEncode(MY_TEAM_STR_KEY.toString()) +
        "&strAccess=" +
        betterEncode(accessKey.toString()) +
        "&strLicence=" +
        betterEncode(licence.toString()) +
        "&strOperatorId=" +
        operatorId.toString() +
        "&filename=" +
        "POSData_Products.sql" +
        "&folder=" +
        "Flutter/fa-v1";

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        String body = response.body;

        final Xml2Json xml2Json = Xml2Json();
        xml2Json.parse(body);
        dynamic jsonResponse = jsonDecode(xml2Json.toParker());

        List<Product> lista = [];

        var error = jsonResponse['PDAServiceReturnDataSet']['Error'] != null
            ? jsonResponse['PDAServiceReturnDataSet']['Error']
            : '0';
        var message = jsonResponse['PDAServiceReturnDataSet']['Message'] != null
            ? jsonResponse['PDAServiceReturnDataSet']['Message']
            : 'Ok';

        if (int.parse(error) >= 0) {
          List<dynamic> jsonList = jsonResponse['PDAServiceReturnDataSet']
              ['Data']['diffgr:diffgram']['NewDataSet']['DATASET_RETURN'];

          // jsonList.sublist(1, 7).forEach((jsonElem) {
          for (var jsonElem in jsonList) {
            lista.add(Product.fromMap(jsonElem));
          }
        } else {
          throw Exception(response.statusCode.toString() +
              ' Failed to load Products url:' +
              url +
              " - message: " +
              message);
        }

        return lista;
        // return Customers.fromJson(jsonList);
      } else {
        // If the server did not return a 200 OK response,
        // then throw an exception.
        throw Exception(response.statusCode.toString() +
            ' Failed to load Products url:' +
            url);
      }
    } on SocketException catch (_) {
      throw Exception('Failed to load Products url:' + url);
    } on Exception catch (e) {
      throw Exception(
          'Failed to load Products url:' + url + " exc: " + e.toString());
    }
  }

  /*

  Future<List<TipoTarefa>> getTiposTarefas() async {
    String domain = await prefs.domain;
    int operatorId = await prefs.id_operador;
    String accessKey = await prefs.accessKey;

    String url = domain +
        BACKOFFICE_WEBSERVICE +
        "/" +
        BACKOFFICE_GET_TIPOS_TAREFAS +
        "?strKey=" +
        STR_KEY.toString() +
        "&strAccess=" +
        betterEncode(accessKey.toString()) +
        "&id_operador=" +
        operatorId.toString();

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        String body = response.body;

        final Xml2Json xml2Json = Xml2Json();
        xml2Json.parse(body);
        dynamic jsonResponse = jsonDecode(xml2Json.toParker());

        List<TipoTarefa> lista = new List();

        var error = jsonResponse['PDAServiceReturn']['Error'];
        var message = jsonResponse['PDAServiceReturn']['Message'];

        if (int.parse(error) >= 0) {
          String xmlResult = jsonResponse['PDAServiceReturn']['Result'];
          xmlResult = normalizeToXML(xmlResult);

          xml2Json.parse(xmlResult);

          jsonResponse = jsonDecode(xml2Json.toParker());
          List<dynamic> jsonList = jsonResponse['root']['TIPOS'];
          jsonList.forEach((jsonElem) {
            lista.add(TipoTarefa.fromJsonLoad(jsonElem));
          });
        } else {
          throw Exception(response.statusCode.toString() +
              ' Failed to load tipostarefas url:' +
              url +
              " - message: " +
              message);
        }

        return lista;
      } else {
        // If the server did not return a 200 OK response,
        // then throw an exception.
        throw Exception(response.statusCode.toString() +
            ' Failed to load tipostarefas url:' +
            url);
      }
    } on SocketException catch (_) {
      throw Exception('Failed to load tipostarefas url:' + url);
    } on Exception catch (e) {
      throw Exception(
          'Failed to load tipostarefas url:' + url + " exc: " + e.toString());
    }
  }

  Future<List<Tarefa>> getTarefas() async {
    String domain = await prefs.domain;
    int operatorId = await prefs.id_operador;
    String accessKey = await prefs.accessKey;

    String url = domain +
        BACKOFFICE_WEBSERVICE +
        "/" +
        BACKOFFICE_GET_TAREFAS +
        "?strKey=" +
        STR_KEY.toString() +
        "&strAccess=" +
        betterEncode(accessKey.toString()) +
        "&id_operador=" +
        operatorId.toString();

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        String body = response.body;

        final Xml2Json xml2Json = Xml2Json();
        xml2Json.parse(body);
        dynamic jsonResponse = jsonDecode(xml2Json.toParker());

        List<Tarefa> lista = new List();

        var error = jsonResponse['PDAServiceReturn']['Error'];
        var message = jsonResponse['PDAServiceReturn']['Message'];

        if (int.parse(error) >= 0) {
          String xmlResult = jsonResponse['PDAServiceReturn']['Result'];
          xmlResult = normalizeToXML(xmlResult);

          xml2Json.parse(xmlResult);

          jsonResponse = jsonDecode(xml2Json.toParker());
          List<dynamic> jsonList = jsonResponse['root']['TAREFAS'];
          jsonList.forEach((jsonElem) {
            lista.add(Tarefa.fromJsonLoad(jsonElem));
          });
        } else {
          throw Exception(response.statusCode.toString() +
              ' Failed to load tarefas url:' +
              url +
              " - message: " +
              message);
        }

        return lista;
      } else {
        // If the server did not return a 200 OK response,
        // then throw an exception.
        throw Exception(response.statusCode.toString() +
            ' Failed to load tarefas url:' +
            url);
      }
    } on SocketException catch (_) {
      throw Exception('Failed to load tarefas url:' + url);
    } on Exception catch (e) {
      throw Exception(
          'Failed to load tarefas url:' + url + " exc: " + e.toString());
    }
  }

  Future<List<StatusWorkflow>> getStatusWorkflow() async {
    String domain = await prefs.domain;
    int operatorId = await prefs.id_operador;
    String accessKey = await prefs.accessKey;

    String url = domain +
        BACKOFFICE_WEBSERVICE +
        "/" +
        BACKOFFICE_GET_STATUS_WORK_FLOW +
        "?strKey=" +
        STR_KEY.toString() +
        "&strAccess=" +
        betterEncode(accessKey.toString()) +
        "&id_operador=" +
        operatorId.toString();

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        String body = response.body;

        final Xml2Json xml2Json = Xml2Json();
        xml2Json.parse(body);
        dynamic jsonResponse = jsonDecode(xml2Json.toParker());

        List<StatusWorkflow> lista = new List();

        var error = jsonResponse['PDAServiceReturn']['Error'];
        var message = jsonResponse['PDAServiceReturn']['Message'];

        if (int.parse(error) >= 0) {
          String xmlResult = jsonResponse['PDAServiceReturn']['Result'];
          xmlResult = normalizeToXML(xmlResult);

          xml2Json.parse(xmlResult);

          jsonResponse = jsonDecode(xml2Json.toParker());
          List<dynamic> jsonList = jsonResponse['root']['STATUS'];
          jsonList.forEach((jsonElem) {
            lista.add(StatusWorkflow.fromJson(jsonElem));
          });
        } else {
          throw Exception(response.statusCode.toString() +
              ' Failed to load tarefas url:' +
              url +
              " - message: " +
              message);
        }

        return lista;
      } else {
        // If the server did not return a 200 OK response,
        // then throw an exception.
        throw Exception(response.statusCode.toString() +
            ' Failed to load tarefas url:' +
            url);
      }
    } on SocketException catch (_) {
      throw Exception('Failed to load tarefas url:' + url);
    } on Exception catch (e) {
      throw Exception(
          'Failed to load tarefas url:' + url + " exc: " + e.toString());
    }
  }

  Future<List<Status>> getStatus() async {
    String domain = await prefs.domain;
    int operatorId = await prefs.id_operador;
    String accessKey = await prefs.accessKey;

    String url = domain +
        BACKOFFICE_WEBSERVICE +
        "/" +
        BACKOFFICE_GET_STATUS +
        "?strKey=" +
        STR_KEY.toString() +
        "&strAccess=" +
        betterEncode(accessKey.toString()) +
        "&id_operador=" +
        operatorId.toString();

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        String body = response.body;

        final Xml2Json xml2Json = Xml2Json();
        xml2Json.parse(body);
        dynamic jsonResponse = jsonDecode(xml2Json.toParker());

        List<Status> lista = new List();

        var error = jsonResponse['PDAServiceReturn']['Error'];
        var message = jsonResponse['PDAServiceReturn']['Message'];

        if (int.parse(error) >= 0) {
          String xmlResult = jsonResponse['PDAServiceReturn']['Result'];
          xmlResult = normalizeToXML(xmlResult);

          xml2Json.parse(xmlResult);

          jsonResponse = jsonDecode(xml2Json.toParker());
          List<dynamic> jsonList = jsonResponse['root']['STATUS'];
          jsonList.forEach((jsonElem) {
            lista.add(Status.fromJson(jsonElem));
          });
        } else {
          throw Exception(response.statusCode.toString() +
              ' Failed to load tarefas url:' +
              url +
              " - message: " +
              message);
        }

        return lista;
      } else {
        // If the server did not return a 200 OK response,
        // then throw an exception.
        throw Exception(response.statusCode.toString() +
            ' Failed to load tarefas url:' +
            url);
      }
    } on SocketException catch (_) {
      throw Exception('Failed to load tarefas url:' + url);
    } on Exception catch (e) {
      throw Exception(
          'Failed to load tarefas url:' + url + " exc: " + e.toString());
    }
  }

  Future<List<TipoTempo>> getTipoTempos() async {
    String domain = await prefs.domain;
    int operatorId = await prefs.id_operador;
    String accessKey = await prefs.accessKey;

    String url = domain +
        BACKOFFICE_WEBSERVICE +
        "/" +
        BACKOFFICE_GET_TIPO_TEMPOS +
        "?strKey=" +
        STR_KEY.toString() +
        "&strAccess=" +
        betterEncode(accessKey.toString()) +
        "&id_operador=" +
        operatorId.toString();

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        String body = response.body;

        final Xml2Json xml2Json = Xml2Json();
        xml2Json.parse(body);
        dynamic jsonResponse = jsonDecode(xml2Json.toParker());

        List<TipoTempo> lista = new List();

        var error = jsonResponse['PDAServiceReturn']['Error'];
        var message = jsonResponse['PDAServiceReturn']['Message'];

        if (int.parse(error) >= 0) {
          String xmlResult = jsonResponse['PDAServiceReturn']['Result'];
          xmlResult = normalizeToXML(xmlResult);

          xml2Json.parse(xmlResult);

          jsonResponse = jsonDecode(xml2Json.toParker());
          List<dynamic> jsonList = jsonResponse['root']['TIPOS'];
          jsonList.forEach((jsonElem) {
            lista.add(TipoTempo.fromLoadJson(jsonElem));
          });
        } else {
          throw Exception(response.statusCode.toString() +
              ' Failed to load tarefas url:' +
              url +
              " - message: " +
              message);
        }

        return lista;
      } else {
        // If the server did not return a 200 OK response,
        // then throw an exception.
        throw Exception(response.statusCode.toString() +
            ' Failed to load tarefas url:' +
            url);
      }
    } on SocketException catch (_) {
      throw Exception('Failed to load tarefas url:' + url);
    } on Exception catch (e) {
      throw Exception(
          'Failed to load tarefas url:' + url + " exc: " + e.toString());
    }
  }

  Future<List<TipoOcorrencia>> getTipoOcorrencias() async {
    String domain = await prefs.domain;
    int operatorId = await prefs.id_operador;
    String accessKey = await prefs.accessKey;

    String url = domain +
        BACKOFFICE_WEBSERVICE +
        "/" +
        BACKOFFICE_GET_TIPO_OCORRENCIAS +
        "?strKey=" +
        STR_KEY.toString() +
        "&strAccess=" +
        betterEncode(accessKey.toString()) +
        "&id_operador=" +
        operatorId.toString();

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        String body = response.body;

        final Xml2Json xml2Json = Xml2Json();
        xml2Json.parse(body);
        dynamic jsonResponse = jsonDecode(xml2Json.toParker());

        List<TipoOcorrencia> lista = new List();

        var error = jsonResponse['PDAServiceReturn']['Error'];
        var message = jsonResponse['PDAServiceReturn']['Message'];

        if (int.parse(error) >= 0) {
          String xmlResult = jsonResponse['PDAServiceReturn']['Result'];
          xmlResult = normalizeToXML(xmlResult);

          xml2Json.parse(xmlResult);

          jsonResponse = jsonDecode(xml2Json.toParker());
          List<dynamic> jsonList = jsonResponse['root']['TIPOS'];
          jsonList.forEach((jsonElem) {
            lista.add(TipoOcorrencia.fromJsonLoad(jsonElem));
          });
        } else {
          throw Exception(response.statusCode.toString() +
              ' Failed to load tarefas url:' +
              url +
              " - message: " +
              message);
        }

        return lista;
      } else {
        // If the server did not return a 200 OK response,
        // then throw an exception.
        throw Exception(response.statusCode.toString() +
            ' Failed to load tarefas url:' +
            url);
      }
    } on SocketException catch (_) {
      throw Exception('Failed to load tarefas url:' + url);
    } on Exception catch (e) {
      throw Exception(
          'Failed to load tarefas url:' + url + " exc: " + e.toString());
    }
  }

  Future<List<TipoTransacao>> getTipoTransacoes() async {
    String domain = await prefs.domain;
    int operatorId = await prefs.id_operador;
    String accessKey = await prefs.accessKey;

    String url = domain +
        BACKOFFICE_WEBSERVICE +
        "/" +
        BACKOFFICE_GET_TIPO_TRANSACOES +
        "?strKey=" +
        STR_KEY.toString() +
        "&strAccess=" +
        betterEncode(accessKey.toString()) +
        "&id_operador=" +
        operatorId.toString();

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        String body = response.body;

        final Xml2Json xml2Json = Xml2Json();
        xml2Json.parse(body);
        dynamic jsonResponse = jsonDecode(xml2Json.toParker());

        List<TipoTransacao> lista = new List();

        var error = jsonResponse['PDAServiceReturn']['Error'];
        var message = jsonResponse['PDAServiceReturn']['Message'];

        if (int.parse(error) >= 0) {
          String xmlResult = jsonResponse['PDAServiceReturn']['Result'];
          xmlResult = normalizeToXML(xmlResult);

          xml2Json.parse(xmlResult);

          jsonResponse = jsonDecode(xml2Json.toParker());
          List<dynamic> jsonList = jsonResponse['root']['TIPOS'];
          jsonList.forEach((jsonElem) {
            lista.add(TipoTransacao.fromJson(jsonElem));
          });
        } else {
          throw Exception(response.statusCode.toString() +
              ' Failed to load tarefas url:' +
              url +
              " - message: " +
              message);
        }

        return lista;
      } else {
        // If the server did not return a 200 OK response,
        // then throw an exception.
        throw Exception(response.statusCode.toString() +
            ' Failed to load tarefas url:' +
            url);
      }
    } on SocketException catch (_) {
      throw Exception('Failed to load tarefas url:' + url);
    } on Exception catch (e) {
      throw Exception(
          'Failed to load tarefas url:' + url + " exc: " + e.toString());
    }
  }

  Future<dynamic> addNewTask(String task, String processId) async {
    String domain = await prefs.domain;
    String accessKey = await prefs.accessKey;
    String password = await prefs.password;
    String username = await prefs.user;
    password = betterEncode(password);

    /*
    if (parameters == null)
      parameters = "";
     */

    String valueParameters = "<TASKAUTOMATION>" +
        "<ACCESSKEY>" +
        betterEncode(accessKey).toString() +
        "</ACCESSKEY>" +
        "<USER>" +
        username.toString() +
        "</USER>" +
        "<PWD>" +
        password.toString() +
        "</PWD>" +
        "<TASK>" +
        task.toString() +
        "</TASK>" +
        "<ID1>" +
        processId.toString() +
        "</ID1>" +
        //"<PARAMETERS>" + parameters.toString() + "</PARAMETERS>" +
        "</TASKAUTOMATION>";

    String url = domain +
        TASK_AUTOMATION_WEBSERVICE +
        "/" +
        METHOD_ADD_NEW_TASK_AUTOMATION +
        "?strKey=" +
        STR_KEY.toString() +
        "&parameters=" +
        valueParameters.toString();

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        String body = response.body;

        final Xml2Json xml2Json = Xml2Json();
        xml2Json.parse(body);
        dynamic jsonResponse = jsonDecode(xml2Json.toParker());

        jsonResponse = jsonResponse['ReturnResult']['ReturnSet']
            ['diffgr:diffgram']['NewDataSet']['DATASET_RETURN'];

        return jsonResponse;
      } else {
        // If the server did not return a 200 OK response,
        // then throw an exception.
        return null;
      }
    } on SocketException catch (e) {
      print('Failed to addNewTask url:' + url + " exc: " + e.toString());
      return null;
    } on Exception catch (e) {
      print('Failed to addNewTask url:' + url + " exc: " + e.toString());
      return null;
    }
  }

  */
}
