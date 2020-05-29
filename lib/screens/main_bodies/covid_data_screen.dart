import 'package:flutter/material.dart';
import 'package:incite/models/country_covid_data_model.dart';
import 'package:incite/providers/covid_data.dart';
import 'package:incite/widgets/country_cases_expansion_tile.dart';
import 'package:incite/widgets/world_cases_display_card.dart';

class CovidDataScreen extends StatefulWidget {
  @override
  _CovidDataScreenState createState() => _CovidDataScreenState();
}

class _CovidDataScreenState extends State<CovidDataScreen> {
  List<CountryCovidDataModel> countryCases = new List<CountryCovidDataModel>();
  CovidWorldCasesModel worldCases;

  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    getCases();
  }

  void getCases() async {
    await CovidData.getCovidData();
    countryCases = CovidData.covidCases;
    worldCases = CovidData.worldCases;
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
            child: Text(
              "Corona Virus Cases",
              style: TextStyle(
                color: Colors.black54,
                fontSize: 22,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Divider(
            thickness: 1,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  _isLoading
                      ? Center(child: CircularProgressIndicator())
                      : Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              WorldCasesDisplayCard(worldCases: worldCases),
                              SizedBox(
                                height: 20,
                              ),
                              ListView.builder(
                                  physics: ClampingScrollPhysics(),
                                  scrollDirection: Axis.vertical,
                                  itemCount: countryCases.length,
                                  shrinkWrap: true,
                                  itemBuilder: (ctx, index) {
                                    return CountryCasesExpansionTile(
                                      countryName:
                                          countryCases[index].countryName,
                                      cases: countryCases[index].cases,
                                      deaths: countryCases[index].deaths,
                                      totalRecovered:
                                          countryCases[index].totalRecovered,
                                      activeCases:
                                          countryCases[index].activeCases,
                                      newCases: countryCases[index].newCases,
                                      newDeaths: countryCases[index].newDeaths,
                                      seriousCritical:
                                          countryCases[index].seriousCritical,
                                    ); //make the expandable country widgets
                                  }),
                            ],
                          ),
                        )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
