// ignore: avoid_classes_with_only_static_members
class Authors {
  static String? getRedakteur(String newsCreatedBy) {
    if (newsCreatedBy == "Administrator") {
      return "";
    } else if (newsCreatedBy == "Carmen Andermatt") {
      return 'assets/redakteure/carmen.png';
    } else if (newsCreatedBy == "Damian Zurmühle") {
      return 'assets/redakteure/damian.png';
    } else if (newsCreatedBy == "Daniela Hotz") {
      return 'assets/redakteure/danielah.png';
    } else if (newsCreatedBy == "Dario Köchli") {
      return 'assets/redakteure/dariok.png';
    } else if (newsCreatedBy == "Dario Stocker") {
      return 'assets/redakteure/darios.png';
    } else if (newsCreatedBy == "Diego Zimmermann") {
      return 'assets/redakteure/diego.png';
    } else if (newsCreatedBy == "Dominic Mauron") {
      return 'assets/redakteure/dominicm.png';
    } else if (newsCreatedBy == "Fabian Koch") {
      return 'assets/redakteure/fabiank.png';
    } else if (newsCreatedBy == "Fabio Roos") {
      return 'assets/redakteure/fabio.png';
    } else if (newsCreatedBy == "Janick Lang") {
      return 'assets/redakteure/janick.png';
    } else if (newsCreatedBy == "José Stählin") {
      return 'assets/redakteure/jose.png';
    } else if (newsCreatedBy == "Justin Faesi") {
      return 'assets/redakteure/justin.png';
    } else if (newsCreatedBy == "Lukas Studer") {
      return 'assets/redakteure/lukasStuder.png';
    } else if (newsCreatedBy == "Manuel Mühlebach") {
      return 'assets/redakteure/manuelm.png';
    } else if (newsCreatedBy == "Martin Richli") {
      return 'assets/redakteure/martin.png';
    } else if (newsCreatedBy == "Michèle Kritzer") {
      return 'assets/redakteure/michelek.png';
    } else if (newsCreatedBy == "Noah Berwert") {
      return 'assets/redakteure/noah.png';
    } else if (newsCreatedBy == "Oliver Schürch") {
      return 'assets/redakteure/olivers.png';
    } else if (newsCreatedBy == "Patrick Vogel") {
      return 'assets/redakteure/patrickv.png';
    } else if (newsCreatedBy == "Philippe Schenker") {
      return 'assets/redakteure/phil.png';
    } else if (newsCreatedBy == "Raphael Koch") {
      return 'assets/redakteure/raphikoch.png';
    } else if (newsCreatedBy == "Reto Bättig") {
      return 'assets/redakteure/reto.png';
    } else if (newsCreatedBy == "Stefan Lang") {
      return 'assets/redakteure/stefan.png';
    } else {
      return "";
    }
  }
}
