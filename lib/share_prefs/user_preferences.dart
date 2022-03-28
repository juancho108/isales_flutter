import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
/*   inicia singleton */
  static final UserPreferences _instancia = new UserPreferences._internal();

  factory UserPreferences() {
    return _instancia;
  }

  UserPreferences._internal();
/*   finaliza  singleton */

  late SharedPreferences _prefs;

  initPrefs() async {
    _prefs = await SharedPreferences.getInstance();
  }

  String get domain {
    return _prefs.getString('domain') ?? "";
  }

  set domain(String value) {
    _prefs.setString('domain', value);
  }

  String get licence {
    return _prefs.getString('licence') ?? "";
  }

  set licence(String value) {
    _prefs.setString('licence', value);
  }

  String get accessKey {
    return _prefs.getString('accessKey') ?? "";
  }

  set accessKey(String value) {
    _prefs.setString('accessKey', value);
  }

  String get user {
    return _prefs.getString('user') ?? "";
  }

  set user(String value) {
    _prefs.setString('user', value);
  }

  String get password {
    return _prefs.getString('password') ?? "";
  }

  set password(String value) {
    _prefs.setString('password', value);
  }

  int get id_operador {
    return _prefs.getInt('id_operador') ?? 0;
  }

  set id_operador(int value) {
    _prefs.setInt('id_operador', value);
  }

  bool get remember {
    return _prefs.getBool('remember') ?? false;
  }

  set remember(bool value) {
    _prefs.setBool('remember', value);
  }

  String get name {
    return _prefs.getString('name') ?? "Cris";
  }

  set name(String value) {
    _prefs.setString('name', value);
  }

  String get department {
    return _prefs.getString('department') ?? "Software Development";
  }

  set department(String value) {
    _prefs.setString('department', value);
  }

  String get email {
    return _prefs.getString('email') ?? "Denis.Alves@betertech.com.pt";
  }

  set email(String value) {
    _prefs.setString('email', value);
  }

  int get lastTaskOpened {
    return _prefs.getInt('lastTaskOpened') ?? 0;
  }

  set lastTaskOpened(int value) {
    _prefs.setInt('lastTaskOpened', value);
  }

  bool get configured {
    return _prefs.getBool('configured') ?? false;
  }

  set configured(bool value) {
    _prefs.setBool('configured', value);
  }

  String get lastSync {
    return _prefs.getString('lastSync') ?? "--";
  }

  set lastSync(String value) {
    _prefs.setString('lastSync', value);
  }

  int get lastListOpened {
    return _prefs.getInt('lastListOpened') ?? 0;
  }

  set lastListOpened(int value) {
    _prefs.setInt('lastListOpened', value);
  }

  String get fotoOnline {
    return _prefs.getString('fotoOnline') ??
        'https://www.tcatcapacitaciontecnica.com/wp-content/uploads/2020/02/image.ashx_.png';
  }

  set fotoOnline(String value) {
    _prefs.setString('fotoOnline', value);
  }

  String get fotoLocal {
    return _prefs.getString('fotoLocal') ?? '';
  }

  set fotoLocal(String value) {
    _prefs.setString('fotoLocal', value);
  }

  bool get fotoLocalBit {
    return _prefs.getBool('fotoLocalBit') ?? false;
  }

  set fotoLocalBit(bool value) {
    _prefs.setBool('fotoLocalBit', value);
  }
}
