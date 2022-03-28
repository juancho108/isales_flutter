import 'dart:convert';

class Customer {
  Customer({
    this.tabela,
    this.posCustomersId,
    this.code,
    this.name,
    this.address,
    this.nif,
    this.isPurchase,
    this.isVisit,
    this.city,
    this.phone,
    this.email,
    this.countryid,
    this.salesupid,
    this.comercialConditions,
    this.daysToPay,
    this.nOpendocs,
    this.balance,
    this.creditLimit,
    this.gracePeriod,
    this.addresslocal,
    this.officialname,
    this.codpostal,
    this.restday,
    this.schedule,
    this.weekRest,
    this.openHour,
    this.closeHour,
    this.visitHour,
    this.deliveryDay,
    this.deliveryHour,
    this.resMon,
    this.resTue,
    this.resWed,
    this.resThu,
    this.resFri,
    this.resSat,
    this.resSun,
    this.creditControl,
    this.creditPassword,
    this.isNational,
    this.nextVisit,
    this.sent,
    this.androidNew,
    this.status,
    this.syncOk,
    this.supervisorNotes,
    this.vendorNotes,
    this.contact,
    this.androidUpdate,
    this.androidDelete,
    this.routeCode,
    this.routeLinePos,
    this.active,
    this.considerNew,
    this.gpsLat,
    this.gpsLon,
    this.contactName,
    this.contactPost,
    this.contactPhone,
    this.contactEmail,
    this.contactName2,
    this.contactPost2,
    this.contactPhone2,
    this.contactEmail2,
    this.contactName3,
    this.contactPost3,
    this.contactPhone3,
    this.contactEmail3,
    this.respCreditLimit,
    this.negotiatePrice,
    this.logisticOperatorId,
    this.onlyContractProducts,
    this.frequencyVisit,
    this.week1,
    this.week2,
    this.week3,
    this.week4,
    this.paymentConditions,
    this.externalDoc,
    this.onlyCashSales,
    this.apuraIva,
    this.tabTaras,
    this.country,
    this.normalizeCode,
    this.normalizeOfficialname,
    this.normalizeName,
    this.normalizeAddress,
    this.normalizeNif,
    this.normalizeCity,
    this.normalizePhone,
    this.contratacaoPublica,
    this.compromissoContratacaoPublica,
  });

  int? posCustomersId;
  String? tabela;
  String? code;
  String? name;
  String? address;
  String? nif;
  int? isPurchase;
  int? isVisit;
  String? city;
  String? phone;
  String? email;
  int? countryid;
  int? salesupid;
  String? comercialConditions;
  int? daysToPay;
  int? nOpendocs;
  double? balance;
  double? creditLimit;
  int? gracePeriod;
  String? addresslocal;
  String? officialname;
  String? codpostal;
  dynamic? restday;
  dynamic? schedule;
  dynamic? weekRest;
  dynamic? openHour;
  dynamic? closeHour;
  dynamic? visitHour;
  dynamic? deliveryDay;
  dynamic? deliveryHour;
  dynamic? resMon;
  dynamic? resTue;
  dynamic? resWed;
  dynamic? resThu;
  dynamic? resFri;
  dynamic? resSat;
  dynamic? resSun;
  int? creditControl;
  String? creditPassword;
  dynamic? isNational;
  dynamic? nextVisit;
  dynamic? sent;
  int? androidNew;
  int? status;
  int? syncOk;
  String? supervisorNotes;
  String? vendorNotes;
  String? contact;
  int? androidUpdate;
  int? androidDelete;
  dynamic? routeCode;
  dynamic? routeLinePos;
  int? active;
  int? considerNew;
  String? gpsLat;
  String? gpsLon;
  String? contactName;
  String? contactPost;
  String? contactPhone;
  String? contactEmail;
  String? contactName2;
  String? contactPost2;
  String? contactPhone2;
  String? contactEmail2;
  String? contactName3;
  String? contactPost3;
  String? contactPhone3;
  String? contactEmail3;
  double? respCreditLimit;
  int? negotiatePrice;
  int? logisticOperatorId;
  int? onlyContractProducts;
  String? frequencyVisit;
  int? week1;
  int? week2;
  int? week3;
  int? week4;
  String? paymentConditions;
  int? externalDoc;
  int? onlyCashSales;
  int? apuraIva;
  int? tabTaras;
  String? country;
  String? normalizeCode;
  String? normalizeOfficialname;
  String? normalizeName;
  String? normalizeAddress;
  String? normalizeNif;
  String? normalizeCity;
  String? normalizePhone;
  int? contratacaoPublica;
  String? compromissoContratacaoPublica;

