import 'package:flutter/material.dart';

class RefundPolicyPage extends StatefulWidget {
  const RefundPolicyPage({Key? key}) : super(key: key);

  @override
  State<RefundPolicyPage> createState() => _RefundPolicyPageState();
}

class _RefundPolicyPageState extends State<RefundPolicyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Refund Policy'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
            const Text(
              'Thank you for choosing our astrology consultation services. We strive to provide accurate and insightful readings to enhance your understanding and guide you through various aspects of your life. Please read our refund policy carefully.',
              style: TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Refund Policy:',
              style: TextStyle(fontSize: 24.0),
            ),
            const Text(
              'Due to the nature of our astrology consultation services, we regret to inform you that no refunds are applicable after the consultation has been provided.',
              style: TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Cancellation Policy:',
              style: TextStyle(fontSize: 24.0),
            ),
            const Text(
              'If you need to cancel your scheduled consultation, we kindly ask for at least 24 hours notice prior to the scheduled time. In case of cancellation within this time frame, we will make every effort to reschedule your appointment at a convenient time for both parties.',
              style: TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'No-Show Policy:',
              style: TextStyle(fontSize: 24.0),
            ),
            const Text(
              'If you fail to attend the scheduled consultation without prior notice, it will be considered a no-show. In such cases, the consultation fee will be non-refundable.',
              style: TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Technical Issues:',
              style: TextStyle(fontSize: 24.0),
            ),
            const Text(
              'In the rare event of technical issues preventing the completion of the consultation, we will make every effort to resolve the problem promptly. If the issue persists, we may, at our discretion, reschedule the consultation or provide a partial refund.',
              style: TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Contact Us:',
              style: TextStyle(fontSize: 24.0),
            ),
            const Text(
              'If you encounter any issues or have questions about our refund policy, please contact our customer support.',
              style: TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Note:',
              style: TextStyle(fontSize: 24.0),
            ),
            const Text(
              'This refund policy is effective as of for now and may be subject to change in future. Any modifications will be posted on our website, and you are encouraged to review this policy periodically.',
              style: TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 16.0),
             const Text(
              'By engaging in our astrology consultation services, you acknowledge that you have read, understood, and agree to abide by this refund policy. Thank you for your understanding.',
              style: TextStyle(fontSize: 16.0),
            ),
          
          ],
        ),
      ),
    );
  }
}
