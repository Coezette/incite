import 'package:flutter/material.dart';
import '../models/country_covid_data_model.dart';

class WorldCasesDisplayCard extends StatelessWidget {
  const WorldCasesDisplayCard({
    @required this.worldCases,
  });

  final CovidWorldCasesModel worldCases;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.indigoAccent.withAlpha(15),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Worldwide:',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                Text(
                  worldCases.totalCases,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.black54),
                )
              ],
            ),
            Divider(
              thickness: 2,
            ),
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
                          Text(worldCases.totalDeaths,
                              style: TextStyle(
                                  color: Colors.pink,
                                  fontWeight: FontWeight.w600)),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text('Recovered:'),
                          Text(worldCases.totalRecovered,
                              style: TextStyle(
                                  color: Colors.green,
                                  fontWeight: FontWeight.w600)),
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
                          Text(worldCases.newCases),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text('New Deaths:'),
                          Text(worldCases.newDeaths),
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
    );
  }
}
