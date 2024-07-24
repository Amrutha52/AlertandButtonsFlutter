import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget
{
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
{
  bool light = true;
  @override
  Widget build(BuildContext context)
  {
    bool isChecked = false;
    List<String> gender = ["female", "male", "others"];
    String? dropValue;
    String sex = gender[0];

    @override
    void initState()
    {
      super.initState();
      //sex = gender[0];
     // dropValue = gender.first;
    }

    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(
        child: Column(
          children: [
            Text("data")
          ],
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: Checkbox(
                value: isChecked ,// value base cheythe checked or not manasilakunu ,
                onChanged: (value) {
                  print('value' + value.toString());
                  if(value != null)
                  {
                    isChecked = value;
                  }
                  setState(() {});
                }, // check values handle cheyyan vendiyane onChanged use cheyune
              )
          ),
          Radio(
              value: gender[0],
              groupValue: sex,
              onChanged: (value){
                setState(() {
                  sex = value!;
                  print(sex);
                });
              }),
          Radio(
              value: gender[1],
              groupValue: sex,
              onChanged: (value){
                setState(() {
                  sex = value!;
                  print(sex);
                });
              }),
          Column(
            children: List.generate(gender.length,
                (index) => RadioListTile(
                  title: Text(gender[index]),
                  value: gender[index],
                  groupValue: sex,
                  onChanged: (value) {
                    setState(() {
                      print('valueee' + value.toString());
                      sex = value!;
                    });
                  },
                ),),
          ),
          PopupMenuButton(
              itemBuilder: (context) => [
                PopupMenuItem(
                    child: Text("Settings"),
                onTap: (){

                },
                ),
                PopupMenuItem(
                    child: Text("Menu"),
                onTap: (){

                },
                ),
                PopupMenuItem(
                    child: Text("More"),
                onTap: (){

                },
                )

              ],
          ),
          DropdownButton(
            value: dropValue,
              hint: Text("Select"),
              items: List.generate(gender.length,
                  (index) => DropdownMenuItem(
                    value: gender[index],
                      child: Text(gender[index]))
              ),
              onChanged: (value)
              {
                //onChanged used for Click cheyumbol enthane change cheyende.
                dropValue = value!;
                setState(() {});
              }
          ),

          ExpansionTile(
              title: Text("Expansion Tile"),
            children: [
              Text("data"),
              Container(
                height: 50,
                color: Colors.red,
              )
            ],
          ),
          Switch(
            // This bool value toggles the switch.
              value: light,
              overlayColor: WidgetStatePropertyAll(Colors.red),
              thumbColor: WidgetStatePropertyAll(Colors.yellow),
              onChanged: (bool value){
                // This is called when the user toggles the switch.
                setState(() {
                  light = value;
                });
              }
          ),
          //Alert Dialogue
          TextButton(
              onPressed: (){
            showDialog(
                context: context,
                builder: (context) => StatefulBuilder(builder: (context, alertState) =>
                    AlertDialog(
                      title: Text("Heloo"),
                      content: Container(
                        height: 200,
                        color: Colors.white,
                        child: Center(
                          child: Switch(
                            // This bool value toggles the switch.
                              value: light,
                              overlayColor: WidgetStatePropertyAll(Colors.red),
                              thumbColor: WidgetStatePropertyAll(Colors.yellow),
                              onChanged: (value){
                                // This is called when the user toggles the switch.
                                setState(() {
                                  light = value;
                                  alertState(() {
                                    //alertState click cheyumbol aane alert state update aavane..
                                  });
                                });
                              }
                          ),
                        ),
                      ),
                      actions: [
                        TextButton(onPressed: (){
                          Navigator.pop(context);
                        },
                            child: Text("Close")),
                        TextButton(onPressed: (){

                        },
                            child: Text("Save"))
                      ],
                    )
                )
            );
          },
              child: Text("Alert")
          ),
          TextButton(onPressed: (){
            showModalBottomSheet(
                isScrollControlled: true, // height koottaan or kurakkan
                context: context,
                builder: (context) => Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      //height: 700,
                      width: double.infinity,
                      child: Center(
                          child: Text("data",
                            style: TextStyle(color: Colors.black),)),
                    ),
                  ],
                ));
          },
              child: Text("Bottom Sheet")),
        ],
      ),
    );
  }
}
