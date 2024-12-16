import 'package:flutter/material.dart';
import 'package:my_profile_app/features/crypto_app/domain/assetmodel.dart';

class AssetController {
  static List<Asset> getAssets() {
    return [
      Asset(
        icon: Icons.currency_bitcoin,
        name: 'Bitcoin',
        symbol: 'BTC',
        price: 23746.15,
        change: 1.98,
      ),
      Asset(
        icon: Icons.currency_bitcoin,
        name: 'Ethereum',
        symbol: 'ETH',
        price: 1698.22,
        change: -2.63,
      ),
      Asset(
        icon: Icons.currency_exchange,
        name: 'Litecoin',
        symbol: 'LTC',
        price: 4756.94,
        change: -0.71,
      ),
    ];
  }
}