  factory Customer.fromJson(String str) => Customer.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Customer.fromMapMin(Map<String, dynamic> json) => Customer(
        posCustomersId:
            json["POS_CUSTOMERS_ID"] == null ? -1 : (json["POS_CUSTOMERS_ID"]),
        tabela: json["TABELA"] == null ? 'POS_CUSTOMERS' : json["TABELA"],
        code: json["CODE"] == null ? 'null' : json["CODE"],
        name: json["NAME"] == null ? 'null' : json["NAME"],
        address: json["ADDRESS"] == null ? 'null' : json["ADDRESS"],
        nif: json["NIF"] == null ? -1 : (json["NIF"]),
        isPurchase: json["IS_PURCHASE"] == null ? -1 : (json["IS_PURCHASE"]),
        isVisit: json["IS_VISIT"] == null ? -1 : (json["IS_VISIT"]),
        city: json["CITY"] == null ? 'null' : json["CITY"],
        phone: json["PHONE"],
        email: json["EMAIL"],
      );

  factory Customer.fromMap(Map<String, dynamic> json) {
    return Customer(
      posCustomersId:
          json["POS_CUSTOMERS_ID"] == null ? null : json["POS_CUSTOMERS_ID"],
      tabela: json["TABELA"] == null ? null : json["TABELA"],
      code: json["CODE"] == null ? null : json["CODE"],
      name: json["NAME"] == null ? null : json["NAME"],
      address: json["ADDRESS"] == null ? null : json["ADDRESS"],
      nif: json["NIF"] == null ? '' : json["NIF"],
      isPurchase:
          json["IS_PURCHASE"] == null ? null : int.parse(json["IS_PURCHASE"]),
      isVisit: json["IS_VISIT"] == null ? null : int.parse(json["IS_VISIT"]),
      city: json["CITY"] == null ? null : json["CITY"],
      phone: json["PHONE"],
      email: json["EMAIL"],
      countryid: json["COUNTRYID"],
      salesupid:
          json["SALESUPID"] == null ? null : int.parse(json["SALESUPID"]),
      comercialConditions: json["COMERCIAL_CONDITIONS"] == null
          ? null
          : json["COMERCIAL_CONDITIONS"],
      daysToPay:
          json["DAYS_TO_PAY"] == null ? null : int.parse(json["DAYS_TO_PAY"]),
      nOpendocs:
          json["N_OPENDOCS"] == null ? null : int.parse(json["N_OPENDOCS"]),
      balance: json["BALANCE"] == null ? null : double.parse(json["BALANCE"]),
      creditLimit: json["CREDIT_LIMIT"] == null
          ? null
          : double.parse(json["CREDIT_LIMIT"]),
      gracePeriod:
          json["GRACE_PERIOD"] == null ? null : int.parse(json["GRACE_PERIOD"]),
      addresslocal: json["ADDRESSLOCAL"] == null ? null : json["ADDRESSLOCAL"],
      officialname: json["OFFICIALNAME"] == null ? null : json["OFFICIALNAME"],
      codpostal: json["CODPOSTAL"] == null ? null : json["CODPOSTAL"],
      restday: json["RESTDAY"],
      schedule: json["SCHEDULE"],
      weekRest: json["WEEK_REST"],
      openHour: json["OPEN_HOUR"],
      closeHour: json["CLOSE_HOUR"],
      visitHour: json["VISIT_HOUR"],
      deliveryDay: json["DELIVERY_DAY"],
      deliveryHour: json["DELIVERY_HOUR"],
      resMon: json["RES_MON"],
      resTue: json["RES_TUE"],
      resWed: json["RES_WED"],
      resThu: json["RES_THU"],
      resFri: json["RES_FRI"],
      resSat: json["RES_SAT"],
      resSun: json["RES_SUN"],
      creditControl: json["CREDIT_CONTROL"] == null
          ? null
          : int.parse(json["CREDIT_CONTROL"]),
      creditPassword:
          json["CREDIT_PASSWORD"] == null ? null : json["CREDIT_PASSWORD"],
      isNational: json["IS_NATIONAL"],
      nextVisit: json["NEXT_VISIT"],
      sent: json["SENT"],
      androidNew: json["ANDROID_NEW"] == null ? null : json["ANDROID_NEW"],
      status: json["STATUS"] == null ? null : json["STATUS"],
      syncOk: json["SYNC_OK"] == null ? null : json["SYNC_OK"],
      supervisorNotes: json["SUPERVISOR_NOTES"],
      vendorNotes: json["VENDOR_NOTES"],
      contact: json["CONTACT"] == null ? null : json["CONTACT"],
      androidUpdate:
          json["ANDROID_UPDATE"] == null ? null : json["ANDROID_UPDATE"],
      androidDelete:
          json["ANDROID_DELETE"] == null ? null : json["ANDROID_DELETE"],
      routeCode: json["ROUTE_CODE"],
      routeLinePos: json["ROUTE_LINE_POS"],
      active: json["ACTIVE"] == null ? null : int.parse(json["ACTIVE"]),
      considerNew: json["CONSIDER_NEW"] == null ? null : json["CONSIDER_NEW"],
      gpsLat: json["GPS_LAT"] == null ? null : json["GPS_LAT"],
      gpsLon: json["GPS_LON"] == null ? null : json["GPS_LON"],
      contactName: json["CONTACT_NAME"],
      contactPost: json["CONTACT_POST"],
      contactPhone: json["CONTACT_PHONE"],
      contactEmail: json["CONTACT_EMAIL"],
      contactName2: json["CONTACT_NAME_2"],
      contactPost2: json["CONTACT_POST_2"],
      contactPhone2: json["CONTACT_PHONE_2"],
      contactEmail2: json["CONTACT_EMAIL_2"],
      contactName3: json["CONTACT_NAME_3"],
      contactPost3: json["CONTACT_POST_3"],
      contactPhone3: json["CONTACT_PHONE_3"],
      contactEmail3: json["CONTACT_EMAIL_3"],
      respCreditLimit: json["RESP_CREDIT_LIMIT"] == null
          ? null
          : double.parse(json["RESP_CREDIT_LIMIT"]),
      negotiatePrice: json["NEGOTIATE_PRICE"] == null
          ? null
          : int.parse(json["NEGOTIATE_PRICE"]),
      logisticOperatorId: json["LOGISTIC_OPERATOR_ID"] == null
          ? null
          : int.parse(json["LOGISTIC_OPERATOR_ID"]),
      onlyContractProducts: json["ONLY_CONTRACT_PRODUCTS"] == null
          ? null
          : int.parse(json["ONLY_CONTRACT_PRODUCTS"]),
      frequencyVisit: json["FREQUENCY_VISIT"],
      week1: json["WEEK1"] == null ? null : int.parse(json["WEEK1"]),
      week2: json["WEEK2"] == null ? null : int.parse(json["WEEK2"]),
      week3: json["WEEK3"] == null ? null : int.parse(json["WEEK3"]),
      week4: json["WEEK4"] == null ? null : int.parse(json["WEEK4"]),
      paymentConditions: json["PAYMENT_CONDITIONS"] == null
          ? null
          : json["PAYMENT_CONDITIONS"],
      externalDoc: json["EXTERNAL_DOC"] == null ? null : json["EXTERNAL_DOC"],
      onlyCashSales: json["ONLY_CASH_SALES"] == null
          ? null
          : int.parse(json["ONLY_CASH_SALES"]),
      apuraIva: json["APURA_IVA"] == null ? null : int.parse(json["APURA_IVA"]),
      tabTaras: json["TAB_TARAS"] == null ? null : int.parse(json["TAB_TARAS"]),
      country: json["COUNTRY"] == null ? null : json["COUNTRY"],
      normalizeCode:
          json["NORMALIZE_CODE"] == null ? null : json["NORMALIZE_CODE"],
      normalizeOfficialname: json["NORMALIZE_OFFICIALNAME"] == null
          ? null
          : json["NORMALIZE_OFFICIALNAME"],
      normalizeName:
          json["NORMALIZE_NAME"] == null ? null : json["NORMALIZE_NAME"],
      normalizeAddress:
          json["NORMALIZE_ADDRESS"] == null ? null : json["NORMALIZE_ADDRESS"],
      normalizeNif:
          json["NORMALIZE_NIF"] == null ? null : json["NORMALIZE_NIF"],
      normalizeCity:
          json["NORMALIZE_CITY"] == null ? null : json["NORMALIZE_CITY"],
      normalizePhone: json["NORMALIZE_PHONE"],
      contratacaoPublica: json["CONTRATACAO_PUBLICA"] == null
          ? null
          : int.parse(json["CONTRATACAO_PUBLICA"]),
      compromissoContratacaoPublica: json["COMPROMISSO_CONTRATACAO_PUBLICA"],
    );
  }

