
import 'package:flutter/material.dart';
import 'package:flutter_application_1/pallete.dart';

class Filter extends StatefulWidget {
  const Filter({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _FilterState createState() => _FilterState();
}

class _FilterState extends State<Filter> {

  var values = const RangeValues(1000, 50000);
  List price =[
    "",
    "",
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 24, left: 24, top: 32, bottom: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Row(
            children: const [

              Text(
                "Filter",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(
                width: 8,
              ),

              Text(
                "your search",
                style: TextStyle(
                  fontSize: 24,
                ),
              ),

            ],
          ),

          const SizedBox(
            height: 32,
          ),

          Row(
            children: const [

              Text(
                "Price",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(
                width: 8,
              ),

              Text(
                "range",
                style: TextStyle(
                  fontSize: 24,
                ),
              ),

            ],
          ),

          RangeSlider(
            values: values,
            onChanged: (values) {
              setState(() {
                this.values=values;
                price[0]=values.start.round().toString();
                price[1]=values.end.round().toString();

              
              });
            },
            min: 1000,
            max: 50000,
            divisions: 30,
            labels: RangeLabels(
             values.start.round().toString(),
             values.end.round().toString(),
             
              ),
            activeColor: Colors.amber[400],
            inactiveColor: Colors.grey[300],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [

              Text(
                r"₪1000",
                style: TextStyle(
                  fontSize: 14,
                ),
              ),

              Text(
                r"₪50000",
                style: TextStyle(
                  fontSize: 14,
                ),
              ),

            ],
          ),

          const SizedBox(
            height: 16,
          ),

           Text(
            "Your Price Range ${values.start.round()} , ${values.end.round()}",
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),

     const SizedBox(
            height: 16,
          ),

          Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
           GestureDetector(
            
           
                        onTap: () {
                          Navigator.pop(context);
                        },
                        // child: const Icon(
                        //   Icons.arrow_back_ios,
                        //   color: Colors.white,
                        //   size: 24,
                        // ),
                        child: const Text(
                          "Done",
                          style: pText1,
                        ),
                      ),
                    ],

  ),
                ),

  

        ],
      ),
    );
  }

 
}
