import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
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
      body: Stack(
        fit: StackFit.expand,
        children: [
          Opacity(
              opacity: .8, child: SvgPicture.asset("assets/images/fondo1.svg")),
          Column(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Image.asset(
                          "assets/images/cliente_esperando.png",
                        ),
                      ),
                    ),
                    Expanded(
                      child: Image.asset(
                        "assets/images/cliente_esperando.png",
                      ),
                    ),
                    Expanded(
                      child: Image.asset(
                        "assets/images/cliente_esperando.png",
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(),
              ),
              Expanded(
                flex: 2,
                child: Image.asset(
                  "assets/images/barbero_trabajando2.png",
                ),
              ),
              const SizedBox(
                height: 32,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