  factory Customer.fromMapFromDb(Map<String, dynamic> json) {
    return Customer(
      posCustomersId:
          json["POS_CUSTOMERS_ID"] == null ? null : json["POS_CUSTOMERS_ID"],
      tabela: json["TABELA"] == null ? null : json["TABELA"],
      code: json["CODE"] == null ? null : json["CODE"],
      name: json["NAME"] == null ? null : json["NAME"],
      address: json["ADDRESS"] == null ? null : json["ADDRESS"],
      nif: json["NIF"] == null ? '' : json["NIF"].toString(),
      isPurchase: json["IS_PURCHASE"] == null ? null : (json["IS_PURCHASE"]),
      isVisit: json["IS_VISIT"] == null ? null : (json["IS_VISIT"]),
      city: json["CITY"] == null ? null : json["CITY"],
      phone: json["PHONE"],
      email: json["EMAIL"],
      countryid: json["COUNTRYID"],
      salesupid: json["SALESUPID"] == null ? null : (json["SALESUPID"]),
      comercialConditions: json["COMERCIAL_CONDITIONS"] == null
          ? null
          : json["COMERCIAL_CONDITIONS"],
      daysToPay: json["DAYS_TO_PAY"] == null ? null : (json["DAYS_TO_PAY"]),
      nOpendocs: json["N_OPENDOCS"] == null ? null : (json["N_OPENDOCS"]),
      balance: json["BALANCE"] == null ? null : (json["BALANCE"]),
      creditLimit: json["CREDIT_LIMIT"] == null
          ? null
          : double.parse(json["CREDIT_LIMIT"]),
      gracePeriod: json["GRACE_PERIOD"] == null ? null : (json["GRACE_PERIOD"]),
      addresslocal: json["ADDRESSLOCAL"] == null ? null : json["ADDRESSLOCAL"],
      officialname: json["OFFICIALNAME"] == null ? null : json["OFFICIALNAME"],
      codpostal: json["CODPOSTAL"] == null ? null : json["CODPOSTAL"],
      restday: json["RESTDAY"],
      schedule: json["SCHEDULE"],
      weekRest: json["WEEK_REST"],
      openHour: json["OPEN_HOUR"],
      closeHour: json["CLOSE_HOUR"],
      visitHour: json["VISIT_HOUR"],
      deliveryDay: json["DELIVERY_DAY"],
      deliveryHour: json["DELIVERY_HOUR"],
      resMon: json["RES_MON"],
      resTue: json["RES_TUE"],
      resWed: json["RES_WED"],
      resThu: json["RES_THU"],
      resFri: json["RES_FRI"],
      resSat: json["RES_SAT"],
      resSun: json["RES_SUN"],
      creditControl:
          json["CREDIT_CONTROL"] == null ? null : (json["CREDIT_CONTROL"]),
      creditPassword:
          json["CREDIT_PASSWORD"] == null ? null : json["CREDIT_PASSWORD"],
      isNational: json["IS_NATIONAL"],
      nextVisit: json["NEXT_VISIT"],
      sent: json["SENT"],
      androidNew: json["ANDROID_NEW"] == null ? null : json["ANDROID_NEW"],
      status: json["STATUS"] == null ? null : json["STATUS"],
      syncOk: json["SYNC_OK"] == null ? null : json["SYNC_OK"],
      supervisorNotes: json["SUPERVISOR_NOTES"],
      vendorNotes: json["VENDOR_NOTES"],
      contact: json["CONTACT"] == null ? null : json["CONTACT"],
      androidUpdate:
          json["ANDROID_UPDATE"] == null ? null : json["ANDROID_UPDATE"],
      androidDelete:
          json["ANDROID_DELETE"] == null ? null : json["ANDROID_DELETE"],
      routeCode: json["ROUTE_CODE"],
      routeLinePos: json["ROUTE_LINE_POS"],
      active: json["ACTIVE"] == null ? null : (json["ACTIVE"]),
      considerNew: json["CONSIDER_NEW"] == null ? null : json["CONSIDER_NEW"],
      gpsLat: json["GPS_LAT"] == null ? null : json["GPS_LAT"],
      gpsLon: json["GPS_LON"] == null ? null : json["GPS_LON"],
      contactName: json["CONTACT_NAME"],
      contactPost: json["CONTACT_POST"],
      contactPhone: json["CONTACT_PHONE"],
      contactEmail: json["CONTACT_EMAIL"],
      contactName2: json["CONTACT_NAME_2"],
      contactPost2: json["CONTACT_POST_2"],
      contactPhone2: json["CONTACT_PHONE_2"],
      contactEmail2: json["CONTACT_EMAIL_2"],
      contactName3: json["CONTACT_NAME_3"],
      contactPost3: json["CONTACT_POST_3"],
      contactPhone3: json["CONTACT_PHONE_3"],
      contactEmail3: json["CONTACT_EMAIL_3"],
      respCreditLimit: json["RESP_CREDIT_LIMIT"] == null
          ? null
          : double.parse(json["RESP_CREDIT_LIMIT"]),
      negotiatePrice:
          json["NEGOTIATE_PRICE"] == null ? null : (json["NEGOTIATE_PRICE"]),
      logisticOperatorId: json["LOGISTIC_OPERATOR_ID"] == null
          ? null
          : (json["LOGISTIC_OPERATOR_ID"]),
      onlyContractProducts: json["ONLY_CONTRACT_PRODUCTS"] == null
          ? null
          : (json["ONLY_CONTRACT_PRODUCTS"]),
      frequencyVisit: json["FREQUENCY_VISIT"],
      week1: json["WEEK1"] == null ? null : (json["WEEK1"]),
      week2: json["WEEK2"] == null ? null : (json["WEEK2"]),
      week3: json["WEEK3"] == null ? null : (json["WEEK3"]),
      week4: json["WEEK4"] == null ? null : (json["WEEK4"]),
      paymentConditions: json["PAYMENT_CONDITIONS"] == null
          ? null
          : json["PAYMENT_CONDITIONS"],
      externalDoc: json["EXTERNAL_DOC"] == null ? null : json["EXTERNAL_DOC"],
      onlyCashSales:
          json["ONLY_CASH_SALES"] == null ? null : (json["ONLY_CASH_SALES"]),
      apuraIva: json["APURA_IVA"] == null ? null : (json["APURA_IVA"]),
      tabTaras: json["TAB_TARAS"] == null ? null : (json["TAB_TARAS"]),
      country: json["COUNTRY"] == null ? null : json["COUNTRY"],
      normalizeCode:
          json["NORMALIZE_CODE"] == null ? null : json["NORMALIZE_CODE"],
      normalizeOfficialname: json["NORMALIZE_OFFICIALNAME"] == null
          ? null
          : json["NORMALIZE_OFFICIALNAME"],
      normalizeName:
          json["NORMALIZE_NAME"] == null ? null : json["NORMALIZE_NAME"],
      normalizeAddress:
          json["NORMALIZE_ADDRESS"] == null ? null : json["NORMALIZE_ADDRESS"],
      normalizeNif:
          json["NORMALIZE_NIF"] == null ? null : json["NORMALIZE_NIF"],
      normalizeCity:
          json["NORMALIZE_CITY"] == null ? null : json["NORMALIZE_CITY"],
      normalizePhone: json["NORMALIZE_PHONE"],
      contratacaoPublica: json["CONTRATACAO_PUBLICA"] == null
          ? null
          : (json["CONTRATACAO_PUBLICA"]),
      compromissoContratacaoPublica: json["COMPROMISSO_CONTRATACAO_PUBLICA"],
    );
  }

