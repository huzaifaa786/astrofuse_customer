import 'dart:convert';

import 'package:AstroGuru/controllers/astromallController.dart';
import 'package:AstroGuru/controllers/razorPayController.dart';
import 'package:AstroGuru/controllers/splashController.dart';
import 'package:AstroGuru/views/phonepe.dart';
import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_translator/google_translator.dart';
import 'package:phonepe_payment_sdk/phonepe_payment_sdk.dart';

import '../controllers/walletController.dart';
import 'package:AstroGuru/utils/global.dart' as global;
import '../widget/commonAppbar.dart';

// ignore: must_be_immutable
class PaymentInformationScreen extends StatefulWidget {
  final double amount;
  final int? flag;
  PaymentInformationScreen({Key? key, required this.amount, this.flag})
      : super(key: key);

  @override
  State<PaymentInformationScreen> createState() =>
      _PaymentInformationScreenState();
}

class _PaymentInformationScreenState extends State<PaymentInformationScreen> {
  final WalletController walletController = Get.find<WalletController>();

  RazorPayController razorPay = Get.find<RazorPayController>();

  SplashController splashController = Get.find<SplashController>();

  AstromallController astromallController = Get.find<AstromallController>();

  @override
  Widget build(BuildContext context) {
    Object? result;

    String generateSha256Hash(String input) {
      var bytes = utf8.encode(input);
      var digest = sha256.convert(bytes);
      return digest.toString();
    }

    void handleError(error) {
                              print(result.toString());

      setState(() {
        if (error is Exception) {
          result = error.toString();
        } else {
          result = {"error": error};
        }
      });
    }

    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(56),
          child: CommonAppBar(
            title: 'Payment Information',
          )),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GetBuilder<WalletController>(builder: (c) {
            return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: Card(
                      elevation: 1,
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Payment Details',
                                    style: Get.textTheme.subtitle1!.copyWith(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15))
                                .translate(),
                            SizedBox(
                              height: 5,
                            ),
                            widget.flag == 1
                                ? Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('${astromallController.astroProductbyId[0].name}')
                                          .translate(),
                                      Text(
                                          '${global.getSystemFlagValueForLogin(global.systemFlagNameList.currency)} ${double.parse(astromallController.astroProductbyId[0].amount.toString())}'),
                                    ],
                                  )
                                : SizedBox(),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Total Amount').translate(),
                                Text(
                                    '${global.getSystemFlagValueForLogin(global.systemFlagNameList.currency)} ${widget.amount}'),
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('GST ${global.getSystemFlagValue(global.systemFlagNameList.gst)}%')
                                    .translate(),
                                Expanded(
                                  child: Align(
                                    alignment: Alignment.centerRight,
                                    child: Text(
                                        '${widget.amount * double.parse(global.getSystemFlagValue(global.systemFlagNameList.gst)) / 100}'),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Total Payable Amount',
                                        style: Get.textTheme.subtitle1!
                                            .copyWith(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500))
                                    .translate(),
                                Text(
                                    '${global.getSystemFlagValueForLogin(global.systemFlagNameList.currency)} ${(widget.amount + widget.amount * double.parse(global.getSystemFlagValue(global.systemFlagNameList.gst)) / 100).toStringAsFixed(2)}',
                                    style: Get.textTheme.subtitle1!.copyWith(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500)),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                ]);
          }),
        ),
      ),
      bottomSheet: SizedBox(
        height: 60,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextButton(
            onPressed: () async {
              razorPay.addWalletAmount = widget.amount;
              var totalAmount = widget.amount +
                  widget.amount *
                      double.parse(global
                          .getSystemFlagValue(global.systemFlagNameList.gst)) /
                      100;
              const saltKey = "ecca806c-2634-40ad-9ed1-dedf02b3b8ac";
              const saltIndex = 1;
              const apiEndPoint = "/pg/v1/pay";
              print('%%%%%%%%%%' + widget.amount.toString());

              PhonePePaymentSdk.init('PRODUCTION', 'aad9a1b06f6444619d527d7a18997534', 'TECHFUSEONLINE', true)
                  .then((isInitialized) => {
                        setState(() {
                          result = 'PhonePe SDK Initialized - $isInitialized';
                        })
                      })
                  .catchError((error) {
                handleError(error);
                return <dynamic>{};
              });

              var signature = await PhonePePaymentSdk.getPackageSignatureForAndroid();
              print('******************************** signature *****************');
              print(signature);
              final jsonData = {
                "merchantId": "TECHFUSEONLINE",
                "amount": totalAmount.toInt() * 100,
                "merchantTransactionId": DateTime.now().millisecondsSinceEpoch,
                "merchantUserId": "90809899098",
                "redirectUrl": "https://webhook.site/redirect-url",
                "redirectMode": "POST",
                "callbackUrl": "https://webhook.site/callback-url",
                "mobileNumber": "9999999999",
                "paymentInstrument": {"type": "PAY_PAGE"}
              };

              String jsonString = jsonEncode(jsonData);
              String base64Data = jsonString.toBase64;
              String dataToHash = base64Data + apiEndPoint + saltKey;
              String sHA256 = generateSha256Hash(dataToHash);

              print(base64Data);
              String body = base64Data;
              print('#' * 10);
              print("$sHA256###$saltIndex");
              String checksum = "$sHA256###$saltIndex";
              String callback = "flutterDemoApp";
              Map<String, String> pgHeaders = {
                "Content-Type": "application/json"
              };
              String packageName = "com.astrologically.app";

              try {
                PhonePePaymentSdk.startPGTransaction(body, callback, checksum,
                        pgHeaders, apiEndPoint, packageName)
                    .then((response) => {
                          setState(() {
                            if (response != null) {
                              String status = response['status'].toString();
                              String error = response['error'].toString();
                              if (status == 'SUCCESS') {
                                result = "Flow Completed - Status: Success!";
                                razorPay.addAMountToWallet();
                                print(
                                    '****************response a gya haaaa hehheheh');
                                print(response.toString());
                              } else {
                                result =
                                    "Flow Completed - Status: $status and Error: $error";
                              print(result.toString());

                              }
                            } else {
                              result = "Flow Incomplete";
                              print(result.toString());
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
              // Get.to(() => PhonePe(
              //     amount: widget.amount +
              //         widget.amount *
              //             double.parse(global.getSystemFlagValue(
              //                 global.systemFlagNameList.gst)) /
              //             100));
              // razorPay.update();
              // "${global.getSystemFlagValue(global.systemFlagNameList.paymentMode)}" == 'RazorPay' ? razorPay.openCheckout(amount + amount * double.parse(global.getSystemFlagValue(global.systemFlagNameList.gst)) / 100) : razorPay.cardDialog(paymentCallId: 1, amount: amount + amount * double.parse(global.getSystemFlagValue(global.systemFlagNameList.gst)) / 100);
            },
            child: Text('Proceed to Pay',
                    style: Get.textTheme.subtitle1!.copyWith(fontSize: 12))
                .translate(),
            style: ButtonStyle(
              padding: MaterialStateProperty.all(EdgeInsets.all(0)),
              backgroundColor:
                  MaterialStateProperty.all(Get.theme.primaryColor),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
