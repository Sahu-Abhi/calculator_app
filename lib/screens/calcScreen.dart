import 'package:calculator/components/roundButtonWithIcon.dart';
import 'package:flutter/material.dart';
import 'package:calculator/components/roundButtonWithCircularIcon.dart';
import 'package:math_expressions/math_expressions.dart';

class CalcScreen extends StatefulWidget {
  const CalcScreen({super.key});

  @override
  State<CalcScreen> createState() => _CalcScreenState();
}

class _CalcScreenState extends State<CalcScreen> {
  final TextEditingController _calculatorText = TextEditingController();
  String ans = '';
  String inputSymbol = '';
  bool isShiftOn = false;

  void deleteOneElement() {
    String text = _calculatorText.text;
    if (text.isNotEmpty) {
      int endIndex = text.length - 1;
      String updatedText = text.substring(0, endIndex);
      _calculatorText.text = updatedText;
    }
    ans = '';
  }

  void insertIntoTextField(String value) {
    setState(() {
      inputSymbol += value;
    });
  }

  void clearTextField() {
    setState(() {
      _calculatorText.clear();
      ans = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(color: Color(0XFFC5C4C4)),
          ),
          Column(
            children: [
              // Calculator Screen
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(15),
                  color: const Color(0xFF161616),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3),
                          border: Border.all(
                              color: isShiftOn
                                  ? const Color(0xFFf65279)
                                  : const Color(0xFF292728),
                              width: 1),
                        ),
                        child: Text(
                          'SHIFT',
                          style: TextStyle(
                              color: isShiftOn
                                  ? const Color(0xFFf65279)
                                  : const Color(0xFF292728)),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.08,
                      ),
                      TextField(
                        decoration:
                            const InputDecoration(border: InputBorder.none),
                        keyboardType: TextInputType.none,
                        controller: _calculatorText,
                        textAlign: TextAlign.end,
                        autofocus: true,
                        cursorColor: Colors.white,
                        style: const TextStyle(
                            color: Color(0xFF03f09f), fontSize: 40),
                      ),
                      Text(
                        ans,
                        textAlign: TextAlign.end,
                        style: const TextStyle(
                            color: Color(0xFFfffffd), fontSize: 40),
                      ),
                    ],
                  ),
                ),
              ),
              // Buttons

              Expanded(
                flex: 2,
                child: Stack(children: [
                  Container(
                    color: const Color(0xFF161616),
                  ),
                  Column(children: [
                    ///First Button Row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RoundedButtonWithCircularIcon(
                            const Text(
                              'C',
                              style: TextStyle(
                                  color: Color(0xFFA3A5A5), fontSize: 35),
                            ), () {
                          clearTextField();
                        }),
                        RoundedButtonWithCircularIcon(
                            const Icon(
                              Icons.arrow_back,
                              color: Color(0xFFA3A5A5),
                              size: 35,
                            ), () {
                          // set function to delete one input at a time
                          setState(() {
                            deleteOneElement();
                          });
                        }),
                        Container(
                          margin: const EdgeInsets.all(2),
                          color: Colors.black87,
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                              color: Colors.white,
                            ),
                            child: RawMaterialButton(
                              onPressed: () {
                                setState(() {
                                  if (!isShiftOn) {
                                    isShiftOn = true;
                                  } else {
                                    isShiftOn = false;
                                  }
                                });
                              },
                              elevation: 6.0,
                              fillColor: Colors.white,
                              constraints: const BoxConstraints.tightFor(
                                  width: 145.0, height: 60.0),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50)),
                              child: const Text(
                                'Shift',
                                style: TextStyle(
                                    color: Color(0xFFA3A5A5), fontSize: 25),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    // Second Button Row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RoundedButtonWithIcon(
                            Container(
                              height: 25,
                              child: Image.asset(
                                'assets/icons/plusandminus.png',
                                color: const Color(0xFFA3A5A5),
                                fit: BoxFit.contain,
                              ),
                            ),
                            '1/x', () {
                          if (isShiftOn) {
                            _calculatorText.text = '1/${_calculatorText.text}';
                          }
                        }),
                        RoundedButtonWithIcon(
                            const Icon(
                              Icons.percent,
                              color: Color(0xFFA3A5A5),
                              size: 30,
                            ),
                            'x!',
                            () {}),
                        RoundedButtonWithIcon(
                            const Text(
                              'x\u00B2',
                              style: TextStyle(
                                  color: Color(0xFFA3A5A5), fontSize: 30),
                            ),
                            'x\u02b8',
                            () {}),
                        RoundedButtonWithCircularIcon(
                            Container(
                              height: 30,
                              child: Image.asset(
                                'assets/icons/divided.png',
                                color: const Color(0xFFdf4d14),
                                fit: BoxFit.contain,
                              ),
                            ), () {
                          _calculatorText.text += '/';
                        }),
                      ],
                    ),

                    // 3rd Button Row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RoundedButtonWithIcon(
                            const Text(
                              '7',
                              style: TextStyle(
                                  color: Color(0xFFA3A5A5), fontSize: 30),
                            ),
                            '(', () {
                          if (isShiftOn) {
                            _calculatorText.text += '(';
                          } else {
                            _calculatorText.text += '7';
                          }
                        }),
                        RoundedButtonWithIcon(
                            const Text(
                              '8',
                              style: TextStyle(
                                  color: Color(0xFFA3A5A5), fontSize: 30),
                            ),
                            ')', () {
                          if (isShiftOn) {
                            _calculatorText.text += ')';
                          } else {
                            _calculatorText.text += '8';
                          }
                        }),
                        RoundedButtonWithIcon(
                            const Text(
                              '9',
                              style: TextStyle(
                                  color: Color(0xFFA3A5A5), fontSize: 30),
                            ),
                            '\u221ax', () {
                          _calculatorText.text += '9';
                        }),
                        RoundedButtonWithCircularIcon(
                            Container(
                              height: 25,
                              child: Image.asset(
                                'assets/icons/multiply.png',
                                color: const Color(0xFFdf4d14),
                                fit: BoxFit.contain,
                              ),
                            ), () {
                          _calculatorText.text += '*';
                        }),
                      ],
                    ),

                    //4th Row

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RoundedButtonWithIcon(
                            const Text(
                              '4',
                              style: TextStyle(
                                  color: Color(0xFFA3A5A5), fontSize: 30),
                            ),
                            'sin', () {
                          _calculatorText.text += '4';
                        }),
                        RoundedButtonWithIcon(
                            const Text(
                              '5',
                              style: TextStyle(
                                  color: Color(0xFFA3A5A5), fontSize: 30),
                            ),
                            'cos', () {
                          _calculatorText.text += '5';
                        }),
                        RoundedButtonWithIcon(
                            const Text(
                              '6',
                              style: TextStyle(
                                  color: Color(0xFFA3A5A5), fontSize: 30),
                            ),
                            'tan', () {
                          _calculatorText.text += '6';
                        }),
                        RoundedButtonWithCircularIcon(
                            Container(
                              height: 22,
                              child: Image.asset(
                                'assets/icons/minus.png',
                                color: const Color(0xFFdf4d14),
                                fit: BoxFit.contain,
                              ),
                            ), () {
                          _calculatorText.text += '-';
                        }),
                      ],
                    ),

                    //5th Row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RoundedButtonWithIcon(
                            const Text(
                              '1',
                              style: TextStyle(
                                  color: Color(0xFFA3A5A5), fontSize: 30),
                            ),
                            'log', () {
                          _calculatorText.text += '1';
                        }),
                        RoundedButtonWithIcon(
                            const Text(
                              '2',
                              style: TextStyle(
                                  color: Color(0xFFA3A5A5), fontSize: 30),
                            ),
                            'ln', () {
                          _calculatorText.text += '2';
                        }),
                        RoundedButtonWithIcon(
                            const Text(
                              '3',
                              style: TextStyle(
                                  color: Color(0xFFA3A5A5), fontSize: 30),
                            ),
                            'e\u02e3', () {
                          _calculatorText.text += '3';
                        }),
                        RoundedButtonWithCircularIcon(
                            Container(
                              height: 20,
                              child: Image.asset(
                                'assets/icons/plus.png',
                                color: const Color(0xFFdf4d14),
                                fit: BoxFit.contain,
                              ),
                            ), () {
                          _calculatorText.text += '+';
                        }),
                      ],
                    ),

                    // 6th Row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RoundedButtonWithIcon(
                            const Text(
                              '0',
                              style: TextStyle(
                                  color: Color(0xFFA3A5A5), fontSize: 35),
                            ),
                            '\u03c0', () {
                          _calculatorText.text += '0';
                        }),
                        RoundedButtonWithIcon(
                            const Text(
                              '.',
                              style: TextStyle(
                                  color: Color(0xFFA3A5A5), fontSize: 35),
                            ),
                            'e', () {
                          _calculatorText.text += '.';
                        }),
                        Container(
                          margin: EdgeInsets.all(2),
                          color: Colors.black87,
                          child: Container(
                            padding: EdgeInsets.all(10),
                            decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                              color: Color(0xFFdf4d14),
                            ),
                            child: RawMaterialButton(
                              onPressed: () {
                                Parser p = Parser();
                                Expression expression =
                                    p.parse(_calculatorText.text);
                                ContextModel cm = ContextModel();
                                var finalValue = expression.evaluate(
                                    EvaluationType.REAL, cm);
                                bool isInteger(num value) =>
                                    value is int ||
                                    value == value.roundToDouble();
                                if (isInteger(finalValue)) {
                                  setState(() {
                                    ans = finalValue.round().toString();
                                  });
                                } else {
                                  setState(() {
                                    ans = finalValue.toStringAsFixed(2);
                                  });
                                }
                              },
                              elevation: 6.0,
                              fillColor: const Color(0xFFdf4d14),
                              constraints: const BoxConstraints.tightFor(
                                  width: 145.0, height: 60.0),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50)),
                              child: const Text(
                                '=',
                                style: TextStyle(
                                    color: Color(0xFFffefd8), fontSize: 30),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ]),
                ]),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
