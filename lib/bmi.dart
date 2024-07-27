import 'package:flutter/material.dart';

class BMI extends StatefulWidget {
  @override
  _BMIState createState() => _BMIState();
}

class _BMIState extends State<BMI> {
  final TextEditingController _weightController = TextEditingController();
  double _result = 0.0;
  double? _selectedFeet;
  double? _selectedInches;
  String _errorMessage = '';
  String _status = '';

  final List<double> _feetOptions = [3.0, 4.0, 5.0, 6.0, 7.0];
  final List<double> _inchesOptions =
      List<double>.generate(12, (i) => i.toDouble());

  void calculateBMI() {
    setState(() {
      _errorMessage = '';
      _status = '';
    });

    // If there is an error, I am setting _result to be 0.0
    // so it will not show anything in the result box
    if (_selectedFeet == null) {
      setState(() {
        _errorMessage = 'Enter feet';
        _result = 0.0;
      });
      return;
    }
    if (_selectedInches == null) {
      setState(() {
        _errorMessage = 'Enter inches';
        _result = 0.0;
      });
      return;
    }
    if (_weightController.text.isEmpty) {
      setState(() {
        _errorMessage = 'Enter weight';
        _result = 0.0;
      });
      return;
    }

    // I am including error if the user entered a non number in the weight
    double? weightInLbs = double.tryParse(_weightController.text);
    if (weightInLbs == null) {
      setState(() {
        _errorMessage = 'Weight has to be a number';
        _result = 0.0;
      });
      return;
    }

    double heightInInches = (_selectedFeet! * 12) + _selectedInches!;
    double heightInMeters = heightInInches * 0.0254;
    double weightInKg = weightInLbs / 2.2;

    _result = weightInKg / (heightInMeters * heightInMeters);
    setState(() {
      _status = getWeightRange(_result);
    });
  }

  String getWeightRange(double bmi) {
    if (bmi < 18.50) {
      return 'Underweight';
    } else if (bmi >= 18.50 && bmi < 25) {
      return 'Healthy Weight Range';
    } else if (bmi >= 25 && bmi < 30) {
      return 'Overweight';
    } else {
      return 'Severely Overweight';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'BMI Calculator',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24.0,
            fontWeight: FontWeight.w800,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: SizedBox(
                    child: DropdownButton<double>(
                      hint: Text('Feet'),
                      value: _selectedFeet,
                      items: _feetOptions.map((double value) {
                        return DropdownMenuItem<double>(
                          value: value,
                          child: Text(value.toString()),
                        );
                      }).toList(),
                      onChanged: (newValue) {
                        setState(() {
                          _selectedFeet = newValue;
                        });
                      },
                    ),
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: SizedBox(
                    child: DropdownButton<double>(
                      hint: Text('Inches'),
                      value: _selectedInches,
                      items: _inchesOptions.map((double value) {
                        return DropdownMenuItem<double>(
                          value: value,
                          child: Text(value.toString()),
                        );
                      }).toList(),
                      onChanged: (newValue) {
                        setState(() {
                          _selectedInches = newValue;
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 50),
            TextField(
              controller: _weightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'weight in lbs',
              ),
            ),
            SizedBox(height: 50),
            OutlinedButton(
              child: Text("Calculate"),
              onPressed: calculateBMI,
              style: OutlinedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.zero,
                ),
              ),
            ),
            SizedBox(height: 50),
            Text('Result'),
            Text(
              _result == 0.0 ? " " : "${_result.toStringAsFixed(2)}",
              style: TextStyle(
                color: Colors.redAccent,
                fontSize: 19.4,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 20),
            Text(
              _status,
              style: TextStyle(
                color: Colors.blueAccent,
                fontSize: 19.4,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 20),
            if (_errorMessage.isNotEmpty)
              Text(
                _errorMessage,
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 16.0,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
