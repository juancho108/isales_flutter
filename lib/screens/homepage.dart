import 'package:agenda/screens/customer_list_view.dart';
import 'package:flutter/material.dart';
import '../components/mycolors.dart' as c;
import 'dart:math' as math;

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              TopHomePage(size: size),
              TextButton(
                style: TextButton.styleFrom(
                    backgroundColor: Colors.blue.shade700,
                    textStyle: TextStyle(color: Colors.white),
                    padding: const EdgeInsets.all(8.0)),
                onPressed: () {
                  Navigator.pushNamed(context, 'licence');
                },
                child: new Text(
                  "Licence",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Container(
                        child: const Text(
                          'Bem Vindo Felipe',
                          style: TextStyle(
                            fontSize: 25,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const CustomerList(),
                          ),
                        );
                      },
                      child: Container(
                        width: size.width * .90,
                        height: size.height / 5 + 20,
                        color: c.myPrimaryColor,
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Clientes',
                                style: TextStyle(
                                    color: c.myTextColor.withOpacity(0.9),
                                    fontSize: 20),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  Text(
                                    'Clientes',
                                    style: TextStyle(
                                        color: c.myTextColor.withOpacity(0.7),
                                        fontSize: 16),
                                  ),
                                  const Spacer(),
                                  Text(
                                    '235',
                                    style: TextStyle(
                                        color: c.myTextColor.withOpacity(0.8),
                                        fontSize: 16),
                                  ),
                                ],
                              ),
                              const Spacer(),
                              Transform(
                                alignment: Alignment.center,
                                transform: Matrix4.rotationY(math.pi),
                                child: Icon(
                                  Icons.supervisor_account,
                                  color: c.myTextColor.withOpacity(0.9),
                                  size: 28,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: size.height * .015),
                    // oportunidades, finalizar
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const HomePage(),
                          ),
                        );
                      },
                      child: Container(
                        width: size.width * .90,
                        height: size.height / 5 + 20,
                        color: c.myPrimaryColor,
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Oportunidades',
                                style: TextStyle(
                                    color: c.myTextColor.withOpacity(0.9),
                                    fontSize: 20),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  Text(
                                    'Oportunidades',
                                    style: TextStyle(
                                        color: c.myTextColor.withOpacity(0.7),
                                        fontSize: 16),
                                  ),
                                  const Spacer(),
                                  Text(
                                    '89',
                                    style: TextStyle(
                                        color: c.myTextColor.withOpacity(0.8),
                                        fontSize: 16),
                                  ),
                                ],
                              ),
                              const Spacer(),
                              Transform(
                                alignment: Alignment.center,
                                transform: Matrix4.rotationY(math.pi),
                                child: Icon(
                                  Icons.pie_chart_outlined,
                                  color: c.myTextColor.withOpacity(0.9),
                                  size: 28,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: size.height * .015),
                    // produtos, finalizar
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const HomePage(),
                          ),
                        );
                      },
                      child: Container(
                        width: size.width * .90,
                        height: size.height / 5 + 20,
                        color: c.myPrimaryColor,
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Produtos',
                                style: TextStyle(
                                    color: c.myTextColor.withOpacity(0.9),
                                    fontSize: 20),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  Text(
                                    'Produtos',
                                    style: TextStyle(
                                        color: c.myTextColor.withOpacity(0.7),
                                        fontSize: 16),
                                  ),
                                  const Spacer(),
                                  Text(
                                    '1245',
                                    style: TextStyle(
                                        color: c.myTextColor.withOpacity(0.8),
                                        fontSize: 16),
                                  ),
                                ],
                              ),
                              const Spacer(),
                              Icon(
                                Icons.pages_rounded,
                                color: c.myTextColor.withOpacity(0.9),
                                size: 28,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: size.height * .015),
                    // calendario, finalizar
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const HomePage(),
                          ),
                        );
                      },
                      child: Container(
                        width: size.width * .90,
                        height: size.height / 5 + 20,
                        color: c.myPrimaryColor,
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Agenda',
                                style: TextStyle(
                                    color: c.myTextColor.withOpacity(0.9),
                                    fontSize: 20),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  Text(
                                    'Compromissos',
                                    style: TextStyle(
                                        color: c.myTextColor.withOpacity(0.7),
                                        fontSize: 16),
                                  ),
                                  const Spacer(),
                                  Text(
                                    '75',
                                    style: TextStyle(
                                        color: c.myTextColor.withOpacity(0.8),
                                        fontSize: 16),
                                  ),
                                ],
                              ),
                              const Spacer(),
                              Icon(
                                Icons.calendar_today_rounded,
                                color: c.myTextColor.withOpacity(0.9),
                                size: 28,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: size.height * .015),
                    // atividades, finalizar
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const HomePage(),
                          ),
                        );
                      },
                      child: Container(
                        width: size.width * .90,
                        height: size.height / 5 + 20,
                        color: c.myPrimaryColor,
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Atividades',
                                style: TextStyle(
                                    color: c.myTextColor.withOpacity(0.9),
                                    fontSize: 20),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  Text(
                                    'Total de atividades',
                                    style: TextStyle(
                                        color: c.myTextColor.withOpacity(0.7),
                                        fontSize: 16),
                                  ),
                                  const Spacer(),
                                  Text(
                                    '135',
                                    style: TextStyle(
                                        color: c.myTextColor.withOpacity(0.8),
                                        fontSize: 16),
                                  ),
                                ],
                              ),
                              const Spacer(),
                              Transform(
                                alignment: Alignment.center,
                                transform: Matrix4.rotationY(math.pi),
                                child: Icon(
                                  Icons.checklist_sharp,
                                  color: c.myTextColor.withOpacity(0.9),
                                  size: 28,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: size.height * .015),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class TopHomePage extends StatelessWidget {
  const TopHomePage({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 8,
        left: 8,
        right: 8,
      ),
      child: Container(
        width: size.width,
        height: size.height / 5 - 25,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: size.width * .8,
              height: size.height * .09,
              child: const Text(
                'iSales',
                style: TextStyle(fontSize: 45),
              ),
            ),
            Container(
              width: size.width * .95,
              height: size.height * .009,
              color: c.myPrimaryColor,
            ),
          ],
        ),
      ),
    );
  }
}
