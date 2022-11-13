import 'package:flutter/material.dart';

class Fork {
  int valor = 1;
  Color color;
  Fork({
    required this.color,
  });

  Future<void> decrease() async {
    while (valor <= 0) {
      await Future.delayed(const Duration(milliseconds: 1));
    }
    valor--;
  }

  void increase() {
    valor++;
  }
}
