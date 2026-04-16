// lib/pages/checkout_page.dart

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/cart_model.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({super.key});

  @override
  State<CheckoutPage> createState() =>
      _CheckoutPageState();
}

class _CheckoutPageState
    extends State<CheckoutPage> {

  final nameController =
      TextEditingController();

  final addressController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {

    final cart =
        Provider.of<CartModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkout'),
      ),

      body: Padding(
        padding:
            const EdgeInsets.all(16),

        child: Column(
          children: [

            // ORDER SUMMARY
            const Align(
              alignment:
                  Alignment.centerLeft,
              child: Text(
                'Order Summary',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight:
                      FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 8),

            Expanded(
              child: ListView.builder(
                itemCount:
                    cart.itemsList.length,

                itemBuilder:
                    (context, index) {

                  final item =
                      cart.itemsList[index];

                  return ListTile(
                    leading: Text(
                      item.product.emoji,
                      style:
                          const TextStyle(
                        fontSize: 24,
                      ),
                    ),

                    title:
                        Text(item.product.name),

                    subtitle: Text(
                        '${item.quantity} x Rp ${item.product.price.toStringAsFixed(0)}'),

                    trailing: Text(
                      'Rp ${item.totalPrice.toStringAsFixed(0)}',
                      style:
                          const TextStyle(
                        fontWeight:
                            FontWeight.bold,
                      ),
                    ),
                  );
                },
              ),
            ),

            const Divider(),

            // TOTAL PRICE
            Row(
              mainAxisAlignment:
                  MainAxisAlignment
                      .spaceBetween,
              children: [

                const Text(
                  'Total:',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight:
                        FontWeight.bold,
                  ),
                ),

                Text(
                  'Rp ${cart.totalPrice.toStringAsFixed(0)}',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight:
                        FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 16),

            // NAME FIELD
            TextField(
              controller: nameController,
              decoration:
                  const InputDecoration(
                labelText: 'Nama',
                border:
                    OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 12),

            // ADDRESS FIELD
            TextField(
              controller:
                  addressController,
              maxLines: 2,
              decoration:
                  const InputDecoration(
                labelText: 'Alamat',
                border:
                    OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 16),

            // PLACE ORDER BUTTON
            SizedBox(
              width: double.infinity,

              child: ElevatedButton(
                onPressed: () {

                  if (nameController
                          .text
                          .isEmpty ||
                      addressController
                          .text
                          .isEmpty) {

                    ScaffoldMessenger.of(
                            context)
                        .showSnackBar(
                      const SnackBar(
                        content: Text(
                          'Isi nama dan alamat!',
                        ),
                      ),
                    );

                    return;
                  }

                  // CLEAR CART
                  cart.clear();

                  // SUCCESS MESSAGE
                  ScaffoldMessenger.of(
                          context)
                      .showSnackBar(
                    const SnackBar(
                      content: Text(
                        'Order berhasil!',
                      ),
                    ),
                  );

                  Navigator.pop(context);
                },

                child: const Text(
                  'Place Order',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}