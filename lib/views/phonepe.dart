import 'dart:convert';
import 'dart:ffi';
import 'dart:io';

import 'package:AstroGuru/views/upi_app.dart';
import 'package:flutter/material.dart';
import 'package:phonepe_payment_sdk/phonepe_payment_sdk.dart';
import 'package:crypto/crypto.dart';

class PhonePe extends StatefulWidget {
  const PhonePe({super.key, this.amount});

  final double? amount;
  @override
  State<PhonePe> createState() => MerchantScreen();
}

class MerchantScreen extends State<PhonePe> {
  String body = "";
  String callback = "flutterDemoApp";
  String checksum = "";

  Map<String, String> headers = {};
  Map<String, String> pgHeaders = {"Content-Type": "application/json"};
  List<String> apiList = <String>['Container', 'PG'];
  List<String> environmentList = <String>['UAT', 'UAT_SIM', 'PRODUCTION'];
  String apiEndPoint = "/pg/v1/pay";
  bool enableLogs = true;
  Object? result;
  String dropdownValue = 'PG';
  String environmentValue = 'UAT_SIM';
  String appId = "";
  String merchantId = "TECHFUSEONLINE";
  String packageName = "com.astrologically.app";

  void startTransaction() async{
    const saltKey = "099eb0cd-02cf-4e2a-8aca-3e6c6aff0399";
    const saltIndex = 1;
    const apiEndpoint = "/pg/v1/pay";
    print('%%%%%%%%%%'+ widget.amount.toString());
    final jsonData = {
      "merchantId": "PGTESTPAYUAT",
      "amount": widget.amount!.toInt() * 100,
       "merchantTransactionId": "MT7850590068188104",
      "merchantUserId": "MU933037302229373",
      "redirectUrl": "https://webhook.site/redirect-url",
      "redirectMode": "POST",
      "callbackUrl": "https://webhook.site/callback-url",
      "mobileNumber": "9999999999",
      "paymentInstrument": {"type": "PAY_PAGE"}
    };

    String jsonString = jsonEncode(jsonData);
    String base64Data = jsonString.toBase64;
    String dataToHash = base64Data + apiEndpoint + saltKey;
    String sHA256 = generateSha256Hash(dataToHash);

    print(base64Data);
    body = base64Data;
    print('#' * 10);
    print("$sHA256###$saltIndex");
    checksum = "$sHA256###$saltIndex";
    setState(() {
      
    });


    print('ye raha hamara checksum');
    print(checksum);
    dropdownValue == 'Container'
        ? startContainerTransaction()
        : startPGTransaction();
  }

  void initPhonePeSdk() {
    PhonePePaymentSdk.init(environmentValue, appId, merchantId, enableLogs)
        .then((isInitialized) => {
              setState(() {
                result = 'PhonePe SDK Initialized - $isInitialized';
              })
            }) 
        .catchError((error) {
      handleError(error);
      return <dynamic>{};
    });
  }

  

    String generateSha256Hash(String input) {
    var bytes = utf8.encode(input);
    var digest = sha256.convert(bytes);
    return digest.toString();
  }

  void isPhonePeInstalled() {
    PhonePePaymentSdk.isPhonePeInstalled()
        .then((isPhonePeInstalled) => {
              setState(() {
                result = 'PhonePe Installed - $isPhonePeInstalled';
              })
            })
        .catchError((error) {
      handleError(error);
      return <dynamic>{};
    });
  }

  void isGpayInstalled() {
    PhonePePaymentSdk.isGPayAppInstalled()
        .then((isGpayInstalled) => {
              setState(() {
                result = 'GPay Installed - $isGpayInstalled';
              })
            })
        .catchError((error) {
      handleError(error);
      return <dynamic>{};
    });
  }

  void isPaytmInstalled() {
    PhonePePaymentSdk.isPaytmAppInstalled()
        .then((isPaytmInstalled) => {
              setState(() {
                result = 'Paytm Installed - $isPaytmInstalled';
              })
            })
        .catchError((error) {
      handleError(error);
      return <dynamic>{};
    });
  }

  void getPackageSignatureForAndroid() {
    if (Platform.isAndroid) {
      PhonePePaymentSdk.getPackageSignatureForAndroid()
          .then((packageSignature) => {
                setState(() {
                  result = 'getPackageSignatureForAndroid - $packageSignature';
                })
              })
          .catchError((error) {
        handleError(error);
        return <dynamic>{};
      });
    }
  }

  void getInstalledUpiAppsForAndroid() {
    if (Platform.isAndroid) {
      PhonePePaymentSdk.getInstalledUpiAppsForAndroid()
          .then((apps) => {
                setState(() {
                  if (apps != null) {
                    Iterable l = json.decode(apps);
                    List<UPIApp> upiApps = List<UPIApp>.from(
                        l.map((model) => UPIApp.fromJson(model)));
                    String appString = '';
                    for (var element in upiApps) {
                      appString +=
                          "${element.applicationName} ${element.version} ${element.packageName}";
                    }
                    result = 'Installed Upi Apps - $appString';
                  } else {
                    result = 'Installed Upi Apps - 0';
                  }
                })
              })
          .catchError((error) {
        handleError(error);
        return <dynamic>{};
      });
    }
  }

  void startPGTransaction() async {
    try {
      PhonePePaymentSdk.startPGTransaction(
              body, callback, checksum, pgHeaders, apiEndPoint, packageName)
          .then((response) => {
                setState(() {
                  if (response != null) {
                    String status = response['status'].toString();
                    String error = response['error'].toString();
                    if (status == 'SUCCESS') {
                      result = "Flow Completed - Status: Success!";
                    } else {
                      result =
                          "Flow Completed - Status: $status and Error: $error";
                    }
                  } else {
                    result = "Flow Incomplete";
                  }
                })
              })
          .catchError((error) {
        handleError(error);
        return <dynamic>{};
      });
    } catch (error) {
      handleError(error);
    }
  }

