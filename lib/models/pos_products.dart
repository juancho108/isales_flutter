// To parse this JSON data, do
//
//     final product = productFromMap(jsonString);

import 'dart:convert';

class Product {
  Product({
    this.posProductsId,
    this.salesupId,
    this.code,
    this.name,
    this.slogan,
    this.codseg1,
    this.codseg2,
    this.codseg3,
    this.codseg4,
    this.codseg5,
    this.codseg6,
    this.pvp1,
    this.pvp2,
    this.pvp3,
    this.pvp4,
    this.pvp5,
    this.pvp6,
    this.pvp7,
    this.pvp8,
    this.iva,
    this.size,
    this.unitPerBox,
    this.disc1Max,
    this.disc2Max,
    this.disc3Max,
    this.sellingUnit,
    this.priceMin,
    this.disc1Table,
    this.disc2Table,
    this.disc3Table,
    this.disc4Table,
    this.disc5Table,
    this.disc6Table,
    this.disc7Table,
    this.disc8Table,
    this.url,
    this.editName,
    this.syncOk,
    this.managesStock,
    this.sellNegativeStock,
    this.isContainer,
    this.grossWeight,
    this.netWeight,
    this.imageFile,
    this.htmlDetails,
    this.variation,
    this.isSogenave,
    this.providerCode,
    this.convBoxes,
    this.buyingUnit,
    this.iabaSell,
    this.membersprice,
    this.isReduction,
    this.pvp1Iva,
    this.pvp2Iva,
    this.pvp3Iva,
    this.pvp4Iva,
    this.pvp5Iva,
    this.pvp6Iva,
    this.pvp7Iva,
    this.pvp8Iva,
    this.controlaLote,
    this.rastreabilidade,
    this.defprod1,
    this.defprod2,
    this.unidadeCap,
    this.casasDecimaisQtd,
    this.produzSoComEncomenda,
    this.name2,
  });

  int? posProductsId;
  int? salesupId;
  String? code;
  String? name;
  String? slogan;
  String? codseg1;
  String? codseg2;
  String? codseg3;
  String? codseg4;
  String? codseg5;
  String? codseg6;
  double? pvp1;
  double? pvp2;
  double? pvp3;
  double? pvp4;
  double? pvp5;
  double? pvp6;
  double? pvp7;
  double? pvp8;
  String? iva;
  double? size;
  double? unitPerBox;
  double? disc1Max;
  double? disc2Max;
  double? disc3Max;
  String? sellingUnit;
  double? priceMin;
  double? disc1Table;
  double? disc2Table;
  double? disc3Table;
  double? disc4Table;
  double? disc5Table;
  double? disc6Table;
  double? disc7Table;
  double? disc8Table;
  String? url;
  int? editName;
  int? syncOk;
  int? managesStock;
  int? sellNegativeStock;
  int? isContainer;
  double? grossWeight;
  double? netWeight;
  String? imageFile;
  String? htmlDetails;
  int? variation;
  int? isSogenave;
  String? providerCode;
  int? convBoxes;
  String? buyingUnit;
  double? iabaSell;
  String? membersprice;
  String? isReduction;
  double? pvp1Iva;
  double? pvp2Iva;
  double? pvp3Iva;
  double? pvp4Iva;
  double? pvp5Iva;
  double? pvp6Iva;
  double? pvp7Iva;
  double? pvp8Iva;
  int? controlaLote;
  int? rastreabilidade;
  String? defprod1;
  String? defprod2;
  String? unidadeCap;
  int? casasDecimaisQtd;
  int? produzSoComEncomenda;
  String? name2;

