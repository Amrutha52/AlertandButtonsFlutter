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
          )
        ],
      ),
    );
  }
}
