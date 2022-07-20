import 'package:flutter/material.dart';

class SearchForm extends StatefulWidget {
  const SearchForm({Key? key}) : super(key: key);

  @override
  State<SearchForm> createState() => _SearchFormState();
}

class _SearchFormState extends State<SearchForm> {
  var controllerText = TextEditingController();

  var listItems = [
    'اللغة العربية',
    'الرياضيات',
    'الفيزياء',
    'الاحياء',
    'الكيمياء',
    'العلوم',
    'التاريخ',
    'الجغرافياء'
  ];

  var listItemsEmpty = [];

  late FocusNode focusNode;

  @override
  void initState() {
    super.initState();
    focusNode = FocusNode();
    focusNode.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: _dropdownList(),
      ),
    );
  }

  Widget _dropdownList() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            focusNode: focusNode,
            controller: controllerText,
            onChanged: (value) {
              listItemsEmpty.clear();
              listItems.forEach((element) {
                var name = element.toLowerCase();
                if (name.contains(value)) {
                  setState(() {
                    listItemsEmpty.add(element);
                  });
                  if (value.isEmpty)
                    setState(() {
                      listItemsEmpty.clear();
                    });
                }
              });
            },
          ),
        ),
        Visibility(
          visible: focusNode.hasFocus,
          child: Expanded(
            child: ListView.builder(
              itemCount: listItemsEmpty.isNotEmpty
                  ? listItemsEmpty.length
                  : listItems.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.all(20),
                  child: Text(
                    listItemsEmpty.isNotEmpty
                        ? listItemsEmpty[index]
                        : listItems[index],
                    style: TextStyle(fontSize: 20),
                  ),
                );
              },
            ),
          ),
        )
      ],
    );
  }
}



