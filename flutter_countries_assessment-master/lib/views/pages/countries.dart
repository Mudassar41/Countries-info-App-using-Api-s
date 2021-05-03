import 'package:countries_info/Apisdata/CountriesApiData.dart';
import 'package:countries_info/Models/Countries.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../routes.dart';
import 'countryDetail.dart';

class CountriesPage extends StatefulWidget {
  @override
  _CountriesPageState createState() => _CountriesPageState();
}

class _CountriesPageState extends State<CountriesPage> {
  Future<List<Countries>> futurecountries;
  CountriesApiData _countriesApiData = CountriesApiData();
  bool value = true;
  TextEditingController editingController = TextEditingController();
  FocusScopeNode currentFocus;
 // Currencies _currencies=Currencies();

  @override
  void initState() {
    super.initState();
    futurecountries = _countriesApiData.GetAfricaRegionCountries();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Countries"),
        actions: [
          IconButton(
              icon: Icon(Icons.info_outline),
              onPressed: () =>
                  Navigator.of(context).pushNamed(AppRoutes.about)),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
               // shadowColor: Customcolors.green,
                elevation: 5,
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0.0),
                ),
                child: TextField(
                  controller: editingController,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: value == true
                          ? IconButton(
                        icon: Icon(Icons.search),
                      )
                          : IconButton(
                        icon: Icon(Icons.clear),
                        onPressed: () {
                          setState(() {
                            value = true;
                            editingController.clear();
                          });
                        },
                      ),
                      hintText: "Search",
                      hintStyle: TextStyle(color: Colors.grey, fontSize: 15)),
                  onChanged: (val) {
                    setState(() {
                      value = false;
                    });

                    print(value);
                  },
                ),
              ),
            ),


            Expanded(
              child: FutureBuilder(
                future:value==true? futurecountries:_countriesApiData.SearchCountry(editingController.text.toLowerCase()),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    if(snapshot.connectionState==ConnectionState.waiting){


                      return Center(child: CupertinoActivityIndicator(),);
                    }
                    return ListView.builder(
                      physics: ScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          splashColor: Colors.grey,
                          onTap: () {
                           // Currencies currencies=snapshot.data[index].currencies;
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CountryDetailPage(
                                        Name: snapshot.data[index].name,
                                        Code: snapshot.data[index].alpha2Code,
                                        Capital: snapshot.data[index].capital,
                                        Subregion: snapshot.data[index].subregion,
                                        Flage: snapshot.data[index].flag,
                                        BorderCountries: snapshot.data[index].borders,
                                        Language: snapshot.data[index].languages,
                                        Area: snapshot.data[index].area,
                                        Population: snapshot.data[index].population,
                                    Gini: snapshot.data[index].gini,
                                    Resident: snapshot.data[index].demonym,
                                    currencyName:snapshot.data[index].currencies,
                                     subRegion: snapshot.data[index].subregion,


                                     // currencySymbol:snapshot.data[index].currencies[index]

                                  )),
                            );
                          },
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Flexible(
                                    child: Row(
                                      //mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                        Container(
                                          height: 110,
                                          width: 100,
                                          child: Stack(
                                            children: [
                                              Center(
                                                child: CupertinoActivityIndicator(),
                                              ),
                                              Container(
                                                height: 110,
                                                width: 100,
                                                child: SvgPicture.network(
                                                    snapshot.data[index].flag),
                                              ),
                                              Positioned(
                                                bottom: 15,
                                                right: 2,
                                                child: Container(
                                                  child: Center(
                                                      child: Text(
                                                    snapshot.data[index].alpha2Code,
                                                    style: TextStyle(
                                                        fontWeight: FontWeight.bold,
                                                        color: Colors.white),
                                                  )),
                                                  height: 20,
                                                  width: 40,
                                                  decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.all(
                                                          Radius.circular(5)),
                                                      color: Color(0xFF607d8c),
                                                      shape: BoxShape.rectangle),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        Flexible(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.all(5.0),
                                                child: Text(snapshot.data[index].name,
                                                    style: TextStyle(
                                                        fontWeight: FontWeight.bold,
                                                        color: Color(0xFF607d8c))),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 5, top: 2),
                                                child: Text(
                                                  snapshot.data[index].capital,
                                                  style: TextStyle(
                                                      color: Color(0xFF607d8c)),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Icon(
                                    Icons.arrow_forward_ios_sharp,
                                    size: 16,
                                    color: Color(0xFF607d8c),
                                  )
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 100),
                                child: Container(
                                  height: 1,
                                  color: Colors.grey,
                                  width: MediaQuery.of(context).size.width,
                                ),
                              )
                            ],
                          ),
                        );
                      },
                    );
                  } else if (snapshot.hasError) {
                    return Text("Sorry ");
                  }

                  // By default, show a loading spinner.
                  return Center(child: CircularProgressIndicator());
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
