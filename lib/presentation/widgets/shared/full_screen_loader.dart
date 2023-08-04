import 'package:flutter/material.dart';

class FullScreenLoader extends StatelessWidget {
  const FullScreenLoader({super.key});

  Stream<String> getLoadingMessage() {
    final messages = <String>[
      "Cargando peliculas",
      "Comprando palomitas de maiz",
      "Cargando populares",
      "Llamando a mi novia",
      "Ya mero.......",
      "Esto esta tardando mas de lo esperado",
    ];
    return Stream.periodic(const Duration(milliseconds: 1200), (step) {
      return messages[step];
    }).take(messages.length);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Espere por favor"),
          SizedBox(height: 10),
          CircularProgressIndicator(strokeWidth: 2),
          SizedBox(height: 10),
          StreamBuilder(
              stream: getLoadingMessage(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) return const Text('Cargando');

                return Text(snapshot.data!);
              })
        ],
      ),
    );
  }
}
