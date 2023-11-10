import 'package:flutter/material.dart';
import 'package:personal_finance/mock/mocked_establishments.dart';
import 'package:personal_finance/model/establishment.dart';
import 'package:personal_finance/widget/dialog/base_dialog.dart';

class SearchEstablishmentDialog extends StatefulWidget {
  final Function(Establishment) callback;

  const SearchEstablishmentDialog({super.key, required this.callback});

  @override
  State<SearchEstablishmentDialog> createState() =>
      _SearchEstablishmentDialogState();
}

class _SearchEstablishmentDialogState extends State<SearchEstablishmentDialog> {
  late List<Establishment> establishments;
  late List<Establishment> filteredEstablishments;

  @override
  void initState() {
    super.initState();
    establishments = mockedEstablishments;
    filteredEstablishments = establishments;
  }

  @override
  Widget build(BuildContext context) {
    return BaseDialog(
      title: "Pesquisar Estabelecimentos",
      children: [
        SizedBox(
          width: 250,
          child: TextField(
            style: const TextStyle(),
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Nome do estabelecimento",
            ),
            onChanged: (String value) {
              filterEstablishments(value);
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
                          Text(filteredEstablishments[index].name),
                          Text("ID: ${filteredEstablishments[index].id}"),
                        ],
                      ),
                      const SizedBox(
                        height: 6.0,
                      ),
                      Text(
                        "Tipo: ${filteredEstablishments[index].type.name}",
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                ),
                onTap: () {
                  widget.callback(filteredEstablishments[index]);
                  Navigator.pop(context);
                },
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return const Divider();
            },
            itemCount: filteredEstablishments.length,
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

  void filterEstablishments(String value) {
    if (value == "") {
      setState(() {
        filteredEstablishments = this.establishments;
      });
      return;
    }

    List<Establishment> establishments = [];

    for (int i = 0; i < this.establishments.length; i++) {
      if (this
              .establishments[i]
              .name
              .toLowerCase()
              .contains(value.toLowerCase()) ||
          this
              .establishments[i]
              .type
              .name
              .toLowerCase()
              .contains(value.toLowerCase())) {
        establishments.add(this.establishments[i]);
      }
    }

    setState(() {
      filteredEstablishments = establishments;
    });
  }
}
