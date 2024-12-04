// lib/pantallas/pantalla_principal.dart

import 'package:flutter/material.dart';
import '../logica/operaciones.dart';

class PantallaPrincipal extends StatefulWidget {
  @override
  _PantallaPrincipalState createState() => _PantallaPrincipalState();
}

class _PantallaPrincipalState extends State<PantallaPrincipal> {
  final TextEditingController controladorNumero1 = TextEditingController();
  final TextEditingController controladorNumero2 = TextEditingController();

  String resultado = '';
  String resultadoInvertido = '';

  void calcularOperaciones() {
    int numero1 = int.parse(controladorNumero1.text);
    int numero2 = int.parse(controladorNumero2.text);

    Operaciones operaciones = Operaciones(numero1: numero1, numero2: numero2);

    setState(() {
      resultado = '';
      resultadoInvertido = '';

      // Mostrar las operaciones conmutativas
      if (operaciones.esConmutativa('suma')) {
        resultado += 'Suma: ${operaciones.sumar()}\n';
      } else {
        resultadoInvertido += 'Suma invertida: ${operaciones.sumarInvertido()}\n';
      }

      if (operaciones.esConmutativa('multiplicación')) {
        resultado += 'Multiplicación: ${operaciones.multiplicar()}\n';
      } else {
        resultadoInvertido += 'Multiplicación invertida: ${operaciones.multiplicarInvertido()}\n';
      }

      // Operaciones no conmutativas
      if (!operaciones.esConmutativa('resta')) {
        resultado += 'Resta: ${operaciones.restar()}\n';
        resultadoInvertido += 'Resta invertida: ${operaciones.restarInvertido()}\n';
      } else {
        resultado += 'Resta: ${operaciones.restar()}\n';
      }

      if (!operaciones.esConmutativa('división')) {
        resultado += 'División: ${operaciones.dividir()}\n';
        resultadoInvertido += 'División invertida: ${operaciones.dividirInvertido()}\n';
      } else {
        resultado += 'División: ${operaciones.dividir()}\n';
      }

      if (!operaciones.esConmutativa('módulo')) {
        resultado += 'Módulo: ${operaciones.modulo()}\n';
        resultadoInvertido += 'Módulo invertido: ${operaciones.moduloInvertido()}\n';
      } else {
        resultado += 'Módulo: ${operaciones.modulo()}\n';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[50],  // Fondo suave de color teal
      appBar: AppBar(
        title: Text(
          'Calculadora de Operaciones',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.teal,  // Color de la barra superior
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: controladorNumero1,
              decoration: InputDecoration(
                labelText: 'Ingresa el primer número',
                labelStyle: TextStyle(color: Colors.teal),
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.teal, width: 2),
                ),
              ),
              keyboardType: TextInputType.number,
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 16),
            TextField(
              controller: controladorNumero2,
              decoration: InputDecoration(
                labelText: 'Ingresa el segundo número',
                labelStyle: TextStyle(color: Colors.teal),
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.teal, width: 2),
                ),
              ),
              keyboardType: TextInputType.number,
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: calcularOperaciones,
              child: Text('Calcular', style: TextStyle(fontSize: 18)),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white, backgroundColor: Colors.teal,  // Color de texto del botón
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),  // Bordes redondeados
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              resultado,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.teal[800],  // Color del texto de resultados
              ),
            ),
            SizedBox(height: 20),
            // Mostrar solo la sección invertida si hay alguna operación no conmutativa
            if (resultadoInvertido.isNotEmpty)
              Column(
                children: [
                  Text(
                    "Operaciones con operadores invertidos:",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.teal),
                  ),
                  SizedBox(height: 10),
                  Text(
                    resultadoInvertido,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.orange[700]),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
