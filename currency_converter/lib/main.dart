
import 'package:flutter/material.dart';

void main() {
  runApp(const CurrencyConverter());
}

class CurrencyConverter extends StatefulWidget {
  const CurrencyConverter({super.key});

  @override
  State<CurrencyConverter> createState() => _CurrencyConverterState();
}

class _CurrencyConverterState extends State<CurrencyConverter> {
  double amount = 0.0;
  String fromCurrency = 'USD';
  String toCurrency = 'EUR';
  double result = 0.0;

  final TextEditingController amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Currency Converter'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                controller: amountController,
                decoration: const InputDecoration(
                  labelText: 'Amount',
                ),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  setState(() {
                    amount = double.tryParse(value) ?? 0.0;
                  });
                },
              ),
              const SizedBox(height: 16.0),
              DropdownButton<String>(
                value: fromCurrency,
                onChanged: (String? newValue) {
                  setState(() {
                    fromCurrency = newValue!;
                  });
                },
                items: <String>['USD', 'EUR', 'GBP', 'JPY']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              const SizedBox(height: 16.0),
              DropdownButton<String>(
                value: toCurrency,
                onChanged: (String? newValue) {
                  setState(() {
                    toCurrency = newValue!;
                  });
                },
                items: <String>['USD', 'EUR', 'GBP', 'JPY']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    // Perform currency conversion logic here
                    result = amount * 0.85; // Example conversion rate
                  });
                },
                child: const Text('Convert'),
              ),
              const SizedBox(height: 16.0),
              Text(
                'Result: $result $toCurrency',
                style: const TextStyle(fontSize: 24.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
