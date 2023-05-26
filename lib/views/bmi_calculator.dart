import 'package:flutter/material.dart';

class BMICalculator extends StatefulWidget {
  const BMICalculator({Key? key}) : super(key: key);

  @override
  State<BMICalculator> createState() => _BMICalculatorState();
}

class _BMICalculatorState extends State<BMICalculator> {
  final weightController = TextEditingController();
  final inchesController = TextEditingController();
  double bmiResult = 0.0;
  String message = "";
  void bmiCalculate() {
    var inchesHeight = inchesController.value.text;
    var weight = weightController.value.text;
    if (inchesHeight != "" && weight != "") {
      var iHeight = int.parse(inchesHeight);
      var wt = int.parse(weight);
      var meterHeight = iHeight / 39.3701;
      bmiResult = wt / (meterHeight * meterHeight);
      setState(() {
        if (bmiResult > 0 && bmiResult < 18) {
          message = "You are Under Weight";
        } else if (bmiResult > 25) {
          message = "You are over Weight";
        } else if (bmiResult >= 18 && bmiResult <= 25) {
          message = "you are a healthy Person";
        } else {
          message = "You are obese";
        }
      });
    } else {
      setState(() {
        message = "please fill All the fields";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.orange,
      appBar: AppBar(
        title: const Text('BMI Calculator'),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.orange,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              Container(
                height: 450,
                width: 300,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 50),
                  child: Column(
                    children: [
                      TextFormField(
                        controller: weightController,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          hintText: "Enter your weight",
                          prefixIcon: Icon(Icons.line_weight_rounded),
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      TextFormField(
                        controller: inchesController,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          hintText: "Enter your height (inches)",
                          prefixIcon: Icon(Icons.height_rounded),
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      SizedBox(
                        height: 50,
                        width: 150,
                        child: ElevatedButton(
                          onPressed: () {
                            bmiCalculate();
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.orange,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          child: const Text(
                            "Calculate",
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        bmiResult.toStringAsFixed(2),
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Text(
                        message,
                        style:
                            const TextStyle(color: Colors.black, fontSize: 18),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
