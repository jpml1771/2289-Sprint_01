import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

Map<int, Color> color = {
  50: Color.fromRGBO(136, 14, 79, .1),
  100: Color.fromRGBO(136, 14, 79, .2),
  200: Color.fromRGBO(136, 14, 79, .3),
  300: Color.fromRGBO(136, 14, 79, .4),
  400: Color.fromRGBO(136, 14, 79, .5),
  500: Color.fromRGBO(136, 14, 79, .6),
  600: Color.fromRGBO(136, 14, 79, .7),
  700: Color.fromRGBO(136, 14, 79, .8),
  800: Color.fromRGBO(136, 14, 79, .9),
  900: Color.fromRGBO(136, 14, 79, 1),
};

MaterialColor colorCustom = MaterialColor(0xFF880E4F, color);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sprint 1',
      theme: ThemeData(
        primarySwatch: colorCustom,
        bottomAppBarColor: colorCustom,
      ),
      home: const MyHomePage(title: 'Currency Coverter'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class objects {
  final number;
  final icon;
  final color;

  objects(this.number, this.icon, this.color);
}

List<objects> o_l = <objects>[
  objects("1", Icon(Icons.numbers), colorCustom),
  objects("2", Icon(Icons.numbers), colorCustom),
  objects("3", Icon(Icons.numbers), colorCustom),
  objects("4", Icon(Icons.numbers), colorCustom),
  objects("5", Icon(Icons.numbers), colorCustom),
  objects("6", Icon(Icons.numbers), colorCustom),
  objects("7", Icon(Icons.numbers), colorCustom),
  objects("8", Icon(Icons.numbers), colorCustom),
  objects("9", Icon(Icons.numbers), colorCustom),
  objects("0", Icon(Icons.numbers), colorCustom),
  objects(".", Icon(Icons.numbers), colorCustom),
  objects(
      "borrar",
      Icon(
        Icons.backspace,
        size: 40,
      ),
      Colors.black),
  objects(
      "=",
      Icon(
        Icons.calculate,
        size: 40,
      ),
      Colors.black),
  objects(
      "limpiar",
      Icon(
        Icons.cleaning_services,
        size: 40,
      ),
      Colors.black),
];

List<DropdownMenuItem<String>> currencies = <DropdownMenuItem<String>>[
  DropdownMenuItem(
    value: "USD",
    child: Text(
      "USD",
      style: TextStyle(fontSize: 25),
    ),
  ),
  DropdownMenuItem(
    value: "EUR",
    child: Text(
      "EUR",
      style: TextStyle(fontSize: 25),
    ),
  ),
  DropdownMenuItem(
    value: "COP",
    child: Text(
      "COP",
      style: TextStyle(fontSize: 25),
    ),
  ),
];

String op1 = "USD";
String op2 = "USD";

String v_origin = "";
String v_destiny = "";

double usd_eur = 0.99;
double usd_cop = 5091.76;
double eur_cop = 5083.37;

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            Container(
              child: Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                margin: EdgeInsets.fromLTRB(15, 0, 15, 5),
                child: Padding(
                  padding: EdgeInsets.all(15),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text('Moneda Origen'),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          DropdownButton(
                            value: op1,
                            items: currencies,
                            onChanged: (String? X) {
                              setState(() {
                                op1 = X!;
                              });
                            },
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            v_origin,
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            Container(
              child: Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                margin: EdgeInsets.fromLTRB(15, 5, 15, 15),
                child: Padding(
                  padding: EdgeInsets.all(15),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text('Moneda Destino'),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          DropdownButton(
                            value: op2,
                            items: currencies,
                            onChanged: (String? X) {
                              setState(() {
                                op2 = X!;
                              });
                            },
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            v_destiny,
                            style: TextStyle(fontSize: 20),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            Row(
              children: [
                SizedBox(
                  width: 40,
                ),
                Expanded(
                  child: GridView.builder(
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                    ),
                    itemCount: o_l.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: EdgeInsets.all(5),
                        child: ElevatedButton(
                          onPressed: () {
                            setState(
                              () {
                                if (o_l[index].number == "limpiar") {
                                  v_origin = "";
                                  v_destiny = "";
                                  print(v_origin);
                                  print(v_destiny);
                                } else if (o_l[index].number == "borrar") {
                                  v_origin = v_origin.substring(
                                      0, v_origin.length - 1);
                                  print(v_origin);
                                } else if (o_l[index].number == "=") {
                                  if (op1 == "USD" && op2 == "USD") {
                                    v_destiny =
                                        (double.parse(v_origin) / 1).toString();
                                    print(v_destiny);
                                  } else if (op1 == "USD" && op2 == "EUR") {
                                    v_destiny =
                                        (double.parse(v_origin) * usd_eur)
                                            .toString();
                                    print(v_destiny);
                                  } else if (op1 == "USD" && op2 == "COP") {
                                    v_destiny =
                                        (double.parse(v_origin) * usd_cop)
                                            .toString();
                                    print(v_destiny);
                                  } else if (op1 == "EUR" && op2 == "USD") {
                                    v_destiny =
                                        (double.parse(v_origin) / usd_eur)
                                            .toString();
                                    print(v_destiny);
                                  } else if (op1 == "EUR" && op2 == "EUR") {
                                    v_destiny =
                                        (double.parse(v_origin) / 1).toString();
                                  } else if (op1 == "EUR" && op2 == "COP") {
                                    v_destiny =
                                        (double.parse(v_origin) * eur_cop)
                                            .toString();
                                    print(v_destiny);
                                  } else if (op1 == "COP" && op2 == "USD") {
                                    v_destiny =
                                        (double.parse(v_origin) / usd_cop)
                                            .toString();
                                    print(v_destiny);
                                  } else if (op1 == "COP" && op2 == "EUR") {
                                    v_destiny =
                                        (double.parse(v_origin) / eur_cop)
                                            .toString();
                                    print(v_destiny);
                                  } else if (op1 == "COP" && op2 == "COP") {
                                    v_destiny =
                                        (double.parse(v_origin) / 1).toString();
                                    print(v_destiny);
                                  }
                                  ;
                                } else {
                                  v_origin = v_origin + o_l[index].number;
                                  print(v_origin);
                                }
                                ;
                              },
                            );
                          },
                          child: o_l[index].number == "="
                              ? Text(
                                  o_l[index].number,
                                  style: TextStyle(fontSize: 40),
                                )
                              : o_l[index].number == "limpiar"
                                  ? o_l[index].icon
                                  : o_l[index].number == "borrar"
                                      ? o_l[index].icon
                                      : Text(
                                          o_l[index].number,
                                          style: TextStyle(fontSize: 40),
                                        ),
                          style: ElevatedButton.styleFrom(
                            elevation: 2,
                            shape: CircleBorder(),
                            padding: EdgeInsets.all(20),
                            backgroundColor: o_l[index].color,
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(
                  width: 40,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
