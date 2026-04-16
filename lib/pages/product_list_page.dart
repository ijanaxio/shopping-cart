// lib/pages/product_list_page.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/product.dart';
import '../models/cart_model.dart';
import 'cart_page.dart';

class ProductListPage extends StatefulWidget {
  const ProductListPage({super.key});

  @override
  State<ProductListPage> createState() =>
      _ProductListPageState();
}

class _ProductListPageState
    extends State<ProductListPage> {

  String searchText = '';
  String selectedCategory = 'All';
  final List<String> categories = [
    'All',
    'Electronics',
    'Accessories',
];

  @override
  Widget build(BuildContext context) {

    // Dummy products
    final products = [
  Product(
    id: '1',
    name: 'Laptop Gaming',
    price: 15000000,
    emoji: '💻',
    description: 'Laptop gaming performa tinggi',
    category: 'Electronics',
  ),
  Product(
    id: '2',
    name: 'Smartphone Pro',
    price: 8000000,
    emoji: '📱',
    description: 'Smartphone flagship terbaru',
    category: 'Electronics',
  ),
  Product(
    id: '3',
    name: 'Wireless Headphones',
    price: 1500000,
    emoji: '🎧',
    description: 'Headphones noise-cancelling',
    category: 'Accessories',
  ),
  Product(
    id: '4',
    name: 'Smart Watch',
    price: 3000000,
    emoji: '⌚',
    description: 'Smartwatch dengan health tracking',
    category: 'Accessories',
  ),
  Product(
    id: '5',
    name: 'Camera DSLR',
    price: 12000000,
    emoji: '📷',
    description: 'Kamera DSLR profesional',
    category: 'Electronics',
  ),
  Product(
    id: '6',
    name: 'Tablet Pro',
    price: 7000000,
    emoji: '📟',
    description: 'Tablet untuk produktivitas',
    category: 'Electronics',
  ),
];

    // 🔎 FILTER PRODUCTS
   final filteredProducts =
    products.where((product) {

  final matchesSearch = product.name
      .toLowerCase()
      .contains(searchText.toLowerCase());

  final matchesCategory =
      selectedCategory == 'All' ||
      product.category == selectedCategory;

  return matchesSearch && matchesCategory;

}).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
        actions: [

          // Cart badge
          Consumer<CartModel>(
            builder: (context, cart, child) {
              return Stack(
                children: [

                  IconButton(
                    icon: const Icon(Icons.shopping_cart),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              const CartPage(),
                        ),
                      );
                    },
                  ),

                  if (cart.itemCount > 0)
                    Positioned(
                      right: 8,
                      top: 8,
                      child: Container(
                        padding:
                            const EdgeInsets.all(4),
                        decoration:
                            const BoxDecoration(
                          color: Colors.red,
                          shape: BoxShape.circle,
                        ),
                        constraints:
                            const BoxConstraints(
                          minWidth: 16,
                          minHeight: 16,
                        ),
                        child: Text(
                          '${cart.itemCount}',
                          style:
                              const TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight:
                                FontWeight.bold,
                          ),
                          textAlign:
                              TextAlign.center,
                        ),
                      ),
                    ),
                ],
              );
            },
          ),

          const SizedBox(width: 8),
        ],
      ),

      body: Column(
        children: [

          // 🔎 SEARCH BAR
          Padding(
    padding: const EdgeInsets.all(8),
    child: TextField(
      decoration: const InputDecoration(
        hintText: 'Search product...',
        prefixIcon: Icon(Icons.search),
        border: OutlineInputBorder(),
      ),
      onChanged: (value) {
        setState(() {
          searchText = value;
        });
      },
    ),
  ),
  Padding(
  padding: const EdgeInsets.symmetric(horizontal: 8),
  child: DropdownButtonFormField<String>(
    value: selectedCategory,

    decoration: const InputDecoration(
      labelText: 'Select Category',
      border: OutlineInputBorder(),
    ),

    items: categories.map((category) {
      return DropdownMenuItem(
        value: category,
        child: Text(category),
      );
    }).toList(),

        onChanged: (value) {
      setState(() {
        selectedCategory = value ?? 'All';
      });
    },
  ),
),

const SizedBox(height: 8),

          // PRODUCT GRID
          Expanded(
            child: GridView.builder(
              padding:
                  const EdgeInsets.all(16),

              gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.7,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),

              itemCount:
                  filteredProducts.length,

              itemBuilder:
                  (context, index) {

                final product =
                    filteredProducts[index];

                return Card(
                  elevation: 3,
                  child: Column(
                    children: [

                      // Emoji Product
                      Expanded(
                        child: Container(
                          color: Colors
                              .deepPurple
                              .shade50,
                          child: Center(
                            child: Text(
                              product.emoji,
                              style:
                                  const TextStyle(
                                fontSize: 64,
                              ),
                            ),
                          ),
                        ),
                      ),

                      // Product Info
                      Padding(
                        padding:
                            const EdgeInsets
                                .all(8),
                        child: Column(
                          children: [

                            Text(
                              product.name,
                              maxLines: 2,
                              overflow:
                                  TextOverflow
                                      .ellipsis,
                              textAlign:
                                  TextAlign.center,
                              style:
                                  const TextStyle(
                                fontWeight:
                                    FontWeight
                                        .bold,
                                fontSize: 14,
                              ),
                            ),

                            const SizedBox(
                                height: 4),

                            Text(
                              'Rp ${product.price.toStringAsFixed(0)}',
                              style: TextStyle(
                                color:
                                    Colors.green[
                                        700],
                                fontWeight:
                                    FontWeight
                                        .w600,
                                fontSize: 14,
                              ),
                            ),

                            const SizedBox(
                                height: 8),

                            SizedBox(
                              width:
                                  double.infinity,
                              child:
                                  ElevatedButton
                                      .icon(
                                onPressed: () {

                                  context
                                      .read<
                                          CartModel>()
                                      .addItem(
                                          product);

                                  ScaffoldMessenger
                                          .of(
                                              context)
                                      .showSnackBar(
                                    SnackBar(
                                      content:
                                          Text(
                                        '${product.name} ditambahkan ke cart!',
                                      ),
                                      duration:
                                          const Duration(
                                              seconds:
                                                  1),
                                      behavior:
                                          SnackBarBehavior
                                              .floating,
                                    ),
                                  );
                                },

                                icon:
                                    const Icon(
                                  Icons
                                      .add_shopping_cart,
                                  size: 16,
                                ),

                                label:
                                    const Text(
                                  'Add',
                                  style:
                                      TextStyle(
                                    fontSize:
                                        12,
                                  ),
                                ),

                                style:
                                    ElevatedButton
                                        .styleFrom(
                                  padding:
                                      const EdgeInsets
                                          .symmetric(
                                    vertical: 8,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}