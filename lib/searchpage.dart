
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:navigator/HomePage.dart';

class searchpage extends StatelessWidget {
  const searchpage({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(

        appBar: AppBar(

          backgroundColor: Colors.green,
          title: Center(child: Text("Search your location",style: TextStyle(color: Colors.pink,fontWeight: FontWeight.bold,fontSize:34),)),


        ),

        body: Center(
          child: Column(
            children: [
              AutocompleteExample(),

              ElevatedButton(
                child: Text('Done'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  textStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontStyle: FontStyle.normal),
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
                },
              ),



            ],
          ),
          /*child: Container(

            child: AutocompleteExample(),
          ),

           */
        ),
      ),
    );
  }
}
class AutocompleteExample extends StatelessWidget {
  const AutocompleteExample({super.key});
  static const List<String>_kOptions = <String>[

    "Dhaka",
    "Faridpur",
    "Gazipur",
    "Gopalganj",
    "Jamalpur",
    "Kishoreganj",
    "Madaripur",
    "Manikganj",
    "Munshiganj",
    "Mymensingh",
    "Narayanganj",
    "Narsingdi",
    "Netrokona",
    "Rajbari",
    "Shariatpur",
    "Sherpur",
    "Tangail",
    "Bogra",
    "Joypurhat",
    "Naogaon",
    "Natore",
    "Nawabganj",
    "Pabna",
    "Rajshahi",
    "Sirajgonj",
    "Dinajpur",
    "Gaibandha",
    "Kurigram",
    "Lalmonirhat",
    "Nilphamari",
    "Panchagarh",
    "Rangpur"
        "Thakurgaon",
    "Barguna",
    "Barisal",
    "Bhola",
    "Jhalokati",
    "Patuakhali",
    "Pirojpur",
    "Bandarban",
    "Brahmanbaria",
    "Chandpur",
    "Chittagong",
    "Comilla",
    "Cox's Bazar",
    "Feni",
    "Khagrachari",
    "Lakshmipur",
    "Noakhali",
    "Rangamati",
    "Habiganj",
    "Maulvibazar",
    "Sunamganj",
    "Sylhet",
    "Bagerhat",
    "Chuadanga",
    "Jessore",
    "Jhenaidah",
    "Khulna",
    "Kushtia",
    "Magura",
    "Meherpur",
    "Narail",
    "Satkhira",


  ];

  @override
  Widget build(BuildContext context) {
    return Autocomplete<String>(

      optionsBuilder: (TextEditingValue textEditingValue){
        if(textEditingValue.text ==''){
          return const Iterable<String>.empty();
        }

        return _kOptions.where((String option){
          return option.contains(textEditingValue.text.toUpperCase());

        });
      },
      onSelected: (String selection){
        debugPrint('you just selected $selection');
      },
    );

  }
}
