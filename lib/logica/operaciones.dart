// lib/logica/operaciones.dart

class Operaciones {
  int numero1;
  int numero2;

  Operaciones({required this.numero1, required this.numero2});

  int sumar() {
    return numero1 + numero2;
  }

  int restar() {
    return numero1 - numero2;
  }

  int multiplicar() {
    return numero1 * numero2;
  }

  // División con manejo de error
  dynamic dividir() {
    if (numero2 == 0) {
      return 'Error: División por cero';
    }
    return numero1 / numero2;
  }

  // Módulo con manejo de error
  dynamic modulo() {
    if (numero2 == 0) {
      return 'Error: Módulo con cero';
    }
    return numero1 % numero2;
  }

  // Operaciones con los operadores invertidos
  int sumarInvertido() {
    return numero2 + numero1;
  }

  int restarInvertido() {
    return numero2 - numero1;
  }

  int multiplicarInvertido() {
    return numero2 * numero1;
  }

  dynamic dividirInvertido() {
    if (numero1 == 0) {
      return 'Error: División por cero';
    }
    return numero2 / numero1;
  }

  Object moduloInvertido() {
    if (numero1 == 0) {
      return 'Error: Módulo con cero';
    }
    return numero2 % numero1;
  }

  // Método para determinar si la operación es conmutativa
  bool esConmutativa(String operacion) {
    if (operacion == "suma" || operacion == "multiplicación") {
      return true;
    }
    return false;
  }


}