  Map<String, dynamic> toMap() => {
        "POS_CUSTOMERS_ID": posCustomersId == null ? null : posCustomersId,
        "TABELA": code == null ? null : tabela,
        "CODE": code == null ? null : code,
        "NAME": name == null ? null : name,
        "ADDRESS": address == null ? null : address,
        "NIF": nif == null ? null : nif,
        "IS_PURCHASE": isPurchase == null ? null : isPurchase,
        "IS_VISIT": isVisit == null ? null : isVisit,
        "CITY": city == null ? null : city,
        "PHONE": phone,
        "EMAIL": email,
        "COUNTRYID": countryid,
        "SALESUPID": salesupid == null ? null : salesupid,
        "COMERCIAL_CONDITIONS":
            comercialConditions == null ? null : comercialConditions,
        "DAYS_TO_PAY": daysToPay == null ? null : daysToPay,
        "N_OPENDOCS": nOpendocs == null ? null : nOpendocs,
        "BALANCE": balance == null ? null : balance,
        "CREDIT_LIMIT": creditLimit == null ? null : creditLimit,
        "GRACE_PERIOD": gracePeriod == null ? null : gracePeriod,
        "ADDRESSLOCAL": addresslocal == null ? null : addresslocal,
        "OFFICIALNAME": officialname == null ? null : officialname,
        "CODPOSTAL": codpostal == null ? null : codpostal,
        "RESTDAY": restday,
        "SCHEDULE": schedule,
        "WEEK_REST": weekRest,
        "OPEN_HOUR": openHour,
        "CLOSE_HOUR": closeHour,
        "VISIT_HOUR": visitHour,
        "DELIVERY_DAY": deliveryDay,
        "DELIVERY_HOUR": deliveryHour,
        "RES_MON": resMon,
        "RES_TUE": resTue,
        "RES_WED": resWed,
        "RES_THU": resThu,
        "RES_FRI": resFri,
        "RES_SAT": resSat,
        "RES_SUN": resSun,
        "CREDIT_CONTROL": creditControl == null ? null : creditControl,
        "CREDIT_PASSWORD": creditPassword == null ? null : creditPassword,
        "IS_NATIONAL": isNational,
        "NEXT_VISIT": nextVisit,
        "SENT": sent,
        "ANDROID_NEW": androidNew == null ? null : androidNew,
        "STATUS": status == null ? null : status,
        "SYNC_OK": syncOk == null ? null : syncOk,
        "SUPERVISOR_NOTES": supervisorNotes,
        "VENDOR_NOTES": vendorNotes,
        "CONTACT": contact == null ? null : contact,
        "ANDROID_UPDATE": androidUpdate == null ? null : androidUpdate,
        "ANDROID_DELETE": androidDelete == null ? null : androidDelete,
        "ROUTE_CODE": routeCode,
        "ROUTE_LINE_POS": routeLinePos,
        "ACTIVE": active == null ? null : active,
        "CONSIDER_NEW": considerNew == null ? null : considerNew,
        "GPS_LAT": gpsLat == null ? null : gpsLat,
        "GPS_LON": gpsLon == null ? null : gpsLon,
        "CONTACT_NAME": contactName,
        "CONTACT_POST": contactPost,
        "CONTACT_PHONE": contactPhone,
        "CONTACT_EMAIL": contactEmail,
        "CONTACT_NAME_2": contactName2,
        "CONTACT_POST_2": contactPost2,
        "CONTACT_PHONE_2": contactPhone2,
        "CONTACT_EMAIL_2": contactEmail2,
        "CONTACT_NAME_3": contactName3,
        "CONTACT_POST_3": contactPost3,
        "CONTACT_PHONE_3": contactPhone3,
        "CONTACT_EMAIL_3": contactEmail3,
        "RESP_CREDIT_LIMIT": respCreditLimit == null ? null : respCreditLimit,
        "NEGOTIATE_PRICE": negotiatePrice == null ? null : negotiatePrice,
        "LOGISTIC_OPERATOR_ID":
            logisticOperatorId == null ? null : logisticOperatorId,
        "ONLY_CONTRACT_PRODUCTS":
            onlyContractProducts == null ? null : onlyContractProducts,
        "FREQUENCY_VISIT": frequencyVisit,
        "WEEK1": week1 == null ? null : week1,
        "WEEK2": week2 == null ? null : week2,
        "WEEK3": week3 == null ? null : week3,
        "WEEK4": week4 == null ? null : week4,
        "PAYMENT_CONDITIONS":
            paymentConditions == null ? null : paymentConditions,
        "EXTERNAL_DOC": externalDoc == null ? null : externalDoc,
        "ONLY_CASH_SALES": onlyCashSales == null ? null : onlyCashSales,
        "APURA_IVA": apuraIva == null ? null : apuraIva,
        "TAB_TARAS": tabTaras == null ? null : tabTaras,
        "COUNTRY": country == null ? null : country,
        "NORMALIZE_CODE": normalizeCode == null ? null : normalizeCode,
        "NORMALIZE_OFFICIALNAME":
            normalizeOfficialname == null ? null : normalizeOfficialname,
        "NORMALIZE_NAME": normalizeName == null ? null : normalizeName,
        "NORMALIZE_ADDRESS": normalizeAddress == null ? null : normalizeAddress,
        "NORMALIZE_NIF": normalizeNif == null ? null : normalizeNif,
        "NORMALIZE_CITY": normalizeCity == null ? null : normalizeCity,
        "NORMALIZE_PHONE": normalizePhone,
        "CONTRATACAO_PUBLICA":
            contratacaoPublica == null ? null : contratacaoPublica,
        "COMPROMISSO_CONTRATACAO_PUBLICA": compromissoContratacaoPublica,
      };
}