  factory Product.fromJson(String str) => Product.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Product.fromMap(Map<String, dynamic> json) => Product(
        posProductsId: json["POS_PRODUCTS_ID"],
        salesupId: int.parse(json["SALESUP_ID"]),
        code: json["CODE"],
        name: json["NAME"] == null ? null : json["NAME"],
        slogan: json["SLOGAN"] == null ? null : json["SLOGAN"],
        codseg1: json["CODSEG1"],
        codseg2: json["CODSEG2"],
        codseg3: json["CODSEG3"],
        codseg4: json["CODSEG4"],
        codseg5: json["CODSEG5"],
        codseg6: json["CODSEG6"],
        pvp1: double.parse(json["PVP1"]),
        pvp2: double.parse(json["PVP2"]),
        pvp3: double.parse(json["PVP3"]),
        pvp4: double.parse(json["PVP4"]),
        pvp5: double.parse(json["PVP5"]),
        pvp6: double.parse(json["PVP6"]),
        pvp7: double.parse(json["PVP7"]),
        pvp8: double.parse(json["PVP8"]),
        iva: json["IVA"],
        size: double.parse(json["SIZE"]),
        unitPerBox: double.parse(json["UNIT_PER_BOX"]),
        disc1Max: double.parse(json["DISC1_MAX"]),
        disc2Max: double.parse(json["DISC2_MAX"]),
        disc3Max: double.parse(json["DISC3_MAX"]),
        sellingUnit: json["SELLING_UNIT"] == null ? null : json["SELLING_UNIT"],
        priceMin: double.parse(json["PRICE_MIN"]),
        disc1Table: double.parse(json["DISC1_TABLE"]),
        disc2Table: double.parse(json["DISC2_TABLE"]),
        disc3Table: double.parse(json["DISC3_TABLE"]),
        disc4Table: double.parse(json["DISC4_TABLE"]),
        disc5Table: double.parse(json["DISC5_TABLE"]),
        disc6Table: double.parse(json["DISC6_TABLE"]),
        disc7Table: double.parse(json["DISC7_TABLE"]),
        disc8Table: double.parse(json["DISC8_TABLE"]),
        url: json["URL"],
        editName: int.parse(json["EDIT_NAME"]),
        syncOk: int.parse(json["SYNC_OK"] ?? '0'),
        managesStock: int.parse(json["MANAGES_STOCK"]),
        sellNegativeStock: int.parse(json["SELL_NEGATIVE_STOCK"]),
        isContainer: int.parse(json["IS_CONTAINER"]),
        grossWeight: double.parse(json["GROSS_WEIGHT"]),
        netWeight: double.parse(json["NET_WEIGHT"]),
        imageFile: json["IMAGE_FILE"],
        htmlDetails: json["HTML_DETAILS"],
        variation: json["VARIATION"],
        isSogenave: int.parse(json["IS_SOGENAVE"]),
        providerCode: json["PROVIDER_CODE"],
        convBoxes: int.parse(json["CONV_BOXES"]),
        buyingUnit: json["BUYING_UNIT"],
        iabaSell: double.parse(json["IABA_SELL"]),
        membersprice: json["MEMBERSPRICE"],
        isReduction: json["IS_REDUCTION"],
        pvp1Iva: double.parse(json["PVP1_IVA"] ?? '0'),
        pvp2Iva: double.parse(json["PVP2_IVA"] ?? '0'),
        pvp3Iva: double.parse(json["PVP3_IVA"] ?? '0'),
        pvp4Iva: double.parse(json["PVP4_IVA"] ?? '0'),
        pvp5Iva: double.parse(json["PVP5_IVA"] ?? '0'),
        pvp6Iva: double.parse(json["PVP6_IVA"] ?? '0'),
        pvp7Iva: double.parse(json["PVP7_IVA"] ?? '0'),
        pvp8Iva: double.parse(json["PVP8_IVA"] ?? '0'),
        controlaLote: int.parse(json["CONTROLA_LOTE"]),
        rastreabilidade: int.parse(json["RASTREABILIDADE"]),
        defprod1: json["DEFPROD1"],
        defprod2: json["DEFPROD2"],
        unidadeCap: json["UNIDADE_CAP"],
        casasDecimaisQtd: int.parse(json["CASAS_DECIMAIS_QTD"]),
        produzSoComEncomenda: int.parse(json["PRODUZ_SO_COM_ENCOMENDA"] ?? '0'),
        name2: json["NAME2"],
      );

  factory Product.fromMapFromDb(Map<String, dynamic> json) => Product(
        posProductsId: json["POS_PRODUCTS_ID"],
        salesupId: json["SALESUP_ID"],
        code: json["CODE"],
        name: json["NAME"] == null ? null : json["NAME"],
        slogan: json["SLOGAN"] == null ? null : json["SLOGAN"],
        codseg1: json["CODSEG1"],
        codseg2: json["CODSEG2"],
        codseg3: json["CODSEG3"],
        codseg4: json["CODSEG4"],
        codseg5: json["CODSEG5"],
        codseg6: json["CODSEG6"],
        pvp1: json["PVP1"],
        pvp2: json["PVP2"],
        pvp3: json["PVP3"],
        pvp4: json["PVP4"],
        pvp5: json["PVP5"],
        pvp6: json["PVP6"],
        pvp7: json["PVP7"],
        pvp8: json["PVP8"],
        iva: json["IVA"],
        size: json["SIZE"],
        unitPerBox: json["UNIT_PER_BOX"],
        disc1Max: json["DISC1_MAX"],
        disc2Max: json["DISC2_MAX"],
        disc3Max: json["DISC3_MAX"],
        sellingUnit: json["SELLING_UNIT"] == null ? null : json["SELLING_UNIT"],
        priceMin: json["PRICE_MIN"],
        disc1Table: json["DISC1_TABLE"],
        disc2Table: json["DISC2_TABLE"],
        disc3Table: json["DISC3_TABLE"],
        disc4Table: json["DISC4_TABLE"],
        disc5Table: json["DISC5_TABLE"],
        disc6Table: json["DISC6_TABLE"],
        disc7Table: json["DISC7_TABLE"],
        disc8Table: json["DISC8_TABLE"],
        url: json["URL"],
        editName: json["EDIT_NAME"],
        syncOk: json["SYNC_OK"],
        managesStock: json["MANAGES_STOCK"],
        sellNegativeStock: json["SELL_NEGATIVE_STOCK"],
        isContainer: json["IS_CONTAINER"],
        grossWeight: json["GROSS_WEIGHT"],
        netWeight: json["NET_WEIGHT"],
        imageFile: json["IMAGE_FILE"],
        htmlDetails: json["HTML_DETAILS"],
        variation: json["VARIATION"],
        isSogenave: json["IS_SOGENAVE"],
        providerCode: json["PROVIDER_CODE"],
        convBoxes: json["CONV_BOXES"],
        buyingUnit: json["BUYING_UNIT"],
        iabaSell: json["IABA_SELL"],
        membersprice: json["MEMBERSPRICE"],
        isReduction: json["IS_REDUCTION"],
        pvp1Iva: json["PVP1_IVA"],
        pvp2Iva: json["PVP2_IVA"],
        pvp3Iva: json["PVP3_IVA"],
        pvp4Iva: json["PVP4_IVA"],
        pvp5Iva: json["PVP5_IVA"],
        pvp6Iva: json["PVP6_IVA"],
        pvp7Iva: json["PVP7_IVA"],
        pvp8Iva: json["PVP8_IVA"],
        controlaLote: json["CONTROLA_LOTE"],
        rastreabilidade: json["RASTREABILIDADE"],
        defprod1: json["DEFPROD1"],
        defprod2: json["DEFPROD2"],
        unidadeCap: json["UNIDADE_CAP"],
        casasDecimaisQtd: json["CASAS_DECIMAIS_QTD"],
        produzSoComEncomenda: json["PRODUZ_SO_COM_ENCOMENDA"],
        name2: json["NAME2"],
      );

