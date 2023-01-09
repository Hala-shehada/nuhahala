class Property {

  String label;
  String name;
  String price;
  String location;
  String sqm;
  String review;
  //String description;
  String frontImage;
  String ownerImage;
  List<String> images;
  bool islike;

  Property(this.label, this.name, this.price, this.location, this.sqm, this.review, this.frontImage, this.ownerImage, this.images,{this.islike=false});

}

List<Property> getPropertyList(){
  return <Property>[

    Property(
      "SALE",
      "Clinton Villa",
      "3,500.00",
      "Los Angeles",
      "2,456",
      "4.4",
      "assets/images/real1.jpg",
      "assets/images/blank-profile.png",
      [
        "assets/images/real2.jpg", 
      ],
    ),

    Property(
      "RENT",
      "Salu House",
      "3,500.00",
      "Miami",
      "3,300",
      "4.6",
      
      "assets/images/real2.jpg",
      "assets/images/blank-profile.png",
      [
        "assets/images/real2.jpg",
        "assets/images/real3.jpg",
      ],
    ),
    Property(
      "RENT",
      "Hilton House",
      "3,100.00",
      "California",
      "2,100",
      "4.1",
      
      "assets/images/real3.jpg",
      "assets/images/blank-profile.png",
      [
        "assets/images/real2.jpg",
        "assets/images/real3.jpg",
        "assets/images/real4.jpg",
      ],
    ),
    Property(
      "SALE",
      "Ibe House",
      "4,500.00",
      "Florida",
      "4,100",
      "4.5",
    
    "assets/images/real4.jpg",
      "assets/images/blank-profile.png",
      [
        "assets/images/real2.jpg",
        "assets/images/real3.jpg",
        "assets/images/real4.jpg",
      ],
    ),
    // Property(
    //   "SALE",
    //   "Aventura",
    //   "5,200.00",
    //   "New York",
    //   "3,100",
    //   "4.2",
    //   "The living is easy in this impressive, generously proportioned contemporary residence with lake and ocean views, located within a level stroll to the sand and surf.",
    //  "assets/images/real1.jpg",
    //   "assets/images/blank-profile.png",
    //   [
    //     "assets/images/real2.jpg",
    //     "assets/images/real3.jpg",
    //     "assets/images/real4.jpg",
    //   ],
    // ),
    // Property(
    //   "SALE",
    //   "North House",
    //   "3,500.00",
    //   "Florida",
    //   "3,700",
    //   "4.0",
    //   "The living is easy in this impressive, generously proportioned contemporary residence with lake and ocean views, located within a level stroll to the sand and surf.",
    //   "assets/images/real1.jpg",
    //   "assets/images/blank-profile.png",
    //   [
    //     "assets/images/real2.jpg",
    //     "assets/images/real3.jpg",
    //     "assets/images/real4.jpg",
    //   ],
    // ),
    // Property(
    //   "RENT",
    //   "Rasmus Resident",
    //   "2,900.00",
    //   "Detroit",
    //   "2,700",
    //   "4.3",
    //   "The living is easy in this impressive, generously proportioned contemporary residence with lake and ocean views, located within a level stroll to the sand and surf.",
    //   "assets/images/real1.jpg",
    //   "assets/images/blank-profile.png",
    //   [
    //   "assets/images/rael1.jpg",
    //   "assets/images/blank-profile.png",
    //   ],
    // ),
    // Property(
    //   "RENT",
    //   "Simone House",
    //   "3,900.00",
    //   "Florida",
    //   "3,700",
    //   "4.4",
    //   "The living is easy in this impressive, generously proportioned contemporary residence with lake and ocean views, located within a level stroll to the sand and surf.",
    //   "assets/images/real1.jpg",
    //   "assets/images/blank-profile.png",
    //   [
    //       "assets/images/rael1.jpg",
    //   "assets/images/blank-profile.png",
    //   ],
    // ),
  ];
}