// ignore_for_file: non_constant_identifier_names
/*import 'package:flutter/foundation.dart';

class Customer {
  double? credit_limit;
  double? resp_credit_limit;
  double? balance;
  int? is_purchase;
  int? countryid;
  int? salesupid;
  int? days_to_pay;
  int? n_opendocs;
  int? grace_period;
  int? res_mon;
  int? res_tue;
  int? res_wed;
  int? res_thu;
  int? res_fri;
  int? res_sat;
  int? res_sun;
  int? credit_control;
  int? is_national;
  int? sent;
  int? android_new;
  int? status;
  int? sync_ok;
  int? android_update;
  int? android_delete;
  int? route_line_pos;
  int? active;
  int? consider_new;
  int? negotiate_price;
  int? logistic_operator_id;
  int? only_contract_products;
  int? week1;
  int? week2;
  int? week3;
  int? week4;
  int? external_doc;
  int? only_cash_sales;
  int? apura_iva;
  int? tab_taras;
  int? contratacao_publica;
  int next_visit;
  int pos_customers_id;
  int is_visit;
  String nif;
  String name;
  String address;
  String city;
  String phone;
  String email;
  String? code;
  String? comercial_conditions;
  String? addresslocal;
  String? officialname;
  String? codpostal;
  String? restday;
  String? schedule;
  String? week_rest;
  String? open_hour;
  String? close_hour;
  String? visit_hour;
  String? delivery_day;
  String? delivery_hour;
  String? credit_password;
  String? supervisor_notes;
  String? vendor_notes;
  String? contact;
  String? route_code;
  String? gps_lat;
  String? gps_lon;
  String? contact_name;
  String? contact_post;
  String? contact_phone;
  String? contact_email;
  String? contact_name_2;
  String? contact_post_2;
  String? contact_phone_2;
  String? contact_email_2;
  String? contact_name_3;
  String? contact_post_3;
  String? contact_phone_3;
  String? contact_email_3;
  String? frequency_visit;
  String? payment_conditions;
  String? country;
  String? normalize_code;
  String? normalize_officialname;
  String? normalize_name;
  String? normalize_address;
  String? normalize_nif;
  String? normalize_city;
  String? normalize_phone;
  String? compromisso_contratacao_publica;

  Customer({
    required this.nif,
    required this.name,
    required this.address,
    required this.city,
    required this.phone,
    required this.email,
    required this.is_visit,
    required this.next_visit,
    required this.pos_customers_id,
    this.code,
    this.comercial_conditions,
    this.addresslocal,
    this.officialname,
    this.codpostal,
    this.restday,
    this.schedule,
    this.week_rest,
    this.open_hour,
    this.close_hour,
    this.visit_hour,
    this.delivery_day,
    this.delivery_hour,
    this.credit_password,
    this.supervisor_notes,
    this.vendor_notes,
    this.contact,
    this.route_code,
    this.gps_lat,
    this.gps_lon,
    this.contact_name,
    this.contact_post,
    this.contact_phone,
    this.contact_email,
    this.contact_name_2,
    this.contact_post_2,
    this.contact_phone_2,
    this.contact_email_2,
    this.contact_name_3,
    this.contact_post_3,
    this.contact_phone_3,
    this.contact_email_3,
    this.frequency_visit,
    this.payment_conditions,
    this.country,
    this.normalize_code,
    this.normalize_officialname,
    this.normalize_name,
    this.normalize_address,
    this.normalize_nif,
    this.normalize_city,
    this.normalize_phone,
    this.compromisso_contratacao_publica,
    this.is_purchase,
    this.countryid,
    this.salesupid,
    this.days_to_pay,
    this.n_opendocs,
    this.grace_period,
    this.res_mon,
    this.res_tue,
    this.res_wed,
    this.res_thu,
    this.res_fri,
    this.res_sat,
    this.res_sun,
    this.credit_control,
    this.is_national,
    this.sent,
    this.android_new,
    this.status,
    this.sync_ok,
    this.android_update,
    this.android_delete,
    this.route_line_pos,
    this.active,
    this.consider_new,
    this.negotiate_price,
    this.logistic_operator_id,
    this.only_contract_products,
    this.week1,
    this.week2,
    this.week3,
    this.week4,
    this.external_doc,
    this.only_cash_sales,
    this.apura_iva,
    this.tab_taras,
    this.contratacao_publica,
  });

  Customer.minimum({
    required this.nif,
    required this.name,
    required this.address,
    required this.city,
    required this.phone,
    required this.email,
    required this.is_visit,
    required this.next_visit,
    required this.pos_customers_id,
  });
}
*/