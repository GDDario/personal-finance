import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart' as intl;
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:personal_finance/enum/transaction_type.dart';
import 'package:personal_finance/mock/mocked_establishments.dart';
import 'package:personal_finance/mock/mocked_items.dart';
import 'package:personal_finance/mock/mocked_payments.dart';
import 'package:personal_finance/mock/mocked_products.dart';
import 'package:personal_finance/model/establishment.dart';
import 'package:personal_finance/model/item.dart';
import 'package:personal_finance/model/payment.dart';
import 'package:personal_finance/model/product.dart';
import 'package:personal_finance/model/transaction.dart';
import 'package:personal_finance/widget/dialog/base_dialog.dart';
import 'package:personal_finance/widget/date_picker_text_field.dart';
import 'package:personal_finance/widget/dialog/search_establishment_dialog.dart';
import 'package:personal_finance/widget/dialog/search_products_dialog.dart';
import 'package:personal_finance/widget/search_text_field.dart';

class NewTransactionSection extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _NewTransactionSectionState();
}

class _NewTransactionSectionState extends State<NewTransactionSection> {
  DateTime selectedDate = DateTime.now();
  final List<DropdownMenuEntry<TransactionType>> transactionEntries =
      <DropdownMenuEntry<TransactionType>>[];
  final List<DropdownMenuEntry<Payment>> paymentEntries =
      <DropdownMenuEntry<Payment>>[];
  TextEditingController dateController = TextEditingController();
  TextEditingController establishmentController = TextEditingController();
  TextEditingController newItemController = TextEditingController();
  TextEditingController discountController = TextEditingController();
  TextEditingController additionController = TextEditingController();
  late List<Payment> payments = mockedPayments;
  late List<Item> items = mockedItems;
  Product? selectedProduct;
  Transaction transaction = Transaction.unnamed();
  FocusNode discountFocus = FocusNode();
  FocusNode additionFocus = FocusNode();

