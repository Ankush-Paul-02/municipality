import 'package:flutter/material.dart';
import 'package:municipality/src/theme/colors.dart';
import 'package:sizer/sizer.dart';
import 'package:velocity_x/velocity_x.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  final List<Map<String, dynamic>> taxes = [
    {
      'type': 'Income Tax',
      'amount': 100.0,
    },
    {
      'type': 'Property Tax',
      'amount': 50.0,
    },
    {
      'type': 'Sales Tax',
      'amount': 25.0,
    },
    {
      'type': 'Service Tax',
      'amount': 30.0,
    },
    {
      'type': 'VAT',
      'amount': 20.0,
    },
    {
      'type': 'Excise Duty',
      'amount': 40.0,
    },
    {
      'type': 'Customs Duty',
      'amount': 60.0,
    },
    {
      'type': 'Capital Gains Tax',
      'amount': 70.0,
    },
    {
      'type': 'Corporate Tax',
      'amount': 90.0,
    },
    {
      'type': 'Value Added Tax',
      'amount': 35.0,
    },
  ];

  void _handlePayment(BuildContext context, Map<String, dynamic> tax) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Payment Confirmation'),
          content: Text(
              'You are about to pay \$${tax['amount']} for ${tax['type']}.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close the dialog
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Proceed'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color4,
      appBar: AppBar(
        backgroundColor: color4,
        title: 'User Screen'.text.size(32).bold.make().centered(),
        toolbarHeight: 120,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 50.w,
              padding: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 20,
              ),
              decoration: const BoxDecoration(
                color: color1,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: 'User Details'.text.bold.white.size(26).make(),
            ),
            20.heightBox,
            Row(
              children: [
                const CircleAvatar(
                  radius: 65,
                  backgroundImage: NetworkImage(
                    'https://plus.unsplash.com/premium_photo-1682724602143-a77d75d273b1?w=400&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8cGVyc29ufGVufDB8fDB8fHww',
                  ),
                ),
                20.widthBox,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    'Ayush Panday'.text.size(22).color(color1).bold.make(),
                    'Aadhar no: 7609 XXXX XXXX'.text.size(16).color(color2).semiBold.make(),
                    'Phone no: +91 6909XXXXXX'.text.size(16).color(color2).semiBold.make(),
                    'Pan no: XYZABFHIEHS'.text.size(16).color(color2).semiBold.make(),
                    'Address: ABC Road, Kolkata'.text.size(16).color(color2).semiBold.make(),
                  ],
                )
              ],
            ).pSymmetric(h: 20),
            30.heightBox,
            Container(
              width: 50.w,
              padding: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 20,
              ),
              decoration: const BoxDecoration(
                color: color1,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: 'Taxes to Pay'.text.bold.white.size(26).make(),
            ),
            ListView.builder(
              itemCount: taxes.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return ListTile(
                  title: '${taxes[index]['type']} - ₹${taxes[index]['amount']}'
                      .text
                      .size(18)
                      .color(color1)
                      .semiBold
                      .make(),
                  trailing: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: color3,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {
                      _handlePayment(context, taxes[index]);
                    },
                    child: 'Pay'.text.white.size(16).make(),
                  ),
                ).p(8);
              },
            ),
          ],
        ),
      ),
    );
  }
}