  void handleError(error) {
    setState(() {
      if (error is Exception) {
        result = error.toString();
      } else {
        result = {"error": error};
      }
    });
  }

  void startContainerTransaction() async {
    try {
      PhonePePaymentSdk.startContainerTransaction(
              body, callback, checksum, headers, apiEndPoint)
          .then((response) => {
                setState(() {
                  if (response != null) {
                    String status = response['status'].toString();
                    String error = response['error'].toString();
                    if (status == 'SUCCESS') {
                      result = "Flow Completed - Status: Success!";
                    } else {
                      result =
                          "Flow Completed - Status: $status and Error: $error";
                    }
                  } else {
                    result = "Flow Incomplete";
                  }
                })
              })
          .catchError((error) {
        handleError(error);
        return <dynamic>{};
      });
    } catch (error) {
      result = {"error": error};
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Flutter Merchant Demo App'),
          ),
          body: SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.all(7),
              child: Column(
                children: <Widget>[
                  TextField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Merchant Id',
                    ),
                    onChanged: (text) {
                      merchantId = text;
                    },
                  ),
                  TextField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'App Id',
                    ),
                    onChanged: (text) {
                      appId = text;
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      const Text('Select the environment'),
                      DropdownButton<String>(
                        value: environmentValue,
                        icon: const Icon(Icons.arrow_downward),
                        elevation: 16,
                        underline: Container(
                          height: 2,
                          color: Colors.black,
                        ),
                        onChanged: (String? value) {
                          setState(() {
                            environmentValue = value!;
                            if (environmentValue == 'PRODUCTION') {
                              packageName = "com.phonepe.app";
                            } else if (environmentValue == 'UAT') {
                              packageName = "com.phonepe.app.preprod";
                            } else if (environmentValue == 'UAT_SIM') {
                              packageName = "com.phonepe.simulator";
                            }
                          });
                        },
                        items: environmentList
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      )
                    ],
                  ),
                  Visibility(
                      maintainSize: false,
                      maintainAnimation: false,
                      maintainState: false,
                      visible: Platform.isAndroid,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            const SizedBox(height: 10),
                            Text("Package Name: $packageName"),
                          ])),
                  const SizedBox(height: 10),
                  Row(
                    children: <Widget>[
                      Checkbox(
                          value: enableLogs,
                          onChanged: (state) {
                            setState(() {
                              enableLogs = state!;
                            });
                          }),
                      const Text("Enable Logs")
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Warning: Init SDK is Mandatory to use all the functionalities*',
                    style: TextStyle(color: Colors.red),
                  ),
                  ElevatedButton(
                      onPressed: initPhonePeSdk, child: const Text('INIT SDK')),
                  const SizedBox(width: 5.0),
                  TextField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'body',
                    ),
                    onChanged: (text) {
                      body = text;
                    },
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'checksum',
                    ),
                    onChanged: (text) {
                      checksum = text;
                    },
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      const Text('Select the transaction type'),
                      DropdownButton<String>(
                        value: dropdownValue,
                        icon: const Icon(Icons.arrow_downward),
                        elevation: 16,
                        underline: Container(
                          height: 2,
                          color: Colors.black,
                        ),
                        onChanged: (String? value) {
                          // This is called when the user selects an item.
                          setState(() {
                            dropdownValue = value!;
                            if (dropdownValue == 'PG') {
                              apiEndPoint = "/pg/v1/pay";
                            } else {
                              apiEndPoint = "/v4/debit";
                            }
                          });
                        },
                        items: apiList
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      )
                    ],
                  ),
                  ElevatedButton(
                      onPressed: startTransaction,
                      child: const Text('Start Transaction')),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Expanded(
                            child: ElevatedButton(
                                onPressed: isPhonePeInstalled,
                                child: const Text('PhonePe App'))),
                        const SizedBox(width: 5.0),
                        Expanded(
                            child: ElevatedButton(
                                onPressed: isGpayInstalled,
                                child: const Text('Gpay App'))),
                        const SizedBox(width: 5.0),
                        Expanded(
                            child: ElevatedButton(
                                onPressed: isPaytmInstalled,
                                child: const Text('Paytm App'))),
                      ]),
                  Visibility(
                      maintainSize: false,
                      maintainAnimation: false,
                      maintainState: false,
                      visible: Platform.isAndroid,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Expanded(
                                child: ElevatedButton(
                                    onPressed: getPackageSignatureForAndroid,
                                    child:
                                        const Text('Get Package Signature'))),
                            const SizedBox(width: 5.0),
                            Expanded(
                                child: ElevatedButton(
                                    onPressed: getInstalledUpiAppsForAndroid,
                                    child: const Text('Get UPI Apps'))),
                            const SizedBox(width: 5.0),
                          ])),
                  Text("Result: \n $result")
                ],
              ),
            ),
          )),
    );
  }
}


extension EncodingExtensions on String {
  /// To Base64
  /// This is used to convert the string to base64
  String get toBase64 {
    return base64.encode(toUtf8);
  }

  /// To Utf8
  /// This is used to convert the string to utf8
  List<int> get toUtf8 {
    return utf8.encode(this);
  }

  /// To Sha256
  /// This is used to convert the string to sha256
  String get toSha256 {
    return sha256.convert(toUtf8).toString();
  }
}
