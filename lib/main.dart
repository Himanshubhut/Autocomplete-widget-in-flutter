import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Autocomplete widget Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  static const List<String> _nameOptions = <String>[
    'Himanshu',
    'Raj',
    'Jay',
    'Aman',
    'Rutvik',
    'Hiren',
    'Hardik',
    'Vishal',
    'Jeet',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("AutoComplete widget"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("enter name:"),
          Autocomplete<String>(
            optionsBuilder: (TextEditingValue fruitTextEditingValue) {
              if (fruitTextEditingValue.text == '') {
                return const Iterable<String>.empty();
              }
              return _nameOptions.where((String option) {
                return option
                    .contains(fruitTextEditingValue.text.toLowerCase());
              });
            },
            onSelected: (String value) {
              debugPrint('You just selected $value');
            },
          ),
        ],
      ),
    );
  }
}
