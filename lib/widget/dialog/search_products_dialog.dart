import 'package:flutter/material.dart';
import 'package:personal_finance/mock/mocked_products.dart';
import 'package:personal_finance/model/product.dart';
import 'package:personal_finance/widget/dialog/base_dialog.dart';

class SearchProductsDialog extends StatefulWidget {
  final Function(Product) callback;

  const SearchProductsDialog({super.key, required this.callback});

  @override
  State<SearchProductsDialog> createState() => _SearchProductsDialogState();
}

class _SearchProductsDialogState extends State<SearchProductsDialog> {
  late List<Product> products;
  late List<Product> filteredProducts;

  @override
  void initState() {
    super.initState();
    products = mockedProducts;
    filteredProducts = products;
  }

  @override
  Widget build(BuildContext context) {
    return BaseDialog(
      title: "Pesquisar Produtos",
      children: [
        SizedBox(
          width: 250,
          child: TextField(
            style: const TextStyle(),
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Nome do produto",
            ),
            onChanged: (String value) {
              filterProducts(value);
            },
          ),
        ),
        const SizedBox(height: 32.0),
        SizedBox(
          width: 350,
          height: 300,
          child: ListView.separated(
            itemBuilder: (BuildContext buildContext, int index) {
              return InkWell(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(filteredProducts[index].name),
                          Text("ID: ${filteredProducts[index].id}"),
                        ],
                      ),
                      const SizedBox(
                        height: 6.0,
                      ),
                      Text(
                        "Categoria: ${filteredProducts[index].category.name}",
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                ),
                onTap: () {
                  widget.callback(filteredProducts[index]);
                  Navigator.pop(context);
                },
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return const Divider();
            },
            itemCount: filteredProducts.length,
          ),
        ),
        const SizedBox(height: 32.0),
        Row(
          children: [
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("Fechar")),
          ],
        ),
      ],
    );
  }

  void filterProducts(String value) {
    if (value == "") {
      setState(() {
        filteredProducts = this.products;
      });
      return;
    }

    List<Product> products = [];

    for (int i = 0; i < this.products.length; i++) {
      if (this.products[i].name.toLowerCase().contains(value.toLowerCase()) ||
          this
              .products[i]
              .category
              .name
              .toLowerCase()
              .contains(value.toLowerCase())) {
        products.add(this.products[i]);
      }
    }

    setState(() {
      filteredProducts = products;
    });
  }
}
