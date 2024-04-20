// ignore_for_file: prefer_const_constructors

import 'package:airyshare/functions/01_BasicClass_02.dart';
import 'package:flutter/material.dart';

class AddPaymentListPage extends StatefulWidget {
  const AddPaymentListPage({super.key});

  @override
  State<AddPaymentListPage> createState() => _AddPaymentListPageState();
}

class _AddPaymentListPageState extends State<AddPaymentListPage> {
  final TextEditingController programNameController = TextEditingController();
  final TextEditingController subItemsController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController totalPriceController = TextEditingController();

  List<Widget> rows = [];

  double calculateTotalPrice() {
    double totalPrice = 0.0;
    for (var controller in priceControllers) {
      if (controller.text.isNotEmpty) {
        totalPrice += double.parse(controller.text);
      }
    }
    print('Total Price : $totalPrice');
    return totalPrice;
  }

  List<TextEditingController> priceControllers = [];
  List<TextEditingController> subItemsControllers = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xffCDB4DB),
      body: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          MyTitle.build('Add \nPayment'),
          Padding(
            padding:
                const EdgeInsets.only(left: 20, right: 20, top: 16, bottom: 12),
            child: TextField(
              controller: programNameController,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: 'ชื่อรายการ',
                border: OutlineInputBorder(borderSide: BorderSide.none),
                contentPadding: EdgeInsets.all(8),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: rows.length,
              itemBuilder: (context, index) {
                return rows[index];
              },
            ),
          ),
          IconButton(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 50),
            onPressed: () {
              setState(() {
                TextEditingController newPriceController = TextEditingController();
                priceControllers.add(newPriceController);

                TextEditingController newSubItemsController = TextEditingController();
                subItemsControllers.add(newSubItemsController);

                rows.add(
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MyTextField1.build('รายการย่อย', newSubItemsController),
                        MyTextField2.build('ราคา', newPriceController),
                      ],
                    ),
                  ),
                );
              });
            },
            icon: Container(
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: Color.fromARGB(255, 174, 107, 194),
              ),
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
          ),
          IconButton(
            onPressed: () {
              double totalPrice = calculateTotalPrice();
              totalPriceController.text = totalPrice.toString();
            },
            icon: Container(
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: Color.fromARGB(255, 152, 99, 168),
                ),
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: Icon(
                  Icons.arrow_downward,
                  color: Colors.white,
                )),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: TextField(
              controller: totalPriceController,
              readOnly: true,
              decoration: const InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: 'ราคารวมทั้งหมด',
                border: OutlineInputBorder(borderSide: BorderSide.none),
                contentPadding: EdgeInsets.all(8),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
