class CountryCovidDataModel {
  String countryName,
      cases,
      deaths,
      totalRecovered,
      newDeaths,
      newCases,
      seriousCritical,
      activeCases,
      totalCasesPer1mPopulation;

  CountryCovidDataModel({
    this.countryName,
    this.cases,
    this.deaths,
    this.totalRecovered,
    this.newDeaths,
    this.newCases,
    this.seriousCritical,
    this.activeCases,
    this.totalCasesPer1mPopulation,
  });

  factory CountryCovidDataModel.fromJson(Map<String, dynamic> item) {
    return CountryCovidDataModel(
        countryName: item['country_name'],
        cases: item['cases'],
        deaths: item['deaths'],
        totalRecovered: item['total_recovered'],
        newDeaths: item['new_deaths'],
        newCases: item['new_cases'],
        seriousCritical: item['serious_critical'],
        activeCases: item['active_cases'],
        totalCasesPer1mPopulation: item['total_cases_per_1m_population']);
  }
}

class CovidWorldCasesModel {
  String totalCases,
      totalDeaths,
      totalRecovered,
      newDeaths,
      newCases,
      statisticTakenAt;

  CovidWorldCasesModel({
    this.totalCases,
    this.totalDeaths,
    this.totalRecovered,
    this.newDeaths,
    this.newCases,
    this.statisticTakenAt,
  });

  factory CovidWorldCasesModel.fromJson(Map<String, dynamic> item) {
    return CovidWorldCasesModel(
      totalCases: item['total_cases'],
      totalDeaths: item['total_deaths'],
      totalRecovered: item['total_recovered'],
      newDeaths: item['new_deaths'],
      newCases: item['new_cases'],
      statisticTakenAt: item['statistic_taken_at'],
    );
  }
}
