import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cliente.freezed.dart';

@freezed
class Cliente with _$Cliente {
  const Cliente._();
  const factory Cliente({
    required String name,
    required Widget image,
  }) = _Cliente;
}
