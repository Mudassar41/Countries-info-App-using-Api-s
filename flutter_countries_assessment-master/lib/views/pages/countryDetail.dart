import 'package:countries_info/Apisdata/CountriesApiData.dart';
import 'package:countries_info/Models/Countries.dart';
import 'package:countries_info/Models/Countries.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_grid_delegate_ext/rendering/grid_delegate.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CountryDetailPage extends StatefulWidget {
  final String Name;
  final String Code;
  final String Capital;
  final String Subregion;
  final String Flage;
  final List BorderCountries;
  final List Language;
  final double Area;
  final int Population;
  final double Gini;
  final String Resident;

  final List currencyName;
  final String currencySymbol;
  final String subRegion;

  const CountryDetailPage({
    Key key,
    this.Name,
    this.Code,
    this.Capital,
    this.Subregion,
    this.Flage,
    this.BorderCountries,
    this.Language,
    this.Area,
    this.Population,
    this.Gini,
    this.Resident,
    this.currencyName,
    this.currencySymbol,
    this.subRegion,
  }) : super(key: key);

  @override
  _CountryDetailPageState createState() => _CountryDetailPageState();
}

class _CountryDetailPageState extends State<CountryDetailPage> {
  CountriesApiData _countriesApiData = CountriesApiData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.Name),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          child: Center(
                              child: Text(
                            widget.Code,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          )),
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                              color: Colors.blueGrey, shape: BoxShape.circle),
                        ),
                        Flexible(
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.Name,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.blueGrey,
                                      fontSize: 22),
                                ),
                                Text(
                                  widget.Capital,
                                  style: TextStyle(color: Colors.blueGrey),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Container(
                          height: 250,
                          width: MediaQuery.of(context).size.width,
                          child: SvgPicture.network(widget.Flage)),
                    ),
                    Text(
                      '${widget.Name} covers an area of ${widget.Area} Sq and has a population of ${widget.Population}- the nation has a Gini of ${widget.Gini}.A resident of ${widget.Name} is called a ${widget.Resident}.The main currency accepted as legal tender is the ${widget.currencyName[0]['name']} which is expressed with Symbol ${widget.currencyName[0]['symbol']}',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.blueGrey),
                      textAlign: TextAlign.justify,
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.location_on_outlined,
                    size: 30,
                    color: Colors.blueGrey,
                  ),
                  SizedBox(
                    width: 60,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Sub-region",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                            color: Colors.blueGrey),
                      ),
                      Text(
                        widget.subRegion,
                        style: TextStyle(color: Colors.blueGrey),
                      )
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.location_city,
                    size: 30,
                    color: Colors.blueGrey,
                  ),
                  SizedBox(
                    width: 60,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Capital",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                            color: Colors.blueGrey),
                      ),
                      Text(
                        widget.Capital,
                        style: TextStyle(color: Colors.blueGrey),
                      )
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 50,
              width: MediaQuery.of(context).size.width * .6,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(30),
                        bottomRight: Radius.circular(30))),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        Icons.language,
                        size: 25,
                        color: Colors.white,
                      ),
                      Text(
                        "Languages ",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                            color: Colors.white),
                      )
                    ],
                  ),
                ),
              ),
            ),
            GridView.builder(
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              itemCount: widget.Language.length,
              gridDelegate: XSliverGridDelegate(
                crossAxisCount: 2,
                smallCellExtent: 80,
                bigCellExtent: 80,
                mainAxisSpacing: 2,
                crossAxisSpacing: 2,
              ),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        gradient: new LinearGradient(
                            colors: [
                              const Color(0xFF3366FF),
                              const Color(0xFF00CCFF),
                            ],
                            begin: const FractionalOffset(0.0, 0.0),
                            end: const FractionalOffset(1.0, 0.0),
                            stops: [0.0, 1.0],
                            tileMode: TileMode.clamp),

                        // color: Colors.blueGrey,
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '${widget.Language[index]['name']}',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                        Text('(${widget.Language[index]['nativeName']})',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18)),
                      ],
                    ),
                  ),
                );
              },
            ),
            SizedBox(
              height: 50,
              width: MediaQuery.of(context).size.width * .8,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(30),
                        bottomRight: Radius.circular(30))),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        Icons.map,
                        size: 25,
                        color: Colors.white,
                      ),
                      Text(
                        "Bordering Countries ",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                            color: Colors.white),
                      )
                    ],
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 100,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      for (int i = 0; i < widget.BorderCountries.length; i++)
                        FutureBuilder(
                          future: _countriesApiData.GetAllCountriesData(
                              '${widget.BorderCountries[i]}'),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              return ListView.builder(
                                scrollDirection: Axis.horizontal,
                                shrinkWrap: true,
                                itemCount: snapshot.data.length,
                                itemBuilder: (context, index) {
                                  return Card(
                                    elevation: 5,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                    clipBehavior: Clip.antiAlias,
                                    child: InkWell(
                                      splashColor: Colors.blueGrey,
                                      onTap: (){


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
                                      child: Container(
                                        height: 150,
                                        width: 120,
                                        child: SvgPicture.network(

                                            snapshot.data[index].flag,
                                        fit: BoxFit.cover,),
                                      ),
                                    ),
                                  );
                                },
                              );
                            }
                            return CupertinoActivityIndicator();
                          },
                        )
                    ],
                  ),
                ),
              ),
            ),

            // Container(
            //   height: 100,
            //   child: ListView.builder(
            //     scrollDirection: Axis.horizontal,
            //     shrinkWrap: true,
            //     itemBuilder: (context, index) {
            //       return Padding(
            //         padding: const EdgeInsets.all(8.0),
            //         child: Container(
            //           width: 100,
            //             decoration: BoxDecoration(
            //                 shape: BoxShape.rectangle,
            //                 borderRadius:
            //                     BorderRadius.all(Radius.circular(10))),
            //             child: FutureBuilder(
            //               future: _countriesApiData.GetAllCountriesData(
            //                   '${widget.BorderCountries[index]}'),
            //               builder: (context, snapshot) {
            //                 if (snapshot.hasData) {
            //
            //                   return ListView.builder(itemCount: snapshot.data.length,itemBuilder: (context,ind){
            //                     return SvgPicture.network(snapshot.data[ind].flag);
            //                   },);
            //
            //
            //                 }
            //                 return CupertinoActivityIndicator();
            //               },
            //             )),
            //       );
            //     },
            //     itemCount: widget.BorderCountries.length,
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
