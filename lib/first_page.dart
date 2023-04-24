import 'package:finances/DetailsItem.dart';
import 'package:finances/barGraph/summary_item.dart';
import 'package:finances/item_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';




class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final newContentNameController = TextEditingController();
  final newContentCostController = TextEditingController();


  void addPrices() {
    showDialog(context: context,
        builder: (context) => AlertDialog(
          title: const Text('Add new content'),
          backgroundColor: Colors.blueGrey,
          content: Column(
            children: [
              // This will be the name of the content the user assigns
              TextField(
                controller: newContentNameController,
              ),
              // This will be where user enters in the cost of the item content
              TextField(
                controller: newContentCostController,
              ),
            ],
          ),
          actions: [
            MaterialButton(
                onPressed: confirm,
            child: const Text('Confirm'),
            ),
            MaterialButton(onPressed: cancel,
            child: const Text('Cancel'),
            ),
          ],
        ),
    );
  }

  void confirm() {
    DetailsItem newCost = DetailsItem(
        name:newContentNameController.text,
        amount: newContentCostController.text,
        dateTime: DateTime.now(),
    );
    Provider.of<ItemData>(context, listen: false).addCost(newCost);
    Navigator.pop(context);
    clear();
  }


  void cancel() {
    Navigator.pop(context);
    clear();
  }
  void clear() {
    newContentNameController.clear();
    newContentCostController.clear();
  }


  @override
  Widget build(BuildContext context){
    return Consumer<ItemData>(
      builder: (context, value, child) => Scaffold(
        appBar: AppBar(
          title: const Text('Finance Lister'),
          backgroundColor: Colors.lightBlueAccent,
          centerTitle: true,

        ),
        backgroundColor: Colors.white,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          onPressed: addPrices,
            backgroundColor: Colors.lightBlueAccent,
          child: const Icon(Icons.attach_money),
        ),
        bottomNavigationBar: BottomAppBar(
          notchMargin: 3.0,
          shape: const CircularNotchedRectangle(),
          color:Colors.lightBlueAccent,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: const EdgeInsets.only(left:10.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,

                ),
              ),
            ],
          ),
        ),

        body: ListView(children: [

         ItemSummary(firstDayOfWeek: value.firstDayOfWeek()),
          const SizedBox(height: 20),

          ListView.builder(
            shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: value.getCostList().length,
        itemBuilder: (context, index) => ListTile(
          title: Text(value.getCostList()[index].name),
          subtitle: Text(value.getCostList()[index].dateTime.toString()),
          trailing: Text('\$' + value.getCostList()[index].amount),
        ),
      ),

        ]),
      ),
    );
  }
  }

