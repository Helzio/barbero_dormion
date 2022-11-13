import 'package:barbero_dormilon/presentation/pages/home/fork.dart';

class Filosofo {
  late Fork primerTenedor;
  late Fork segundoTenedor;
  late String firstForkText, secondForkText;
  bool tenedorDerecho = false;
  bool tenedorIzquierdo = false;
  String mensaje = "";
  int vecesComio = 0;
  int estado = 0;
  String init;

  Filosofo({
    required Fork izq,
    required Fork der,
    required this.init,
  }) {
    if (init == "izquierdo") {
      primerTenedor = izq;
      segundoTenedor = der;
      firstForkText = "izquierdo";
      secondForkText = "derecho";
    }

    if (init == "derecho") {
      primerTenedor = der;
      segundoTenedor = izq;
      firstForkText = "derecho";
      secondForkText = "izquierdo";
    }
  }

  Future<void> iniciar() async {
    vecesComio = 0;
    estado = 0;
    tenedorDerecho = false;
    tenedorIzquierdo = false;
    for (var i = 0; i < 6; i++) {
      mensaje = "Pensando...";
      estado = 0;
      await Future.delayed(const Duration(seconds: 1 * 1));

      mensaje = "Esperando...";
      estado = 1;
      await Future.delayed(const Duration(seconds: 1 * 1));

      await primerTenedor.decrease();
      mensaje = "Tenedor $firstForkText listo.";
      init == "izquierdo" ? tenedorIzquierdo = true : tenedorDerecho = true;
      await Future.delayed(const Duration(seconds: 1 * 1));

      await segundoTenedor.decrease();
      mensaje = "Tenedor $secondForkText listo.";
      init == "izquierdo" ? tenedorDerecho = true : tenedorIzquierdo = true;
      await Future.delayed(const Duration(seconds: 1 * 1));

      mensaje = "Comiendo...";
      estado = 2;
      await Future.delayed(const Duration(seconds: 1 * 2));
      vecesComio++;

      mensaje = "Tenedor $firstForkText soltado.";
      estado = 0;
      init == "izquierdo" ? tenedorIzquierdo = false : tenedorDerecho = false;
      primerTenedor.increase();
      await Future.delayed(const Duration(milliseconds: 1 * 500));

      mensaje = "Tenedor $secondForkText soltado.";
      init == "izquierdo" ? tenedorDerecho = false : tenedorIzquierdo = false;
      segundoTenedor.increase();
      await Future.delayed(const Duration(milliseconds: 1 * 500));
    }
  }
}