  @override
  void initState() {
    super.initState();

    // transaction.items = mockedItems;
    getData();
    initializeDropdowns();
    initializeDateController();

    discountFocus.addListener(() {
      if (!discountFocus.hasFocus) {
        formatDiscountField();
      }
    });

    additionFocus.addListener(() {
      if (!additionFocus.hasFocus) {
        formatAdditionField();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Nova transação",
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        const SizedBox(height: 32.0),
        Row(
          children: [
            DropdownMenu<TransactionType>(
              initialSelection: TransactionType.compra,
              label: const Text("Tipo"),
              dropdownMenuEntries: transactionEntries,
              onSelected: (TransactionType? selectedType) {
                if (selectedType is TransactionType) {
                  transaction.type = selectedType;
                }
              },
            ),
            const SizedBox(
              width: 16.0,
            ),
            SizedBox(
              width: 188,
              child: SearchTextField(
                controller: establishmentController,
                label: "Estabelecimento",
                onClick: () {
                  showEstablishmentDialog(context);
                },
              ),
            ),
            const SizedBox(
              width: 16.0,
            ),
            DropdownMenu<Payment>(
              initialSelection: payments[0],
              label: const Text("Pagamento"),
              dropdownMenuEntries: paymentEntries,
              onSelected: (Payment? payment) {
                if (payment is Payment) {
                  transaction.payment = payment;
                }
              },
            ),
            const SizedBox(
              width: 16.0,
            ),
            SizedBox(
              width: 168,
              child: DatePickerTextField(
                controller: dateController,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 16.0,
        ),
        Row(
          children: [
            SizedBox(
              width: 168,
              child: SearchTextField(
                controller: newItemController,
                label: "Novo produto",
                onClick: () {
                  showProductDialog(context);
                },
              ),
            ),
            const SizedBox(
              width: 16.0,
            ),
            SizedBox(
              height: 45,
              width: 188,
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: ElevatedButton.icon(
                  icon: const Icon(Icons.add_circle_outline),
                  label: const Text(
                    "Adicionar produto",
                  ),
                  onPressed: () {
                    if (selectedProduct != null) {
                      transaction.items.add(Item(
                          id: transaction.items.length + 1,
                          product: selectedProduct!,
                          price: selectedProduct!.commumPrice,
                          quantity: 1,
                          total: selectedProduct!.commumPrice));
                      calculateTotal();
                    }
                  },
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 16.0,
        ),
        itemsTable(),
        const SizedBox(
          height: 16.0,
        ),
        Row(
          children: [
            SizedBox(
              width: 168.0,
              child: TextField(
                controller: discountController,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'[0-9,]')),
                ],
                style: const TextStyle(fontSize: 14.0),
                decoration: const InputDecoration(
                  hintStyle: TextStyle(color: Colors.black45),
                  errorStyle: TextStyle(color: Colors.redAccent),
                  border: OutlineInputBorder(),
                  labelText: "Desconto",
                  prefix: Text(
                    "R\$ ",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                focusNode: discountFocus,
                onEditingComplete: () => formatDiscountField(),
              ),
            ),
            const SizedBox(
              width: 16.0,
            ),
            SizedBox(
              width: 168.0,
              child: TextField(
                controller: additionController,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'[0-9,]')),
                ],
                style: const TextStyle(fontSize: 14.0),
                decoration: const InputDecoration(
                  hintStyle: TextStyle(color: Colors.black45),
                  errorStyle: TextStyle(color: Colors.redAccent),
                  border: OutlineInputBorder(),
                  labelText: "Acrésimo",
                  prefix: Text(
                    "R\$ ",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                focusNode: additionFocus,
                onEditingComplete: () => formatAdditionField(),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 16.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: 45,
              width: 168,
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: ElevatedButton.icon(
                  icon: Transform(
                    transform: Matrix4.translationValues(22.0, 0.0, 0.0),
                    child: const Icon(Icons.check_circle_outline),
                  ),
                  label: Transform(
                    transform: Matrix4.translationValues(-24.0, 0.0, 0.0),
                    child: const Text(
                      "Finalizar",
                    ),
                  ),
                  onPressed: () {
                    saveTransaction();
                  },
                ),
              ),
            ),
            const SizedBox(
              width: 16.0,
            ),
            Row(
              children: [
                const Text(
                  "Total: ",
                  style: TextStyle(fontSize: 18.0),
                ),
                Text(
                  "R\$ ${transaction.total.toStringAsFixed(2).replaceAll('.', ",")}",
                  style:
                      const TextStyle(fontSize: 18.0, color: Color(0xFF3F51B5)),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  void initializeDropdowns() {
    // Transactions
    for (final TransactionType transaction in TransactionType.values) {
      transactionEntries.add(
        DropdownMenuEntry<TransactionType>(
            value: transaction, label: transaction.label),
      );
    }

    // Payment methods
    for (final Payment payment in payments) {
      paymentEntries.add(
        DropdownMenuEntry<Payment>(value: payment, label: payment.name),
      );
    }
  }

  void initializeDateController() {
    final DateTime dateTime = DateTime.now();
    final String formattedDate = intl.DateFormat("dd/MM/yyyy").format(dateTime);
    dateController.text = formattedDate;
  }

  void getData() {
    payments = mockedPayments;
  }

  Widget itemsTable() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xffB9B8BE)),
        borderRadius: BorderRadius.circular(4.0),
      ),
      height: 365,
      child: DataTable2(
        sortAscending: false,
        columnSpacing: 12,
        horizontalMargin: 12,
        minWidth: 600,
        smRatio: 0.75,
        lmRatio: 1.5,
        columns: const [
          DataColumn2(
            size: ColumnSize.S,
            label: Text("ID"),
          ),
          DataColumn(
            label: Text("Nome"),
          ),
          DataColumn(
            label: Text("Categoria"),
          ),
          DataColumn(
            label: Text("Preço"),
          ),
          DataColumn(
            label: Text("Quantidade"),
          ),
          DataColumn(
            label: Text("Total"),
          ),
          DataColumn(
            label: Text(""),
          ),
        ],
        rows: tableRows(),
      ),
    );
  }

  List<DataRow> tableRows() {
    List<DataRow> rows = [];

    for (int i = 0; i < transaction.items.length; i++) {
      rows.add(
        DataRow(
          cells: [
            DataCell(Text(transaction.items[i].id.toString())),
            DataCell(Text(transaction.items[i].product.name)),
            DataCell(Text(transaction.items[i].product.category.name)),
            DataCell(SelectableItemText(
              value:
                  "R\$ ${transaction.items[i].price.toStringAsFixed(2).replaceAll(".", ",")}",
              callback: (newValue) {
                setState(() {
                  transaction.items[i].price =
                      double.parse(newValue.toString().replaceAll(",", "."));
                  transaction.items[i].calculateTotal();
                });
                calculateTotal();
              },
            )),
            DataCell(SelectableItemText(
              value: transaction.items[i].quantity.toString(),
              callback: (newValue) {
                setState(() {
                  transaction.items[i].quantity = int.parse(newValue);
                  transaction.items[i].calculateTotal();
                });
                calculateTotal();
              },
            )),
            DataCell(
                Text("R\$" + transaction.items[i].total.toStringAsFixed(2))),
            DataCell(IconButton(
              onPressed: () {
                setState(() {
                  transaction.items.removeRange(i - 1, i);
                });
              },
              icon: const Icon(
                Icons.remove_circle_outline,
                color: Color(0xffb70707),
              ),
            )),
          ],
        ),
      );
    }

    return rows;
  }

  void calculateTotal() {
    double total = 0;

    for (int i = 0; i < transaction.items.length; i++) {
      total += transaction.items[i].total;
    }

    total -= transaction.discount;
    total += transaction.addition;

    setState(() {
      transaction.total = total;
    });
  }

  void showEstablishmentDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => SearchEstablishmentDialog(
        callback: (Establishment establishment) {
          transaction.establishment = establishment;
          establishmentController.text = establishment.name;
        },
      ),
    );
  }

  void showProductDialog(BuildContext context) {
    {
      showDialog(
        context: context,
        builder: (context) => SearchProductsDialog(
          callback: (Product product) {
            selectedProduct = product;
            newItemController.text = product.name;
          },
        ),
      );
    }
  }

  void formatDiscountField() {
    final String text = discountController.text;
    if (text.isNotEmpty) {
      String newText = double.parse(text.replaceAll(",", "."))
          .toStringAsFixed(2)
          .replaceAll(".", ",");
      discountController.text = newText;
    }
  }

  void formatAdditionField() {
    final String text = additionController.text;
    if (text.isNotEmpty) {
      String newText = double.parse(text.replaceAll(",", "."))
          .toStringAsFixed(2)
          .replaceAll(".", ",");
      additionController.text = newText;
    }
  }

  void saveTransaction() {
    print("Bom dia");
  }
}

class SelectableItemText extends StatefulWidget {
  dynamic value;
  Function(dynamic) callback;

  SelectableItemText({required this.value, required this.callback});

  @override
  State<SelectableItemText> createState() => _SelectableItemTextState();
}

class _SelectableItemTextState extends State<SelectableItemText> {
  bool isSelected = false;
  TextEditingController controller = TextEditingController();
  FocusNode focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    controller.text =
        widget.value.toString().replaceAll(".", ",").replaceAll("R\$ ", "");

    focusNode.addListener(() {
      if (!focusNode.hasFocus) {
        updateField();
      }
    });
  }

  void updateField() {
    setState(() {
      isSelected = false;
      widget.callback(controller.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          isSelected = true;
          focusNode.requestFocus();
          controller.selection = TextSelection(
              baseOffset: 0, extentOffset: controller.value.text.length);
        });
      },
      child: isSelected
          ? TextField(
              decoration: const InputDecoration(
                hintStyle: TextStyle(color: Colors.black45),
                errorStyle: TextStyle(color: Colors.redAccent),
                border: OutlineInputBorder(),
                prefix: Text(
                  "R\$ ",
                  style: TextStyle(color: Colors.black),
                ),
              ),
              controller: controller,
              onSubmitted: (value) {
                updateField();
              },
              focusNode: focusNode,
            )
          : Padding(
              padding: const EdgeInsets.only(right: 8.0, top: 8.0, bottom: 8.0),
              child: Text(widget.value),
            ),
    );
  }
}
