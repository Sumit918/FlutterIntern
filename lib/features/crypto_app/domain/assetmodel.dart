import 'package:flutter/material.dart';

class Asset {
  final IconData icon;
  final String name;
  final String symbol;
  final double price;
  final double change;

  Asset({
    required this.icon,
    required this.name,
    required this.symbol,
    required this.price,
    required this.change,
  });
}
