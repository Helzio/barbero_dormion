import 'dart:async';

import 'package:barbero_dormilon/presentation/pages/home/filosofo.dart';
import 'package:barbero_dormilon/presentation/pages/home/fork.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gif/flutter_gif.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage>
    with TickerProviderStateMixin {
  late FlutterGifController controllerComiendo,
      controllerEsperando,
      controller3,
      controller4,
      controller5;

  Fork tenedor1 = Fork(color: Colors.orange);
  Fork tenedor2 = Fork(color: Colors.red);
  Fork tenedor3 = Fork(color: Colors.blue);
  Fork tenedor4 = Fork(color: Colors.purple);
  Fork tenedor5 = Fork(color: Colors.green);

  final List<Filosofo> listaFilosofos = [];

  late Filosofo filosofo1;
  late Filosofo filosofo2;
  late Filosofo filosofo3;
  late Filosofo filosofo4;
  late Filosofo filosofo5;

  @override
  void initState() {
    super.initState();
    controllerComiendo = FlutterGifController(vsync: this);
    controllerEsperando = FlutterGifController(vsync: this);

    filosofo1 = Filosofo(izq: tenedor1, der: tenedor2, init: "izquierdo");
    filosofo2 = Filosofo(izq: tenedor2, der: tenedor3, init: "derecho");
    filosofo3 = Filosofo(izq: tenedor3, der: tenedor4, init: "izquierdo");
    filosofo4 = Filosofo(izq: tenedor4, der: tenedor5, init: "derecho");
    filosofo5 = Filosofo(izq: tenedor5, der: tenedor1, init: "izquierdo");
    listaFilosofos.add(filosofo1);
    listaFilosofos.add(filosofo2);
    listaFilosofos.add(filosofo3);
    listaFilosofos.add(filosofo4);
    listaFilosofos.add(filosofo5);

    controllerComiendo.repeat(
      min: 244,
      max: 352,
      period: const Duration(milliseconds: 3000),
    );

    controllerEsperando.repeat(
      min: 0,
      max: 20,
      period: const Duration(milliseconds: 1000),
    );

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      Timer.periodic(
          const Duration(milliseconds: 99), (Timer t) => setState(() {}));
      iniciarJuego();
    });
  }

  Future<void> iniciarJuego() async {
    listaFilosofos.shuffle();

    for (var element in listaFilosofos) {
      element.iniciar();
      await Future.delayed(const Duration(milliseconds: 333));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFdedede),
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 56,
              height: 56,
              child: Image.asset(
                "assets/images/mesera.png",
                fit: BoxFit.fitHeight,
              ),
            ),
            const SizedBox(
              width: 32,
            ),
            const Text(
              'FILÓSOFOS COMENSALES',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              width: 32,
            ),
            SizedBox(
              width: 56,
              height: 56,
              child: Image.asset(
                "assets/images/mesera.png",
                fit: BoxFit.fitHeight,
              ),
            ),
          ],
        ),
      ),
      body: InkWell(
        onTap: () {
          setState(() {
            // isPuause = !isPuause;
          });
        },
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              "assets/images/fondo_final2.png",
              fit: BoxFit.contain,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 448),
              child: Center(
                child: Image.asset(
                  "assets/images/mesas.png",
                  height: 188,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 120,
              ),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          children: [
                            const SizedBox(
                              width: 8,
                            ),
                            AnimatedCrossFade(
                              duration: const Duration(milliseconds: 100),
                              crossFadeState: filosofo1.vecesComio >= 1
                                  ? CrossFadeState.showSecond
                                  : CrossFadeState.showFirst,
                              firstChild:
                                  Image.asset("assets/images/plato.png"),
                              secondChild:
                                  Image.asset("assets/images/ramen.png"),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            AnimatedCrossFade(
                              duration: const Duration(milliseconds: 100),
                              crossFadeState: filosofo1.vecesComio >= 2
                                  ? CrossFadeState.showSecond
                                  : CrossFadeState.showFirst,
                              firstChild:
                                  Image.asset("assets/images/plato.png"),
                              secondChild:
                                  Image.asset("assets/images/ramen.png"),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            AnimatedCrossFade(
                              duration: const Duration(milliseconds: 100),
                              crossFadeState: filosofo1.vecesComio >= 3
                                  ? CrossFadeState.showSecond
                                  : CrossFadeState.showFirst,
                              firstChild:
                                  Image.asset("assets/images/plato.png"),
                              secondChild:
                                  Image.asset("assets/images/ramen.png"),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            const SizedBox(
                              width: 8,
                            ),
                            AnimatedCrossFade(
                              duration: const Duration(milliseconds: 100),
                              crossFadeState: filosofo1.vecesComio >= 4
                                  ? CrossFadeState.showSecond
                                  : CrossFadeState.showFirst,
                              firstChild:
                                  Image.asset("assets/images/plato.png"),
                              secondChild:
                                  Image.asset("assets/images/ramen.png"),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            AnimatedCrossFade(
                              duration: const Duration(milliseconds: 100),
                              crossFadeState: filosofo1.vecesComio >= 5
                                  ? CrossFadeState.showSecond
                                  : CrossFadeState.showFirst,
                              firstChild:
                                  Image.asset("assets/images/plato.png"),
                              secondChild:
                                  Image.asset("assets/images/ramen.png"),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            AnimatedCrossFade(
                              duration: const Duration(milliseconds: 100),
                              crossFadeState: filosofo1.vecesComio >= 6
                                  ? CrossFadeState.showSecond
                                  : CrossFadeState.showFirst,
                              firstChild:
                                  Image.asset("assets/images/plato.png"),
                              secondChild:
                                  Image.asset("assets/images/ramen.png"),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Material(
                          color: Colors.black54,
                          borderRadius: BorderRadiusDirectional.circular(4),
                          child: SizedBox(
                            width: 120,
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Text(
                                filosofo1.mensaje,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontSize: 8,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        SizedBox(
                          width: 120,
                          child: Row(
                            children: [
                              const SizedBox(
                                width: 8,
                              ),
                              Expanded(
                                child: AspectRatio(
                                  aspectRatio: 1,
                                  child: Material(
                                    color: filosofo1.estado == 0
                                        ? Colors.red
                                        : Colors.grey,
                                    shape: const StadiumBorder(),
                                    child: const SizedBox(),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              Expanded(
                                child: AspectRatio(
                                  aspectRatio: 1,
                                  child: Material(
                                    color: filosofo1.estado == 1
                                        ? Colors.yellow
                                        : Colors.grey,
                                    shape: const StadiumBorder(),
                                    child: const SizedBox(),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              Expanded(
                                child: AspectRatio(
                                  aspectRatio: 1,
                                  child: Material(
                                    color: filosofo1.estado == 2
                                        ? Colors.green
                                        : Colors.grey,
                                    shape: const StadiumBorder(),
                                    child: const SizedBox(),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 120,
                          width: 120,
                          child: AspectRatio(
                            aspectRatio: 1,
                            child: GifImage(
                              controller: filosofo1.mensaje == "Comiendo..."
                                  ? controllerComiendo
                                  : controllerEsperando,
                              image: const AssetImage("assets/images/m6.gif"),
                            ),
                          ),
                        ),
                        Stack(
                          children: [
                            Transform.translate(
                              offset: const Offset(0, -24),
                              child: AnimatedOpacity(
                                opacity: filosofo1.tenedorIzquierdo ? 1 : 0,
                                duration: const Duration(milliseconds: 100),
                                child: SizedBox(
                                  width: 40,
                                  height: 40,
                                  child: Image.asset(
                                    "assets/images/fork.png",
                                    fit: BoxFit.cover,
                                    alignment: Alignment.bottomCenter,
                                    color: filosofo1.primerTenedor.color,
                                  ),
                                ),
                              ),
                            ),
                            Transform.translate(
                              offset: const Offset(0, -32),
                              child: Center(
                                child: AnimatedOpacity(
                                  opacity: filosofo1.estado == 2 ? 1 : 0,
                                  duration: const Duration(milliseconds: 100),
                                  child: SizedBox(
                                    width: 120,
                                    height: 56,
                                    child: Image.asset(
                                      "assets/images/food.png",
                                      fit: BoxFit.cover,
                                      alignment: Alignment.bottomCenter,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Transform.translate(
                              offset: const Offset(0, -24),
                              child: SizedBox(
                                width: 120,
                                child: Align(
                                  alignment: Alignment.topRight,
                                  child: AnimatedOpacity(
                                    opacity: filosofo1.tenedorDerecho ? 1 : 0,
                                    duration: const Duration(milliseconds: 100),
                                    child: SizedBox(
                                      width: 40,
                                      height: 40,
                                      child: Image.asset(
                                        "assets/images/fork.png",
                                        fit: BoxFit.cover,
                                        alignment: Alignment.topRight,
                                        color: filosofo1.segundoTenedor.color,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          children: [
                            const SizedBox(
                              width: 8,
                            ),
                            AnimatedCrossFade(
                              duration: const Duration(milliseconds: 100),
                              crossFadeState: filosofo2.vecesComio >= 1
                                  ? CrossFadeState.showSecond
                                  : CrossFadeState.showFirst,
                              firstChild:
                                  Image.asset("assets/images/plato.png"),
                              secondChild:
                                  Image.asset("assets/images/ramen.png"),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            AnimatedCrossFade(
                              duration: const Duration(milliseconds: 100),
                              crossFadeState: filosofo2.vecesComio >= 2
                                  ? CrossFadeState.showSecond
                                  : CrossFadeState.showFirst,
                              firstChild:
                                  Image.asset("assets/images/plato.png"),
                              secondChild:
                                  Image.asset("assets/images/ramen.png"),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            AnimatedCrossFade(
                              duration: const Duration(milliseconds: 100),
                              crossFadeState: filosofo2.vecesComio >= 3
                                  ? CrossFadeState.showSecond
                                  : CrossFadeState.showFirst,
                              firstChild:
                                  Image.asset("assets/images/plato.png"),
                              secondChild:
                                  Image.asset("assets/images/ramen.png"),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            const SizedBox(
                              width: 8,
                            ),
                            AnimatedCrossFade(
                              duration: const Duration(milliseconds: 100),
                              crossFadeState: filosofo2.vecesComio >= 4
                                  ? CrossFadeState.showSecond
                                  : CrossFadeState.showFirst,
                              firstChild:
                                  Image.asset("assets/images/plato.png"),
                              secondChild:
                                  Image.asset("assets/images/ramen.png"),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            AnimatedCrossFade(
                              duration: const Duration(milliseconds: 100),
                              crossFadeState: filosofo2.vecesComio >= 5
                                  ? CrossFadeState.showSecond
                                  : CrossFadeState.showFirst,
                              firstChild:
                                  Image.asset("assets/images/plato.png"),
                              secondChild:
                                  Image.asset("assets/images/ramen.png"),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            AnimatedCrossFade(
                              duration: const Duration(milliseconds: 100),
                              crossFadeState: filosofo2.vecesComio >= 6
                                  ? CrossFadeState.showSecond
                                  : CrossFadeState.showFirst,
                              firstChild:
                                  Image.asset("assets/images/plato.png"),
                              secondChild:
                                  Image.asset("assets/images/ramen.png"),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Material(
                          color: Colors.black54,
                          borderRadius: BorderRadiusDirectional.circular(4),
                          child: SizedBox(
                            width: 120,
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Text(
                                filosofo2.mensaje,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontSize: 8,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        SizedBox(
                          width: 120,
                          child: Row(
                            children: [
                              const SizedBox(
                                width: 8,
                              ),
                              Expanded(
                                child: AspectRatio(
                                  aspectRatio: 1,
                                  child: Material(
                                    color: filosofo2.estado == 0
                                        ? Colors.red
                                        : Colors.grey,
                                    shape: const StadiumBorder(),
                                    child: const SizedBox(),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              Expanded(
                                child: AspectRatio(
                                  aspectRatio: 1,
                                  child: Material(
                                    color: filosofo2.estado == 1
                                        ? Colors.yellow
                                        : Colors.grey,
                                    shape: const StadiumBorder(),
                                    child: const SizedBox(),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              Expanded(
                                child: AspectRatio(
                                  aspectRatio: 1,
                                  child: Material(
                                    color: filosofo2.estado == 2
                                        ? Colors.green
                                        : Colors.grey,
                                    shape: const StadiumBorder(),
                                    child: const SizedBox(),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 120,
                          width: 120,
                          child: AspectRatio(
                            aspectRatio: 1,
                            child: GifImage(
                              controller: filosofo2.mensaje == "Comiendo..."
                                  ? controllerComiendo
                                  : controllerEsperando,
                              image: const AssetImage("assets/images/m5.gif"),
                            ),
                          ),
                        ),
                        Stack(
                          children: [
                            Transform.translate(
                              offset: const Offset(0, -24),
                              child: AnimatedOpacity(
                                opacity: filosofo2.tenedorIzquierdo ? 1 : 0,
                                duration: const Duration(milliseconds: 100),
                                child: SizedBox(
                                  width: 40,
                                  height: 40,
                                  child: Image.asset(
                                    "assets/images/fork.png",
                                    fit: BoxFit.cover,
                                    alignment: Alignment.bottomCenter,
                                    color: filosofo2.segundoTenedor.color,
                                  ),
                                ),
                              ),
                            ),
                            Transform.translate(
                              offset: const Offset(0, -32),
                              child: Center(
                                child: AnimatedOpacity(
                                  opacity: filosofo2.estado == 2 ? 1 : 0,
                                  duration: const Duration(milliseconds: 100),
                                  child: SizedBox(
                                    width: 120,
                                    height: 56,
                                    child: Image.asset(
                                      "assets/images/food.png",
                                      fit: BoxFit.cover,
                                      alignment: Alignment.bottomCenter,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Transform.translate(
                              offset: const Offset(0, -24),
                              child: SizedBox(
                                width: 120,
                                child: Align(
                                  alignment: Alignment.topRight,
                                  child: AnimatedOpacity(
                                    opacity: filosofo2.tenedorDerecho ? 1 : 0,
                                    duration: const Duration(milliseconds: 100),
                                    child: SizedBox(
                                      width: 40,
                                      height: 40,
                                      child: Image.asset(
                                        "assets/images/fork.png",
                                        fit: BoxFit.cover,
                                        alignment: Alignment.topRight,
                                        color: filosofo2.primerTenedor.color,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 100,
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          children: [
                            const SizedBox(
                              width: 8,
                            ),
                            AnimatedCrossFade(
                              duration: const Duration(milliseconds: 100),
                              crossFadeState: filosofo3.vecesComio >= 1
                                  ? CrossFadeState.showSecond
                                  : CrossFadeState.showFirst,
                              firstChild:
                                  Image.asset("assets/images/plato.png"),
                              secondChild:
                                  Image.asset("assets/images/ramen.png"),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            AnimatedCrossFade(
                              duration: const Duration(milliseconds: 100),
                              crossFadeState: filosofo3.vecesComio >= 2
                                  ? CrossFadeState.showSecond
                                  : CrossFadeState.showFirst,
                              firstChild:
                                  Image.asset("assets/images/plato.png"),
                              secondChild:
                                  Image.asset("assets/images/ramen.png"),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            AnimatedCrossFade(
                              duration: const Duration(milliseconds: 100),
                              crossFadeState: filosofo3.vecesComio >= 3
                                  ? CrossFadeState.showSecond
                                  : CrossFadeState.showFirst,
                              firstChild:
                                  Image.asset("assets/images/plato.png"),
                              secondChild:
                                  Image.asset("assets/images/ramen.png"),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            const SizedBox(
                              width: 8,
                            ),
                            AnimatedCrossFade(
                              duration: const Duration(milliseconds: 100),
                              crossFadeState: filosofo3.vecesComio >= 4
                                  ? CrossFadeState.showSecond
                                  : CrossFadeState.showFirst,
                              firstChild:
                                  Image.asset("assets/images/plato.png"),
                              secondChild:
                                  Image.asset("assets/images/ramen.png"),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            AnimatedCrossFade(
                              duration: const Duration(milliseconds: 100),
                              crossFadeState: filosofo3.vecesComio >= 5
                                  ? CrossFadeState.showSecond
                                  : CrossFadeState.showFirst,
                              firstChild:
                                  Image.asset("assets/images/plato.png"),
                              secondChild:
                                  Image.asset("assets/images/ramen.png"),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            AnimatedCrossFade(
                              duration: const Duration(milliseconds: 100),
                              crossFadeState: filosofo3.vecesComio >= 6
                                  ? CrossFadeState.showSecond
                                  : CrossFadeState.showFirst,
                              firstChild:
                                  Image.asset("assets/images/plato.png"),
                              secondChild:
                                  Image.asset("assets/images/ramen.png"),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Material(
                          color: Colors.black54,
                          borderRadius: BorderRadiusDirectional.circular(4),
                          child: SizedBox(
                            width: 120,
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Text(
                                filosofo3.mensaje,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontSize: 8,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        SizedBox(
                          width: 120,
                          child: Row(
                            children: [
                              const SizedBox(
                                width: 8,
                              ),
                              Expanded(
                                child: AspectRatio(
                                  aspectRatio: 1,
                                  child: Material(
                                    color: filosofo3.estado == 0
                                        ? Colors.red
                                        : Colors.grey,
                                    shape: const StadiumBorder(),
                                    child: const SizedBox(),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              Expanded(
                                child: AspectRatio(
                                  aspectRatio: 1,
                                  child: Material(
                                    color: filosofo3.estado == 1
                                        ? Colors.yellow
                                        : Colors.grey,
                                    shape: const StadiumBorder(),
                                    child: const SizedBox(),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              Expanded(
                                child: AspectRatio(
                                  aspectRatio: 1,
                                  child: Material(
                                    color: filosofo3.estado == 2
                                        ? Colors.green
                                        : Colors.grey,
                                    shape: const StadiumBorder(),
                                    child: const SizedBox(),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 120,
                          width: 120,
                          child: AspectRatio(
                            aspectRatio: 1,
                            child: GifImage(
                              controller: filosofo3.mensaje == "Comiendo..."
                                  ? controllerComiendo
                                  : controllerEsperando,
                              image: const AssetImage("assets/images/f11.gif"),
                            ),
                          ),
                        ),
                        Stack(
                          children: [
                            Transform.translate(
                              offset: const Offset(0, -24),
                              child: AnimatedOpacity(
                                opacity: filosofo3.tenedorIzquierdo ? 1 : 0,
                                duration: const Duration(milliseconds: 100),
                                child: SizedBox(
                                  width: 40,
                                  height: 40,
                                  child: Image.asset(
                                    "assets/images/fork.png",
                                    fit: BoxFit.cover,
                                    alignment: Alignment.bottomCenter,
                                    color: filosofo3.primerTenedor.color,
                                  ),
                                ),
                              ),
                            ),
                            Transform.translate(
                              offset: const Offset(0, -32),
                              child: Center(
                                child: AnimatedOpacity(
                                  opacity: filosofo3.estado == 2 ? 1 : 0,
                                  duration: const Duration(milliseconds: 100),
                                  child: SizedBox(
                                    width: 120,
                                    height: 56,
                                    child: Image.asset(
                                      "assets/images/food.png",
                                      fit: BoxFit.cover,
                                      alignment: Alignment.bottomCenter,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Transform.translate(
                              offset: const Offset(0, -24),
                              child: SizedBox(
                                width: 120,
                                child: Align(
                                  alignment: Alignment.topRight,
                                  child: AnimatedOpacity(
                                    opacity: filosofo3.tenedorDerecho ? 1 : 0,
                                    duration: const Duration(milliseconds: 100),
                                    child: SizedBox(
                                      width: 40,
                                      height: 40,
                                      child: Image.asset(
                                        "assets/images/fork.png",
                                        fit: BoxFit.cover,
                                        alignment: Alignment.topRight,
                                        color: filosofo3.segundoTenedor.color,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 100,
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          children: [
                            const SizedBox(
                              width: 8,
                            ),
                            AnimatedCrossFade(
                              duration: const Duration(milliseconds: 100),
                              crossFadeState: filosofo4.vecesComio >= 1
                                  ? CrossFadeState.showSecond
                                  : CrossFadeState.showFirst,
                              firstChild:
                                  Image.asset("assets/images/plato.png"),
                              secondChild:
                                  Image.asset("assets/images/ramen.png"),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            AnimatedCrossFade(
                              duration: const Duration(milliseconds: 100),
                              crossFadeState: filosofo4.vecesComio >= 2
                                  ? CrossFadeState.showSecond
                                  : CrossFadeState.showFirst,
                              firstChild:
                                  Image.asset("assets/images/plato.png"),
                              secondChild:
                                  Image.asset("assets/images/ramen.png"),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            AnimatedCrossFade(
                              duration: const Duration(milliseconds: 100),
                              crossFadeState: filosofo4.vecesComio >= 3
                                  ? CrossFadeState.showSecond
                                  : CrossFadeState.showFirst,
                              firstChild:
                                  Image.asset("assets/images/plato.png"),
                              secondChild:
                                  Image.asset("assets/images/ramen.png"),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            const SizedBox(
                              width: 8,
                            ),
                            AnimatedCrossFade(
                              duration: const Duration(milliseconds: 100),
                              crossFadeState: filosofo4.vecesComio >= 4
                                  ? CrossFadeState.showSecond
                                  : CrossFadeState.showFirst,
                              firstChild:
                                  Image.asset("assets/images/plato.png"),
                              secondChild:
                                  Image.asset("assets/images/ramen.png"),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            AnimatedCrossFade(
                              duration: const Duration(milliseconds: 100),
                              crossFadeState: filosofo4.vecesComio >= 5
                                  ? CrossFadeState.showSecond
                                  : CrossFadeState.showFirst,
                              firstChild:
                                  Image.asset("assets/images/plato.png"),
                              secondChild:
                                  Image.asset("assets/images/ramen.png"),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            AnimatedCrossFade(
                              duration: const Duration(milliseconds: 100),
                              crossFadeState: filosofo4.vecesComio >= 6
                                  ? CrossFadeState.showSecond
                                  : CrossFadeState.showFirst,
                              firstChild:
                                  Image.asset("assets/images/plato.png"),
                              secondChild:
                                  Image.asset("assets/images/ramen.png"),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Material(
                          color: Colors.black54,
                          borderRadius: BorderRadiusDirectional.circular(4),
                          child: SizedBox(
                            width: 120,
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Text(
                                filosofo4.mensaje,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontSize: 8,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        SizedBox(
                          width: 120,
                          child: Row(
                            children: [
                              const SizedBox(
                                width: 8,
                              ),
                              Expanded(
                                child: AspectRatio(
                                  aspectRatio: 1,
                                  child: Material(
                                    color: filosofo4.estado == 0
                                        ? Colors.red
                                        : Colors.grey,
                                    shape: const StadiumBorder(),
                                    child: const SizedBox(),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              Expanded(
                                child: AspectRatio(
                                  aspectRatio: 1,
                                  child: Material(
                                    color: filosofo4.estado == 1
                                        ? Colors.yellow
                                        : Colors.grey,
                                    shape: const StadiumBorder(),
                                    child: const SizedBox(),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              Expanded(
                                child: AspectRatio(
                                  aspectRatio: 1,
                                  child: Material(
                                    color: filosofo4.estado == 2
                                        ? Colors.green
                                        : Colors.grey,
                                    shape: const StadiumBorder(),
                                    child: const SizedBox(),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 120,
                          width: 120,
                          child: AspectRatio(
                            aspectRatio: 1,
                            child: GifImage(
                              controller: filosofo4.mensaje == "Comiendo..."
                                  ? controllerComiendo
                                  : controllerEsperando,
                              image: const AssetImage("assets/images/m3.gif"),
                            ),
                          ),
                        ),
                        Stack(
                          children: [
                            Transform.translate(
                              offset: const Offset(0, -24),
                              child: AnimatedOpacity(
                                opacity: filosofo4.tenedorIzquierdo ? 1 : 0,
                                duration: const Duration(milliseconds: 100),
                                child: SizedBox(
                                  width: 40,
                                  height: 40,
                                  child: Image.asset(
                                    "assets/images/fork.png",
                                    fit: BoxFit.cover,
                                    alignment: Alignment.bottomCenter,
                                    color: filosofo4.segundoTenedor.color,
                                  ),
                                ),
                              ),
                            ),
                            Transform.translate(
                              offset: const Offset(0, -32),
                              child: Center(
                                child: AnimatedOpacity(
                                  opacity: filosofo4.estado == 2 ? 1 : 0,
                                  duration: const Duration(milliseconds: 100),
                                  child: SizedBox(
                                    width: 120,
                                    height: 56,
                                    child: Image.asset(
                                      "assets/images/food.png",
                                      fit: BoxFit.cover,
                                      alignment: Alignment.bottomCenter,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Transform.translate(
                              offset: const Offset(0, -24),
                              child: SizedBox(
                                width: 120,
                                child: Align(
                                  alignment: Alignment.topRight,
                                  child: AnimatedOpacity(
                                    opacity: filosofo4.tenedorDerecho ? 1 : 0,
                                    duration: const Duration(milliseconds: 100),
                                    child: SizedBox(
                                      width: 40,
                                      height: 40,
                                      child: Image.asset(
                                        "assets/images/fork.png",
                                        fit: BoxFit.cover,
                                        alignment: Alignment.topRight,
                                        color: filosofo4.primerTenedor.color,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          children: [
                            const SizedBox(
                              width: 8,
                            ),
                            AnimatedCrossFade(
                              duration: const Duration(milliseconds: 100),
                              crossFadeState: filosofo5.vecesComio >= 1
                                  ? CrossFadeState.showSecond
                                  : CrossFadeState.showFirst,
                              firstChild:
                                  Image.asset("assets/images/plato.png"),
                              secondChild:
                                  Image.asset("assets/images/ramen.png"),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            AnimatedCrossFade(
                              duration: const Duration(milliseconds: 100),
                              crossFadeState: filosofo5.vecesComio >= 2
                                  ? CrossFadeState.showSecond
                                  : CrossFadeState.showFirst,
                              firstChild:
                                  Image.asset("assets/images/plato.png"),
                              secondChild:
                                  Image.asset("assets/images/ramen.png"),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            AnimatedCrossFade(
                              duration: const Duration(milliseconds: 100),
                              crossFadeState: filosofo5.vecesComio >= 3
                                  ? CrossFadeState.showSecond
                                  : CrossFadeState.showFirst,
                              firstChild:
                                  Image.asset("assets/images/plato.png"),
                              secondChild:
                                  Image.asset("assets/images/ramen.png"),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            const SizedBox(
                              width: 8,
                            ),
                            AnimatedCrossFade(
                              duration: const Duration(milliseconds: 100),
                              crossFadeState: filosofo5.vecesComio >= 4
                                  ? CrossFadeState.showSecond
                                  : CrossFadeState.showFirst,
                              firstChild:
                                  Image.asset("assets/images/plato.png"),
                              secondChild:
                                  Image.asset("assets/images/ramen.png"),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            AnimatedCrossFade(
                              duration: const Duration(milliseconds: 100),
                              crossFadeState: filosofo5.vecesComio >= 5
                                  ? CrossFadeState.showSecond
                                  : CrossFadeState.showFirst,
                              firstChild:
                                  Image.asset("assets/images/plato.png"),
                              secondChild:
                                  Image.asset("assets/images/ramen.png"),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            AnimatedCrossFade(
                              duration: const Duration(milliseconds: 100),
                              crossFadeState: filosofo5.vecesComio >= 6
                                  ? CrossFadeState.showSecond
                                  : CrossFadeState.showFirst,
                              firstChild:
                                  Image.asset("assets/images/plato.png"),
                              secondChild:
                                  Image.asset("assets/images/ramen.png"),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Material(
                          color: Colors.black54,
                          borderRadius: BorderRadiusDirectional.circular(4),
                          child: SizedBox(
                            width: 120,
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Text(
                                filosofo5.mensaje,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontSize: 8,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        SizedBox(
                          width: 120,
                          child: Row(
                            children: [
                              const SizedBox(
                                width: 8,
                              ),
                              Expanded(
                                child: AspectRatio(
                                  aspectRatio: 1,
                                  child: Material(
                                    color: filosofo5.estado == 0
                                        ? Colors.red
                                        : Colors.grey,
                                    shape: const StadiumBorder(),
                                    child: const SizedBox(),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              Expanded(
                                child: AspectRatio(
                                  aspectRatio: 1,
                                  child: Material(
                                    color: filosofo5.estado == 1
                                        ? Colors.yellow
                                        : Colors.grey,
                                    shape: const StadiumBorder(),
                                    child: const SizedBox(),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              Expanded(
                                child: AspectRatio(
                                  aspectRatio: 1,
                                  child: Material(
                                    color: filosofo5.estado == 2
                                        ? Colors.green
                                        : Colors.grey,
                                    shape: const StadiumBorder(),
                                    child: const SizedBox(),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 120,
                          width: 120,
                          child: AspectRatio(
                            aspectRatio: 1,
                            child: GifImage(
                              controller: filosofo5.mensaje == "Comiendo..."
                                  ? controllerComiendo
                                  : controllerEsperando,
                              image: const AssetImage("assets/images/m4.gif"),
                            ),
                          ),
                        ),
                        Stack(
                          children: [
                            Transform.translate(
                              offset: const Offset(0, -24),
                              child: AnimatedOpacity(
                                opacity: filosofo5.tenedorIzquierdo ? 1 : 0,
                                duration: const Duration(milliseconds: 100),
                                child: SizedBox(
                                  width: 40,
                                  height: 40,
                                  child: Image.asset(
                                    "assets/images/fork.png",
                                    fit: BoxFit.cover,
                                    alignment: Alignment.bottomCenter,
                                    color: filosofo5.primerTenedor.color,
                                  ),
                                ),
                              ),
                            ),
                            Transform.translate(
                              offset: const Offset(0, -32),
                              child: Center(
                                child: AnimatedOpacity(
                                  opacity: filosofo5.estado == 2 ? 1 : 0,
                                  duration: const Duration(milliseconds: 100),
                                  child: SizedBox(
                                    width: 120,
                                    height: 56,
                                    child: Image.asset(
                                      "assets/images/food.png",
                                      fit: BoxFit.cover,
                                      alignment: Alignment.bottomCenter,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Transform.translate(
                              offset: const Offset(0, -24),
                              child: SizedBox(
                                width: 120,
                                child: Align(
                                  alignment: Alignment.topRight,
                                  child: AnimatedOpacity(
                                    opacity: filosofo5.tenedorDerecho ? 1 : 0,
                                    duration: const Duration(milliseconds: 100),
                                    child: SizedBox(
                                      width: 40,
                                      height: 40,
                                      child: Image.asset(
                                        "assets/images/fork.png",
                                        fit: BoxFit.cover,
                                        alignment: Alignment.topRight,
                                        color: filosofo5.segundoTenedor.color,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            if (filosofo1.vecesComio == 6 &&
                filosofo2.vecesComio == 6 &&
                filosofo3.vecesComio == 6 &&
                filosofo4.vecesComio == 6 &&
                filosofo5.vecesComio == 6)
              Container(
                color: Colors.black54,
              ),
            if (filosofo1.vecesComio == 6 &&
                filosofo2.vecesComio == 6 &&
                filosofo3.vecesComio == 6 &&
                filosofo4.vecesComio == 6 &&
                filosofo5.vecesComio == 6)
              GestureDetector(
                onTap: () {
                  iniciarJuego();
                },
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      Text(
                        "Juego terminado",
                        style: TextStyle(
                          fontSize: 72,
                          fontWeight: FontWeight.bold,
                          color: Colors.white70,
                        ),
                      ),
                      Text(
                        "Presiona para reiniciar",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white70,
                        ),
                      ),
                    ],
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }
}
