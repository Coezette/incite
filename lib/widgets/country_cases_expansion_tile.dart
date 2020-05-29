import 'package:flutter/material.dart';
import 'package:incite/models/country_covid_data_model.dart';

class CountryCasesExpansionTile extends StatelessWidget {
  String countryName,
      cases,
      deaths,
      totalRecovered,
      newDeaths,
      newCases,
      seriousCritical,
      activeCases;

  CountryCasesExpansionTile({
    this.countryName,
    this.cases,
    this.deaths,
    this.totalRecovered,
    this.newDeaths,
    this.newCases,
    this.seriousCritical,
    this.activeCases,
  });

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      backgroundColor: Colors.white70,
      title: Text('$countryName:    $cases',
          style: TextStyle(fontWeight: FontWeight.w600)),
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Card(
            color: Colors.white70,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Closed Cases:',
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      Expanded(
                        child: Column(
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text('Deaths:'),
                                Text(deaths,
                                    style: TextStyle(color: Colors.pink)),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text('Recovered:'),
                                Text(totalRecovered,
                                    style: TextStyle(color: Colors.green)),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'New Cases:     ',
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      Expanded(
                        child: Column(
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text('New Infections:'),
                                Text(newCases),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text('New Deaths:'),
                                Text(newDeaths),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text('Serious/Critical:'),
                                Text(seriousCritical),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