  Map<String, dynamic> toMap() => {
        "POS_PRODUCTS_ID": posProductsId,
        "SALESUP_ID": salesupId,
        "CODE": code,
        "NAME": name == null ? null : name,
        "SLOGAN": slogan == null ? null : slogan,
        "CODSEG1": codseg1,
        "CODSEG2": codseg2,
        "CODSEG3": codseg3,
        "CODSEG4": codseg4,
        "CODSEG5": codseg5,
        "CODSEG6": codseg6,
        "PVP1": pvp1,
        "PVP2": pvp2,
        "PVP3": pvp3,
        "PVP4": pvp4,
        "PVP5": pvp5,
        "PVP6": pvp6,
        "PVP7": pvp7,
        "PVP8": pvp8,
        "IVA": iva,
        "SIZE": size,
        "UNIT_PER_BOX": unitPerBox,
        "DISC1_MAX": disc1Max,
        "DISC2_MAX": disc2Max,
        "DISC3_MAX": disc3Max,
        "SELLING_UNIT": sellingUnit,
        "PRICE_MIN": priceMin,
        "DISC1_TABLE": disc1Table,
        "DISC2_TABLE": disc2Table,
        "DISC3_TABLE": disc3Table,
        "DISC4_TABLE": disc4Table,
        "DISC5_TABLE": disc5Table,
        "DISC6_TABLE": disc6Table,
        "DISC7_TABLE": disc7Table,
        "DISC8_TABLE": disc8Table,
        "URL": url,
        "EDIT_NAME": editName,
        "SYNC_OK": syncOk,
        "MANAGES_STOCK": managesStock,
        "SELL_NEGATIVE_STOCK": sellNegativeStock,
        "IS_CONTAINER": isContainer,
        "GROSS_WEIGHT": grossWeight,
        "NET_WEIGHT": netWeight,
        "IMAGE_FILE": imageFile,
        "HTML_DETAILS": htmlDetails,
        "VARIATION": variation,
        "IS_SOGENAVE": isSogenave,
        "PROVIDER_CODE": providerCode,
        "CONV_BOXES": convBoxes,
        "BUYING_UNIT": buyingUnit,
        "IABA_SELL": iabaSell,
        "MEMBERSPRICE": membersprice,
        "IS_REDUCTION": isReduction,
        "PVP1_IVA": pvp1Iva,
        "PVP2_IVA": pvp2Iva,
        "PVP3_IVA": pvp3Iva,
        "PVP4_IVA": pvp4Iva,
        "PVP5_IVA": pvp5Iva,
        "PVP6_IVA": pvp6Iva,
        "PVP7_IVA": pvp7Iva,
        "PVP8_IVA": pvp8Iva,
        "CONTROLA_LOTE": controlaLote,
        "RASTREABILIDADE": rastreabilidade,
        "DEFPROD1": defprod1,
        "DEFPROD2": defprod2,
        "UNIDADE_CAP": unidadeCap,
        "CASAS_DECIMAIS_QTD": casasDecimaisQtd,
        "PRODUZ_SO_COM_ENCOMENDA": produzSoComEncomenda,
        "NAME2": name2,
      };
}
