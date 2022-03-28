import 'package:agenda/data/db_provider.dart';
import 'package:agenda/data/load_db.dart';
import 'package:agenda/data/login_provider.dart';
import 'package:agenda/screens/homepage.dart';
import 'package:agenda/webservices/webservicemanager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:agenda/share_prefs/user_preferences.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

import 'licence.dart';

class LoginPage extends StatefulWidget {
  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  final usernameField = TextEditingController();
  final passwordField = TextEditingController();
  final prefs = UserPreferences();

  final GlobalKey<FormState> _keyForm = new GlobalKey<FormState>();

  final GlobalKey<State> _keyLoader = new GlobalKey<State>();
  final GlobalKey<State> _keyLoader2 = new GlobalKey<State>();

  bool remember = false;
  String user = '';
  String password = '';

  final requiredValidator =
      RequiredValidator(errorText: 'Este campo é obrigatório');

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    user = prefs.user;
    password = prefs.password;
    remember = prefs.remember;
    usernameField.text = user;
    passwordField.text = password;

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        color: Colors.blue.shade700,
        padding: EdgeInsets.symmetric(horizontal: 46.0),
        child: Align(
          alignment: Alignment.center,
          child: SingleChildScrollView(
            child: Form(
              autovalidateMode: AutovalidateMode.always,
              key: _keyForm,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  _showLogo(),
                  _showName(),
                  SizedBox(height: 40.0),
                  _showUsername(),
                  SizedBox(height: 10.0),
                  _showPassword(),
                  _showLembrar(context),
                  SizedBox(height: 30.0),
                  _showButtonLogin(context),
                  SizedBox(height: 30.0),
                  // _showResetButton()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  TextButton _showResetButton() {
    return TextButton(
      style: TextButton.styleFrom(
          backgroundColor: Colors.white,
          textStyle: TextStyle(color: Colors.blue),
          padding: const EdgeInsets.all(14.0)),
      onPressed: () {
        prefs.configured = false;
        print(prefs.configured);
      },
      child: new Text(
        "RESET",
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _showButtonLogin(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
          backgroundColor: Colors.white,
          textStyle: TextStyle(color: Colors.blue),
          padding: const EdgeInsets.all(14.0)),
      onPressed: () {
        // var loginProvider =
        //     Provider.of<LoginProvider>(context, listen: false);
        // loginProvider.login(usernameField.text, passwordField.text);
        // gatherInformation();
        // prefs.configured = false;

        // Navigator.pushNamed(context, 'licence');
        gatherInformation();
      },
      child: new Text(
        "LOGIN",
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
    );
    /*return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 80.0),
      child: Consumer<LoginProvider>(
        builder: (context, loginProvider, child) {
          if (loginProvider.isLoading) {
            return CircularProgressIndicator();
          }
          return child!;
        },
        child: TextButton(
          style: TextButton.styleFrom(
              backgroundColor: Colors.white,
              textStyle: TextStyle(color: Colors.blue),
              padding: const EdgeInsets.all(14.0)),
          onPressed: () {
            // var loginProvider =
            //     Provider.of<LoginProvider>(context, listen: false);
            // loginProvider.login(usernameField.text, passwordField.text);
            // gatherInformation();

            Navigator.pushNamed(context, 'home');
          },
          child: new Text(
            "LOGIN",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );*/
  }

  Padding _showLembrar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10.0),
      child: Row(
        children: <Widget>[
          Theme(
            data: Theme.of(context).copyWith(
              unselectedWidgetColor: Colors.white,
            ),
            child: Checkbox(
              value: remember,
              activeColor: Colors.white,
              checkColor: Colors.blue,

              //subtitle: new Text('Subtitle'),
              //secondary: new Icon(Icons.archive),
              onChanged: (bool? value) {
                setState(() {
                  remember = value!;
                });
              },
            ),
          ),
          new Text(
            "Lembrar",
            style:
                TextStyle(fontWeight: FontWeight.normal, color: Colors.white),
          ),
        ],
      ),
    );
  }

  TextFormField _showPassword() {
    return TextFormField(
      controller: passwordField,
      validator: requiredValidator,
      obscureText: true,
      cursorColor: Colors.white,
      decoration: _inputDecoration('Password'),
      style: TextStyle(color: Colors.white),
    );
  }

  TextFormField _showUsername() {
    return TextFormField(
      controller: usernameField,
      validator: requiredValidator,
      cursorColor: Colors.white,
      decoration: _inputDecoration('Username'),
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
    if (!_keyForm.currentState!.validate()) {
      return showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text("Por Favor valide os campos"),
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

    showLoadingDialog(
        context, _keyLoader, 'A validar operador,\naguarde por favor...');

    dynamic response = await WebServiceManager()
        .getOperatorData(usernameField.text.trim(), passwordField.text.trim());

    Navigator.of(_keyLoader.currentContext!).pop();

    responseFromOperator(response);
  }

  responseFromOperator(dynamic response) async {
    if (response == null ||
        response['ServiceReturnValidOperator'] == null ||
        response['ServiceReturnValidOperator']['Error'] == null ||
        (response['ServiceReturnValidOperator']['Error'] != '0' &&
            response['ServiceReturnValidOperator']['Message'] == null)) {
      return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            // Retrieve the text the user has entered by using the
            // TextEditingController.
            content:
                Text("Erro a verificar operador.\nPor favor, tente novamente."),
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
    } else if (response['ServiceReturnValidOperator']['Error'] == '2') {
      return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            // Retrieve the text the user has entered by using the
            // TextEditingController.
            content: Text(
                //"Erro: " + response['ServiceReturnValidOperator']['Message']),
                "Operador inserido inválido"),
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
    } else if (response['ServiceReturnValidOperator']['Error'] != '0') {
      return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            // Retrieve the text the user has entered by using the
            // TextEditingController.
            content: Text(
                //"Erro: " + response['ServiceReturnValidOperator']['Message']),
                response['ServiceReturnValidOperator']['Message']),
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
    } else {
      int userAtual = prefs.id_operador;
      bool sameUser = false;
      if (userAtual != 0 &&
          userAtual ==
              int.parse(
                  response['ServiceReturnValidOperator']['id_operador'])) {
        sameUser = true;
      }

      if (userAtual != 0 && !sameUser) {
        DbLite.db.deleteAllDatabase();
      }

      //Login válido
      prefs.user = response['ServiceReturnValidOperator']['user'];
      prefs.password = response['ServiceReturnValidOperator']['password'];
      prefs.id_operador =
          int.parse(response['ServiceReturnValidOperator']['id_operador']);
      prefs.remember = remember;
      prefs.name = response['ServiceReturnValidOperator']['name'];
      prefs.department =
          (response['ServiceReturnValidOperator']['department'] != null)
              ? response['ServiceReturnValidOperator']['department']
              : '';
      prefs.email = (response['ServiceReturnValidOperator']['email'] != null)
          ? response['ServiceReturnValidOperator']['email']
          : '';

      // List<Map> list = await DbLite.db.checkIfEmpty(sameUser);

      bool needLoad = false;

      // Navigator.of(context).pushNamed('home');

      // if (!sameUser)
      //   needLoad = true;
      // else {
      //   list[0].forEach((key, value) {
      //     if (value == 0) needLoad = true;
      //   });
      // }

      // if (needLoad)
      //   _loadData(context, _keyLoader);
      // else {
      //   return Navigator.of(context)
      //       .push(MaterialPageRoute(builder: (context) => HomePage()));
      // }
      // DbLite.db.deleteAllDatabase();
      _loadData(context, _keyLoader2);
    }
  }

  _loadData(BuildContext context, GlobalKey _key) {
    showLoadingDialog(
        context, _key, "Sincronizando dados,\naguarde por favor...");
    LoadDB.downloadDb().then((a) {
      prefs.lastSync =
          DateFormat('dd-MMM HH:mm').format(DateTime.now()).toString();
      setState(() {});
      Navigator.of(_key.currentContext!).pop();
      return Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => HomePage()));
    });
  }
}
