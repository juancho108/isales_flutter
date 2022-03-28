// To parse this JSON data, do
//
//     final customersAddress = customersAddressFromMap(jsonString);

import 'dart:convert';

class CustomersAddress {
  CustomersAddress({
    this.posCustomersAddressId,
    this.customerId,
    this.address,
    this.postalCode,
    this.city,
    this.country,
    this.gpsLat,
    this.gpsLog,
    this.notes,
    this.addressDefault,
    this.syncOk,
    this.addressId,
  });

  int? posCustomersAddressId;
  int? customerId;
  String? address;
  String? postalCode;
  String? city;
  String? country;
  String? gpsLat;
  String? gpsLog;
  String? notes;
  int? addressDefault;
  int? syncOk;
  int? addressId;

  factory CustomersAddress.fromJson(String str) =>
      CustomersAddress.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CustomersAddress.fromMap(Map<String, dynamic> json) =>
      CustomersAddress(
        posCustomersAddressId: int.parse(json["POS_CUSTOMERS_ADDRESS_ID"]),
        customerId: int.parse(json["CUSTOMER_ID"]),
        address: json["ADDRESS"],
        postalCode: json["POSTAL_CODE"],
        city: json["CITY"],
        country: json["COUNTRY"],
        gpsLat: json["GPS_LAT"],
        gpsLog: json["GPS_LOG"],
        notes: json["NOTES"],
        addressDefault: int.parse(json["ADDRESS_DEFAULT"]),
        syncOk: int.parse(json["SYNC_OK"]),
        addressId: int.parse(json["ADDRESS_ID"]),
      );

  factory CustomersAddress.fromMapFromDb(Map<String, dynamic> json) =>
      CustomersAddress(
        posCustomersAddressId: json["POS_CUSTOMERS_ADDRESS_ID"],
        customerId: json["CUSTOMER_ID"],
        address: json["ADDRESS"],
        postalCode: json["POSTAL_CODE"],
        city: json["CITY"],
        country: json["COUNTRY"],
        gpsLat: json["GPS_LAT"],
        gpsLog: json["GPS_LOG"],
        notes: json["NOTES"],
        addressDefault: json["ADDRESS_DEFAULT"],
        syncOk: json["SYNC_OK"],
        addressId: json["ADDRESS_ID"],
      );

  Map<String, dynamic> toMap() => {
        "POS_CUSTOMERS_ADDRESS_ID": posCustomersAddressId,
        "CUSTOMER_ID": customerId,
        "ADDRESS": address,
        "POSTAL_CODE": postalCode,
        "CITY": city,
        "COUNTRY": country,
        "GPS_LAT": gpsLat,
        "GPS_LOG": gpsLog,
        "NOTES": notes,
        "ADDRESS_DEFAULT": addressDefault,
        "SYNC_OK": syncOk,
        "ADDRESS_ID": addressId,
      };
}
