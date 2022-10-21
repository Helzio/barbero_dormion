import 'dart:async';
import 'dart:math';

import 'package:barbero_dormilon/presentation/pages/home/cliente.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:random_avatar/random_avatar.dart';
import 'package:random_name_generator/random_name_generator.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  Timer? timer;
  bool barberoTrabjanado = false;
  int sillasLibres = 3;
  List<Cliente> clientes = [];
  bool isPuause = false;

  int proximoCliente = 6;
  int tiempoTrabajo = 3;
  final tiempoTrabajoContante = 3;
  final random = Random();
  final int max = 6;
  final int min = 1;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(
        const Duration(seconds: 1), (Timer t) => generarProcesos());
  }

  void generarProcesos() {
    if (!isPuause) {
      barberoTrabjanado = clientes.isNotEmpty;

      if (tiempoTrabajo == 0) {
        setState(() {
          tiempoTrabajo = tiempoTrabajoContante;
          final cliente = clientes[0];
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.green.shade900,
              content: Row(
                children: [
                  cliente.image,
                  const SizedBox(
                    width: 16,
                  ),
                  Text(
                    'Trabajo finalizado!. ${cliente.name.split(" ")[0]} se fué.',
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              duration: const Duration(seconds: 1),
            ),
          );
          clientes.removeAt(0);
          barberoTrabjanado = clientes.isNotEmpty;
        });
      } else {
        if (barberoTrabjanado) {
          setState(() {
            tiempoTrabajo--;
          });
        }
      }

      if (proximoCliente == 0) {
        setState(() {
          if (clientes.length < 4) {
            final name = RandomNames(Zone.spain).name();
            clientes.add(
              Cliente(
                name: name,
                image: randomAvatar(name, height: 48, width: 48),
              ),
            );
            barberoTrabjanado = true;
          } else {
            final name = RandomNames(Zone.spain).name().split(" ")[0];
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: Colors.red.shade900,
                content: Row(
                  children: [
                    randomAvatar(name, height: 48, width: 48),
                    const SizedBox(
                      width: 16,
                    ),
                    Text(
                      '¡$name se fue por falta de espacio.',
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                duration: const Duration(seconds: 2),
              ),
            );
          }
          proximoCliente = min + random.nextInt(max - min);
        });
      } else {
        setState(() {
          proximoCliente--;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 56,
              child: Image.asset(
                "assets/images/barberpole.png",
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            const Text('EL BARBERO DORMILÓN'),
            const SizedBox(
              width: 16,
            ),
            SizedBox(
              width: 56,
              child: Image.asset(
                "assets/images/barberpole.png",
              ),
            ),
          ],
        ),
      ),
      body: InkWell(
        onTap: () {
          setState(() {
            isPuause = !isPuause;
          });
        },
        child: Stack(
          fit: StackFit.expand,
          children: [
            Row(
              children: [
                Expanded(
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 72.0, top: 16),
                      child: AspectRatio(
                        aspectRatio: 1,
                        child: Stack(
                          fit: StackFit.expand,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 144.0,
                              ),
                              child: Opacity(
                                opacity: .7,
                                child: SvgPicture.asset(
                                  "assets/images/fondo1.svg",
                                ),
                              ),
                            ),
                            Column(
                              children: [
                                const SizedBox(
                                  height: 24,
                                ),
                                const Text(
                                  "Proximo cliente:",
                                  style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                                Text(
                                  "(Número aleatorio de segundos entre $min y $max)",
                                  style: const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                LinearProgressIndicator(
                                  minHeight: 16,
                                  value: proximoCliente / max,
                                ),
                                const SizedBox(
                                  height: 32,
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        AspectRatio(
                                          aspectRatio: 1,
                                          child: Material(
                                            color: Colors.white,
                                            elevation: 8,
                                            shape: const StadiumBorder(),
                                            child: Stack(
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          bottom: 16.0,
                                                          left: 8),
                                                  child: AnimatedCrossFade(
                                                    duration: const Duration(
                                                      milliseconds: 300,
                                                    ),
                                                    crossFadeState:
                                                        clientes.length < 2
                                                            ? CrossFadeState
                                                                .showFirst
                                                            : CrossFadeState
                                                                .showSecond,
                                                    firstChild: Image.asset(
                                                      "assets/images/disponible.png",
                                                      fit: BoxFit.cover,
                                                    ),
                                                    secondChild: Image.asset(
                                                      "assets/images/cliente_esperando.png",
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                                Align(
                                                  alignment:
                                                      Alignment.bottomCenter,
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            bottom: 0.0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      children: [
                                                        Text(
                                                          clientes.length < 2
                                                              ? "Lugar\nDisponible"
                                                              : "${clientes[1].name.split(" ")[0]}\nEsperando",
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: clientes
                                                                        .length <
                                                                    2
                                                                ? Colors.green
                                                                    .shade900
                                                                : Colors.red
                                                                    .shade900,
                                                            fontSize: 10,
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                          height: 16,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                SizedBox.expand(
                                                  child: Opacity(
                                                    opacity: clientes.length > 1
                                                        ? 1
                                                        : 0,
                                                    child:
                                                        const CircularProgressIndicator(),
                                                  ),
                                                ),
                                                if (clientes.length > 1)
                                                  clientes[1].image,
                                              ],
                                            ),
                                          ),
                                        ),
                                        AspectRatio(
                                          aspectRatio: 1,
                                          child: Material(
                                            color: Colors.white,
                                            elevation: 8,
                                            shape: const StadiumBorder(),
                                            child: Stack(
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          bottom: 16.0,
                                                          left: 8),
                                                  child: AnimatedCrossFade(
                                                    duration: const Duration(
                                                      milliseconds: 300,
                                                    ),
                                                    crossFadeState:
                                                        clientes.length < 3
                                                            ? CrossFadeState
                                                                .showFirst
                                                            : CrossFadeState
                                                                .showSecond,
                                                    firstChild: Image.asset(
                                                      "assets/images/disponible.png",
                                                      fit: BoxFit.cover,
                                                    ),
                                                    secondChild: Image.asset(
                                                      "assets/images/cliente_esperando.png",
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                                Align(
                                                  alignment:
                                                      Alignment.bottomCenter,
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            bottom: 0.0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      children: [
                                                        Text(
                                                          clientes.length < 3
                                                              ? "Lugar\nDisponible"
                                                              : "${clientes[2].name.split(" ")[0]}\nEsperando",
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: clientes
                                                                        .length <
                                                                    3
                                                                ? Colors.green
                                                                    .shade900
                                                                : Colors.red
                                                                    .shade900,
                                                            fontSize: 10,
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                          height: 16,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                SizedBox.expand(
                                                  child: Opacity(
                                                    opacity: clientes.length > 2
                                                        ? 1
                                                        : 0,
                                                    child:
                                                        const CircularProgressIndicator(),
                                                  ),
                                                ),
                                                if (clientes.length > 2)
                                                  clientes[2].image,
                                              ],
                                            ),
                                          ),
                                        ),
                                        AspectRatio(
                                          aspectRatio: 1,
                                          child: Material(
                                            color: Colors.white,
                                            elevation: 8,
                                            shape: const StadiumBorder(),
                                            child: Stack(
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          bottom: 16.0,
                                                          left: 8),
                                                  child: AnimatedCrossFade(
                                                    duration: const Duration(
                                                      milliseconds: 300,
                                                    ),
                                                    crossFadeState:
                                                        clientes.length < 4
                                                            ? CrossFadeState
                                                                .showFirst
                                                            : CrossFadeState
                                                                .showSecond,
                                                    firstChild: Image.asset(
                                                      "assets/images/disponible.png",
                                                      fit: BoxFit.cover,
                                                    ),
                                                    secondChild: Image.asset(
                                                      "assets/images/cliente_esperando.png",
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                                Align(
                                                  alignment:
                                                      Alignment.bottomCenter,
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            bottom: 0.0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      children: [
                                                        Text(
                                                          clientes.length < 4
                                                              ? "Lugar\nDisponible"
                                                              : "${clientes[3].name.split(" ")[0]}\nEsperando",
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: clientes
                                                                        .length <
                                                                    4
                                                                ? Colors.green
                                                                    .shade900
                                                                : Colors.red
                                                                    .shade900,
                                                            fontSize: 10,
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                          height: 16,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                SizedBox.expand(
                                                  child: Opacity(
                                                    opacity: clientes.length > 3
                                                        ? 1
                                                        : 0,
                                                    child:
                                                        const CircularProgressIndicator(),
                                                  ),
                                                ),
                                                if (clientes.length > 3)
                                                  clientes[3].image,
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        flex: 4,
                                        child: AnimatedCrossFade(
                                          duration:
                                              const Duration(milliseconds: 300),
                                          crossFadeState: barberoTrabjanado
                                              ? CrossFadeState.showFirst
                                              : CrossFadeState.showSecond,
                                          firstChild: AspectRatio(
                                            aspectRatio: 16 / 9,
                                            child: Image.asset(
                                              "assets/images/trabajando.png",
                                              fit: BoxFit.fitHeight,
                                            ),
                                          ),
                                          secondChild: AspectRatio(
                                            aspectRatio: 16 / 9,
                                            child: Image.asset(
                                              "assets/images/durmiendo.png",
                                              fit: BoxFit.fitHeight,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: SizedBox(
                                            height: 56,
                                            child: barberoTrabjanado
                                                ? Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      clientes[0].image,
                                                      const SizedBox(
                                                        width: 8,
                                                      ),
                                                      Text(
                                                        "BARBERO TRABAJANDO EN ${clientes[0].name.split(" ")[0].toUpperCase()}...",
                                                        style: const TextStyle(
                                                          fontSize: 17,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.black,
                                                        ),
                                                      ),
                                                    ],
                                                  )
                                                : Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: const [
                                                      SizedBox(
                                                        height: 48,
                                                        width: 48,
                                                      ),
                                                      SizedBox(
                                                        width: 8,
                                                      ),
                                                      Text(
                                                        "BARBERO DURMIENDO...",
                                                        style: TextStyle(
                                                          fontSize: 17,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.black,
                                                        ),
                                                      ),
                                                    ],
                                                  )),
                                      )
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 32,
                                ),
                                const Text(
                                  "Tiempo de trabajo del Barbero:",
                                  style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                                Text(
                                  "($tiempoTrabajoContante segundos por cliente)",
                                  style: const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                LinearProgressIndicator(
                                  color: Colors.orange,
                                  minHeight: 16,
                                  value: tiempoTrabajo / 6,
                                ),
                                const SizedBox(
                                  height: 16,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            if (isPuause)
              Container(
                color: Colors.black54,
              ),
            if (isPuause)
              const Center(
                child: Text(
                  "Pause",
                  style: TextStyle(
                    fontSize: 72,
                    fontWeight: FontWeight.bold,
                    color: Colors.white70,
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }
}
