class Countries {
  String name;
  String alpha2Code;
  String capital;
  String subregion;
  String flag;
  List borders;
  List languages;
  double area;
  int population;
  double gini;
  String demonym;
  List currencies;


  Countries.GetList(
      this.name,
      this.alpha2Code,
      this.capital,
      this.subregion,
      this.flag,
      this.borders,
      this.languages,
      this.area,
      this.population,
      this.gini,
      this.demonym,
      this.currencies);

  Countries(
      {this.name,
      this.alpha2Code,
      this.capital,
      this.subregion,
      this.flag,
      this.borders,
      this.languages,
      this.area,
      this.population,
      this.gini,
      this.demonym,
      this.currencies});

  factory Countries.fromJson(Map<String, dynamic> json) {
    return Countries(
        name: json['name'],
        alpha2Code: json['alpha2Code'],
        capital: json['capital'],
        subregion: json['subregion'],
        flag: json['flag'],
        borders: json['borders'],
        languages: json['languages'],
        area: json['area'],
        population: json['population'],
        gini: json['gini'],
        demonym: json['demonym'],
        currencies: json['currencies']
        //    currencies: Currencies.fromJson(json['currencies'])

        );
  }
}

class Currencies {
  String name;
  String symbol;

  Currencies({this.name, this.symbol});

  factory Currencies.fromJson(Map<String, dynamic> json) {
    return Currencies(
      name: json['name'],
      symbol: json['symbol'],
    );
  }
}
