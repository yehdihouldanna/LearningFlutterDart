import 'package:bitcoin_ticker/coin_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io' show Platform;

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String selectedCurrency = "USD";
  double btc_value = 0.0;
  double eth_value = 0.0;
  double ltc_value = 0.0;

  CoinData btcData = CoinData();
  CoinData ethData = CoinData();
  CoinData ltcData = CoinData();

  void initiate() async {
    var btc = await btcData.getCoinExchangeRates("BTC", selectedCurrency);
    var eth = await ethData.getCoinExchangeRates("ETH", selectedCurrency);
    var ltc = await ltcData.getCoinExchangeRates("LTC", selectedCurrency);
    updateUI(btc, eth, ltc);
  }

  @override
  void initState() {
    super.initState();
    initiate();
  }

  void updateUI(dynamic btc, dynamic eth, dynamic ltc) {
    setState(() {
      if (btc == null || eth == null || ltc == null) {
        print("one of data is null");
        btc_value = -1;
        eth_value = -1;
        ltc_value = -1;
        return;
      }
      btc_value = btc["rate"];
      eth_value = eth["rate"];
      ltc_value = ltc["rate"];
    });
  }

  DropdownButton<String> androidDropDown() {
    List<DropdownMenuItem<String>> DropdownMenuItems = [];
    for (String currency in currenciesList) {
      DropdownMenuItems.add(
          DropdownMenuItem(child: Text(currency), value: currency));
    }
    return DropdownButton<String>(
        value: selectedCurrency,
        items: DropdownMenuItems,
        onChanged: (value) {
          setState(() async {
            selectedCurrency = value!;
            var btc = await btcData.getCoinExchangeRates("BTC", value);
            var eth = await ethData.getCoinExchangeRates("ETH", value);
            var ltc = await ltcData.getCoinExchangeRates("LTC", value);
            updateUI(btc, eth, ltc);
          });
        });
  }

  CupertinoPicker iOSPicker() {
    List<Text> PickerItems = [];
    for (String currency in currenciesList) {
      PickerItems.add(Text(currency));
    }
    return CupertinoPicker(
        backgroundColor: Colors.lightBlue,
        itemExtent: 70.0,
        onSelectedItemChanged: (selectedIndex) {
          print(selectedIndex);
        },
        children: PickerItems);
  }

  Widget getPicker() {
    try {
      if (Platform.isIOS) {
        return iOSPicker();
      }
    } catch (e) {}
    return androidDropDown();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                CoinCard("BTC", double.parse((btc_value).toStringAsFixed(2))),
                CoinCard("ETH", double.parse((eth_value).toStringAsFixed(2))),
                CoinCard("LTC", double.parse((ltc_value).toStringAsFixed(2))),
              ],
            ),
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.black,
            child: getPicker(),
          ),
        ],
      ),
    );
  }

  Card CoinCard(String name, double value) {
    return Card(
      color: Colors.black,
      elevation: 5.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                '1 $name = $value $selectedCurrency',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white70,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


// CoinAPIkey = "F24D4713-E665-4DB9-970B-64086C88787C"

// curl https://rest.coinapi.io/v1/exchangerate/BTC/USD?apikey=F24D4713-E665-4DB9-970B-64086C88787C
// curl https://rest.coinapi.io/v1/exchangerate/BTC?invert=false&apikey=F24D4713-E665-4DB9-970B-64086C88787C

// https://rest.coinapi.io/v1/exchangerate/BTC?invert=false&apikey=F24D4713-E665-4DB9-970B-64086C88787C