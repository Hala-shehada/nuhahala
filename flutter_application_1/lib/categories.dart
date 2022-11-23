class Categories{
   int catid;
   String catname;

Categories({required this.catid, required this.catname});
static List<Categories> getCategories(){
  return <Categories>[
    Categories(catid: 1, catname:"Apartment" ),
    Categories(catid: 2, catname:"Villa" ),
    Categories(catid: 3, catname:"Office" ),
    Categories(catid: 4, catname:"Shop" ),
    Categories(catid: 5, catname:"Land" ),
    Categories(catid: 6, catname:"Farm" ),

  ];
}

}
