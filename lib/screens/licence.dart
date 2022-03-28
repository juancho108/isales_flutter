import 'dart:io';

import 'package:agenda/share_prefs/user_preferences.dart';
import 'package:agenda/webservices/webservicemanager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:device_info/device_info.dart';

class LicencePage extends StatefulWidget {
  @override
  LicencePageState createState() => LicencePageState();
}

class LicencePageState extends State<LicencePage> {
  final licenceField = TextEditingController();
  final acessKeyField = TextEditingController();
  final operatorNameField = TextEditingController();
  final operatorCodeField = TextEditingController();
  final operatorPasswordField = TextEditingController();
  final operatorMailField = TextEditingController();
  final operatorPhoneField = TextEditingController();
  final prefs = new UserPreferences();

  final GlobalKey<State> _keyLoader = new GlobalKey<State>();
  final GlobalKey<State> _keyLoader2 = new GlobalKey<State>();
  final GlobalKey<FormState> _keyFormWitLicence = new GlobalKey<FormState>();
  final GlobalKey<FormState> _keyFormWithoutLicence =
      new GlobalKey<FormState>();

  bool remember = false;
  String user = '';
  String password = '';

  final requiredValidator =
      RequiredValidator(errorText: 'Este campo é obrigatório');

  @override
  void initState() {
    licenceField.text = 'D010';
    acessKeyField.text = 'flutterotm-dev';

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Licença'),
          centerTitle: true,
          backgroundColor: Colors.blue.shade700,
          // toolbarHeight: 20,
          bottom: TabBar(
            padding: EdgeInsets.all(10),
            labelColor: Colors.white,
            indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(50), // Creates border
              color: Colors.white30,
            ),
            tabs: [
              Tab(
                text: 'Já Tenho licença',
                // icon: Icon(Icons.directions_car),
              ),
              Tab(
                text: 'Solicitar Licença',

                // icon: Icon(Icons.directions_transit),
              ),
            ],
          ),
        ),
        body: TabBarView(children: [
          showWithLicence(context),
          showWithoutLicence(context),
        ]),
      ),
    );
  }

  Container showWithLicence(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      color: Colors.blue.shade700,
      padding: EdgeInsets.symmetric(horizontal: 46.0),
      child: Align(
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Form(
            autovalidateMode: AutovalidateMode.always,
            key: _keyFormWitLicence,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 20.0),
                _showLogo(),
                _showName(),
                SizedBox(height: 20.0),
                _showMessage(),
                SizedBox(height: 40.0),
                _showLicence(),
                SizedBox(height: 10.0),
                _showAcessKey(),
                SizedBox(height: 30.0),
                _showButtonLoginWithLicence(context),
                SizedBox(height: 10.0),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container showWithoutLicence(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      color: Colors.blue.shade700,
      padding: EdgeInsets.symmetric(horizontal: 46.0),
      child: Align(
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Form(
            autovalidateMode: AutovalidateMode.always,
            key: _keyFormWithoutLicence,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 20.0),
                _showLogo(),
                _showName(),
                SizedBox(height: 20.0),
                _showMessage(),
                SizedBox(height: 40.0),
                /*INICIO DO FORMULARIO*/
                _showLicence(),
                SizedBox(height: 10.0),
                _showAcessKey(),
                SizedBox(height: 10.0),
                _showOperatorName(),
                SizedBox(height: 10.0),
                _showOperatorCode(),
                SizedBox(height: 10.0),
                _showOperatorPassword(),
                SizedBox(height: 10.0),
                _showOperatorMail(),
                SizedBox(height: 10.0),
                _showOperatorPhone(),
                SizedBox(height: 10.0),
                _showButtonLoginWithoutLicence(context),
                SizedBox(height: 10.0),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Padding _showButtonLoginWithLicence(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 80.0),
      child: TextButton(
        style: TextButton.styleFrom(
          primary: Colors.blue.shade700,
          backgroundColor: Colors.white,
        ),
        onPressed: () async {
          gatherInformation();
        },
        child: new Text("ENVIAR"),
      ),
    );
  }

  Padding _showButtonLoginWithoutLicence(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 80.0),
      child: TextButton(
        style: TextButton.styleFrom(
          primary: Colors.blue.shade700,
          backgroundColor: Colors.white,
        ),
        onPressed: () {
          validateFormAndRequestLicence();
        },
        child: new Text("ENVIAR"),
      ),
    );
  }

  TextFormField _showLicence() {
    return TextFormField(
      controller: licenceField,
      cursorColor: Colors.white,
      validator: requiredValidator,
      decoration: _inputDecoration('Licença'),
      style: TextStyle(color: Colors.white),
    );
  }

  TextFormField _showAcessKey() {
    return TextFormField(
      controller: acessKeyField,
      validator: requiredValidator,
      cursorColor: Colors.white,
      decoration: _inputDecoration('Chave de Acesso'),
      style: TextStyle(color: Colors.white),
    );
  }

  TextFormField _showOperatorName() {
    return TextFormField(
      controller: operatorNameField,
      validator: requiredValidator,
      cursorColor: Colors.white,
      decoration: _inputDecoration('Nome Operador'),
      style: TextStyle(color: Colors.white),
    );
  }

  TextFormField _showOperatorCode() {
    return TextFormField(
      controller: operatorCodeField,
      validator: requiredValidator,
      cursorColor: Colors.white,
      decoration: _inputDecoration('Cod. Operador'),
      style: TextStyle(color: Colors.white),
    );
  }

  TextFormField _showOperatorPassword() {
    return TextFormField(
      controller: operatorPasswordField,
      validator: requiredValidator,
      cursorColor: Colors.white,
      keyboardType: TextInputType.visiblePassword,
      decoration: _inputDecoration('Password'),
      style: TextStyle(color: Colors.white),
    );
  }

  TextFormField _showOperatorMail() {
    return TextFormField(
      controller: operatorMailField,
      validator: MultiValidator(
          [requiredValidator, EmailValidator(errorText: 'Email Inválido')]),
      cursorColor: Colors.white,
      keyboardType: TextInputType.emailAddress,
      decoration: _inputDecoration('Email'),
      style: TextStyle(color: Colors.white),
    );
  }

  TextFormField _showOperatorPhone() {
    return TextFormField(
      controller: operatorPhoneField,
      validator: requiredValidator,
      cursorColor: Colors.white,
      keyboardType: TextInputType.number,
      decoration: _inputDecoration('Telefone'),
      style: TextStyle(color: Colors.white),
    );
  }

  InputDecoration _inputDecoration(String text) {
    return InputDecoration(
        labelStyle: TextStyle(color: Colors.white),
        border: OutlineInputBorder(),
        enabledBorder: const OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white, width: 1.0),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.green, width: 1.0),
        ),
        labelText: text,
        errorStyle: TextStyle(color: Colors.red.shade200),
        errorBorder: const OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red, width: 1.0),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red, width: 1.0),
        ));
  }

  Text _showName() {
    return Text(
      "iSales OTM",
      textAlign: TextAlign.center,
      style: TextStyle(
          fontWeight: FontWeight.bold, fontSize: 30.0, color: Colors.white),
    );
  }

  Text _showMessage() {
    return Text(
      "Por favor, insira os seguintes campos com os dados referentes à sua empresa.",
      textAlign: TextAlign.center,
      style: TextStyle(
          fontWeight: FontWeight.bold, fontSize: 16.0, color: Colors.white),
    );
  }

  Container _showLogo() {
    return Container(
      child: SvgPicture.asset(
        'assets/icons/myteam.svg',
        height: 100,
        width: 100,
        color: Colors.white,
      ),
    );
  }

  static Future<void> showLoadingDialog(
      BuildContext context, GlobalKey key, String message) async {
    return showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return new WillPopScope(
              onWillPop: () async => false,
              child: SimpleDialog(
                  key: key,
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(),
                  children: <Widget>[
                    Center(
                      child: Column(children: [
                        CircularProgressIndicator(),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          message,
                          style: TextStyle(color: Colors.black),
                        )
                      ]),
                    )
                  ]));
        });
  }

  gatherInformation() async {
    if (!_keyFormWitLicence.currentState!.validate()) {
      return showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              // Retrieve the text the user has entered by using the
              // TextEditingController.
              content: Text("Por favor valide os campos"),
              actions: <Widget>[
                TextButton(
                  style: TextButton.styleFrom(
                      primary: Colors.white,
                      backgroundColor: Colors.blue.shade700),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: new Text("OK"),
                ),
              ],
            );
          });
    }

    showLoadingDialog(context, _keyLoader,
        'A validar os dados da licença,\naguarde por favor...');

    prefs.licence = licenceField.text.trim();
    String accessKey = acessKeyField.text.trim();

    dynamic response =
        await WebServiceManager().validateLicence(prefs.licence, accessKey);

    Navigator.of(_keyLoader.currentContext!).pop();

    responseFromLicence(response, accessKey);
  }

  responseFromLicence(dynamic response, String accessKey) async {
    if (response == null ||
        response['Licence_API_Mobile_Configuration'] == null ||
        response['Licence_API_Mobile_Configuration']['Error'] == null ||
        (response['Licence_API_Mobile_Configuration']['Error'] != '0' &&
            response['Licence_API_Mobile_Configuration']['Message'] == null)) {
      return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            // Retrieve the text the user has entered by using the
            // TextEditingController.
            content: Text(
                "Erro ao verificar a licença.\nPor favor, tente novamente."),
            actions: <Widget>[
              FlatButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    } else if (response['Licence_API_Mobile_Configuration']['Error'] == '-1') {
      return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            // Retrieve the text the user has entered by using the
            // TextEditingController.
            content: Text(
                //"Erro: " + response['ServiceReturnValidOperator']['Message']),
                "Licença inválida."),
            actions: <Widget>[
              TextButton(
                style: TextButton.styleFrom(
                    primary: Colors.white,
                    backgroundColor: Colors.blue.shade700),
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: new Text("OK"),
              ),
            ],
          );
        },
      );
    } else if (response['Licence_API_Mobile_Configuration']['Error'] != '0') {
      return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            // Retrieve the text the user has entered by using the
            // TextEditingController.
            content: Text(
                //"Erro: " + response['ServiceReturnValidOperator']['Message']),
                response['Licence_API_Mobile_Configuration']['Message']),
            actions: <Widget>[
              TextButton(
                style: TextButton.styleFrom(
                    primary: Colors.white,
                    backgroundColor: Colors.blue.shade700),
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: new Text("OK"),
              ),
            ],
          );
        },
      );
    }

    //Login válido
    prefs.domain = response['Licence_API_Mobile_Configuration']['Domain'];
    prefs.accessKey = response['Licence_API_Mobile_Configuration']['AccessKey'];

    print(prefs.domain);
    print(prefs.accessKey);

    showLoadingDialog(context, _keyLoader2,
        'A validar a chave de acesso,\naguarde por favor...');

    dynamic response2 = await WebServiceManager().validateMobileKey(accessKey);

    Navigator.of(_keyLoader2.currentContext!).pop();

    // return responseFromAccessKey(response2);

    return Navigator.pushNamedAndRemoveUntil(
        context, 'login', (route) => false);
  }

  responseFromAccessKey(dynamic response) async {
    if (response == null ||
        response['ServiceReturn'] == null ||
        response['ServiceReturn']['Error'] == null ||
        (response['ServiceReturn']['Error'] != '0' &&
            response['ServiceReturn']['Message'] == null)) {
      return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            // Retrieve the text the user has entered by using the
            // TextEditingController.
            content: Text(
                "Erro ao verificar a chave de acesso.\nPor favor, tente novamente."),
            actions: <Widget>[
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    } else if (response['ServiceReturn']['Error'] != '0') {
      return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            // Retrieve the text the user has entered by using the
            // TextEditingController.
            content: Text(response['ServiceReturn']['Message']),
            actions: <Widget>[
              TextButton(
                style: TextButton.styleFrom(
                    primary: Colors.white,
                    backgroundColor: Colors.blue.shade700),
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: new Text("OK"),
              ),
            ],
          );
        },
      );
    }

    //Login válido
    // prefs.domain = response['ServiceReturn']['Domain'];
    // prefs.accessKey = response['ServiceReturn']['AccessKey'];
    // prefs.configured = true;

    Navigator.of(_keyLoader2.currentContext!).pop();

    // Navigator.of(context).pop();

    //return Navigator.pushNamed(context, 'login');
    // Navigator.of(context).pushNamed('login');
    return Navigator.pushNamedAndRemoveUntil(
        context, 'login', (route) => false);
    // print('estaria indo para o Login');
  }

  void validateFormAndRequestLicence() async {
    if (!_keyFormWithoutLicence.currentState!.validate()) {
      return showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: const Text("Por favor valide os campos"),
              actions: <Widget>[
                TextButton(
                  style: TextButton.styleFrom(
                      primary: Colors.white,
                      backgroundColor: Colors.blue.shade700),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text("OK"),
                ),
              ],
            );
          });
    }

    // showLoadingDialog(context, _keyLoader,'A validar os dados da licença,\naguarde por favor...');

    String licence = licenceField.text.trim();
    String acessKey = acessKeyField.text.trim();
    String operatorName = operatorNameField.text.trim();
    String operatorCode = operatorCodeField.text.trim();
    String operatorPassword = operatorPasswordField.text.trim();
    String operatorMail = operatorMailField.text.trim();
    String operatorPhone = operatorPhoneField.text.trim();

    dynamic response = await WebServiceManager().requestLicence(
        licence,
        acessKey,
        operatorName,
        operatorCode,
        operatorPassword,
        operatorMail,
        operatorPhone);
  }
}
