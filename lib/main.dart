import 'package:flutter/material.dart';
import 'package:app_tcc/servico.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _inputCPF = TextEditingController();
  final _inputPlaca = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  String _label = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: SizedBox(
          width: 100,
          height: 110,
          child: Image.asset(
            'assets/imagens/Logo.png',
            width: 130,
            height:
                140, // Ajusta o tamanho da imagem para caber no espaço definido
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        const Text(
                          'Consulta',
                          style: TextStyle(
                              fontSize: 30.0,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        const Text(
                          'Digite o seu CPF:',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          controller: _inputCPF,
                          keyboardType: TextInputType.number,
                          obscureText: false,
                          maxLength: 11,
                          style: const TextStyle(color: Colors.white),
                          decoration: const InputDecoration(
                            hintText:
                                'xxx.xxx.xxx-xx', // Texto que aparece como dica
                            hintStyle: TextStyle(color: Colors.white60),
                            counterText: '',
                            border: OutlineInputBorder(),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black)),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black)),
                            labelStyle: TextStyle(color: Colors.white),
                            filled: true,
                            fillColor: Colors.black,
                          ),
                          validator: (value) {
                            if (value == null ||
                                value.isEmpty ||
                                double.parse(value) <= 0) {
                              return 'Informe o seu CPF';
                            }
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          'Digite a placa do seu automovél:',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: _inputPlaca,
                          keyboardType: TextInputType.text,
                          style: const TextStyle(color: Colors.white),
                          obscureText: false,
                          maxLength: 7,
                          decoration: const InputDecoration(
                            hintText: 'RIO2A18', // Texto que aparece como dica
                            hintStyle: TextStyle(color: Colors.white60),
                            counterText: '',
                            border: OutlineInputBorder(),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black)),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black)),
                            labelStyle: TextStyle(color: Colors.white),
                            filled: true,
                            fillColor: Colors.black,
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Informe a placa do automóvel';
                            }
                          },
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState?.validate() ?? false) {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                      builder: (context) => MyServico()),
                                );
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              primary: const Color.fromRGBO(0, 127, 255, 100),
                              padding: const EdgeInsets.all(20.0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(7.0),
                              ),
                            ),
                            child: const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('Consultar',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15.0,
                                      )),
                                ])),
                        GestureDetector(
                          onLongPress: () {
                            _inputCPF.clear();
                            _inputPlaca.clear();
                            _label = '';

                            setState(() {});
                          },
                          child: Text(
                            _label,
                            style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        )
                      ],
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
