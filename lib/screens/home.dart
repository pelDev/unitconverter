import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:unitconverter/convert.dart';

class UnitConverterHome extends StatefulWidget {
  @override
  _UnitConverterHomeState createState() => _UnitConverterHomeState();
}

class _UnitConverterHomeState extends State<UnitConverterHome> {
  double _numberFrom;
  final List<String> _measures = [
    'meters',
    'kilometers',
    'grams',
    'kilograms',
    'feet',
    'miles',
    'pounds (lbs)',
    'ounces',
  ];

  String _startMeasure;
  String _convertedMeasure;
  String _resultMessage;

  @override
  void initState() {
    // TODO: implement initState
    _numberFrom = 0;
    _convertedMeasure = _measures[1];
    _startMeasure = _measures[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TextStyle _textStyle = TextStyle(
      fontSize: 24.0,
      color: Colors.grey[300],
    );
    TextStyle _inputStyle = TextStyle(
      color: Theme.of(context).accentColor,
      fontSize: 20,
    );
    return Scaffold(
      appBar: AppBar(
        title: Text('Measures Converter'),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    'Value',
                    style: _textStyle,
                  ),
                  //
                  SizedBox(
                    height: 10.0,
                  ),
                  TextField(
                    cursorColor: Colors.white,
                    style: _inputStyle,
                    decoration: InputDecoration(
                      hintText: 'Please insert a number to be converted',
                    ),
                    onChanged: (value) {
                      var number = double.tryParse(value);
                      if (number != null) {
                        setState(() {
                          _numberFrom = number;
                        });
                      }
                    },
                  ),
                  //
                  //
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    'From',
                    style: _textStyle,
                  ),
                  //
                  SizedBox(
                    height: 10.0,
                  ),
                  DropdownButton<String>(
                    style: _inputStyle,
                    isExpanded: true,
                    items: _measures.map((String e) {
                      return DropdownMenuItem<String>(
                        value: e,
                        child: Text(
                          e,
                        ),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        _startMeasure = value;
                        print('Start measure: ' + _startMeasure);
                      });
                    },
                    value: _startMeasure,
                  ),
                  //
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    'To',
                    style: _textStyle,
                  ),
                  //
                  SizedBox(
                    height: 10.0,
                  ),
                  DropdownButton<String>(
                    style: _inputStyle,
                    isExpanded: true,
                    items: _measures.map((String e) {
                      return DropdownMenuItem<String>(
                        value: e,
                        child: Text(
                          e,
                        ),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        _convertedMeasure = value;
                        print('Convert measure: ' + _convertedMeasure);
                      });
                    },
                    value: _convertedMeasure,
                  ),
                  //
                  SizedBox(
                    height: 20.0,
                  ),
                  RaisedButton(
                    child: Text('Convert',
                        style: TextStyle(
                          color: Colors.white,
                        )),
                    onPressed: () {
                      handleConversion();
                    },
                    color: Theme.of(context).accentColor,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  //
                  Text(
                    _resultMessage == null ? '' : _resultMessage,
                    style: _textStyle,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    'by pelDev',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void handleConversion() {
    print(_startMeasure + ' to ' + _convertedMeasure);
    if (_numberFrom > 0) {
      double result = ConvertionHelper()
          .convertNumber(_numberFrom, _startMeasure, _convertedMeasure);
      if (result == 0) {
        setState(() {
          _resultMessage = 'This conversion cannot be performed';
        });
      } else {
        setState(() {
          _resultMessage =
              '$_numberFrom $_startMeasure is equal to $result $_convertedMeasure';
        });
      }
      print(_resultMessage);
    }
  }
}
