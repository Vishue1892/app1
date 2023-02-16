import 'package:flutter/material.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  int contador = 0;
  void incrementar() {
    contador++;
    setState(() {});
  }

  void decrementar() {
    contador--;
    setState(() {});
  }

  void reiniciar() {
    contador = 0;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    const TextStyle estiloTexto = TextStyle(
      fontSize: 30,
      color: Colors.blueGrey,
      fontWeight: FontWeight.bold,
    );
    return Scaffold(
        appBar: AppBar(
          title: const Text('Home Screen'),
          elevation: 5.5,
        ),
        backgroundColor: const Color.fromARGB(255, 19, 200, 228),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Numero de Taps:',
              style: estiloTexto,
            ),
            Text(
              '$contador',
              style: estiloTexto,
            ),
          ],
        )),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: CustomFloatingActionButton(
          decrease: decrementar,
          increase: incrementar,
          reset: reiniciar,
        ));
  }
}

class CustomFloatingActionButton extends StatelessWidget {
  final Function increase;
  final Function decrease;
  final Function reset;
  const CustomFloatingActionButton({
    super.key,
    required this.increase,
    required this.decrease,
    required this.reset,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        FloatingActionButton(
          backgroundColor: const Color.fromARGB(255, 247, 2, 67),
          foregroundColor: const Color.fromARGB(255, 0, 44, 66),
          onPressed: () => decrease(),
          child: const Icon(Icons.exposure_minus_1),
        ),
        FloatingActionButton(
          backgroundColor: const Color.fromARGB(255, 247, 2, 67),
          foregroundColor: const Color.fromARGB(255, 0, 44, 66),
          onPressed: () => reset(),
          child: const Icon(Icons.restart_alt),
        ),
        FloatingActionButton(
          backgroundColor: const Color.fromARGB(255, 247, 2, 67),
          foregroundColor: const Color.fromARGB(255, 0, 44, 66),
          onPressed: () => increase(),
          child: const Icon(Icons.exposure_plus_1),
        ),
      ],
    );
  }
}
