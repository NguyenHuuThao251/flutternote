import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutternote/components/drop_down.dart';
import 'package:flutternote/model/api_client.dart';

class CurrencyConverter extends StatefulWidget {
  const CurrencyConverter({super.key});

  @override
  State<CurrencyConverter> createState() => _CurrencyConverterState();
}

class _CurrencyConverterState extends State<CurrencyConverter> {
  Color mainColor = Color(0xFF212936);
  Color secondColor = Color(0xFF2849E5);
  late List<String> currencies;
  String from = "";
  String to = "";

  late double rate;
  String result = "";
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    getCurrency();
  }

  Future<void> getCurrency() async {
    currencies = await ApiClient.getCurrencies();
    setState(() {
      _isLoading = false;
      from = currencies[0];
      to = currencies[0];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      body: _isLoading
          ? Center(
        child: CircularProgressIndicator(
          backgroundColor: Colors.black.withOpacity(0.1),
        ),
      )
          : SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(6.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white70, width: 1),
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.keyboard_backspace_rounded,
                      color: Colors.black,
                    )),
              ),
              Container(
                margin: const EdgeInsets.only(left: 20),
                width: 200,
                child: Text(
                  "Currency Converter",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 36,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        TextField(
                          onSubmitted: (value) async {
                            rate = await ApiClient.getRate(from, to);
                            setState(() {
                              result = (rate * double.parse(value)).toStringAsFixed(3);
                            });
                          },
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            labelText: "Input value to convert",
                            labelStyle: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 18.0,
                              color: secondColor,
                            ),
                          ),
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.number,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            customDropDown(currencies, from, (val) {
                              setState(() {
                                from = val;
                              });
                            }),
                            FloatingActionButton(
                              onPressed: () {},
                              child: Icon(Icons.swap_horiz),
                              elevation: 0.0,
                              backgroundColor: secondColor,
                            ),
                            customDropDown(currencies, to, (val) {
                              setState(() {
                                to = val;
                              });
                            }),

                          ],
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 20),
                          width: double.infinity,
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16)
                          ),
                          child: Column(
                            children: [
                              Text("Results", style: TextStyle(
                                color: Colors.black,
                                fontSize: 24.0,
                                fontWeight: FontWeight.bold
                              ),),
                              Text(result, style: TextStyle(
                                  color: secondColor,
                                  fontSize: 36.0,
                                  fontWeight: FontWeight.bold
                              ))
                            ],
                          ),
                        )
                      ],
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
