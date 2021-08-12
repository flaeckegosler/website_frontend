import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:website_frontend/models/news_model.dart';

class NewsProvider with ChangeNotifier {
  final List<News> _news = [];

  List<News> get allNews {
    return List.from(_news);
  }

  List<News> getLatest(int number) {
    List<News> _result = [];
    for (int i = 0; i < number; i++) {
      _result.add(_news[i]);
    }
    return _result;
  }

  Future<void> createNews() async {
    _news.add(News(
        id: 0.toString(),
        newsTitle: "Sommerausflug Fuederegg",
        imageURL: "/img_3002.jpg",
        cropImageURL:
            "https://flaeckegosler.ch/site/assets/files/2516/img_3002.-thumbnail.jpg",
        timeCreatedUnix: 1626121843,
        timeCreatedFormatted: "Montag, 12.07.2021 22:30",
        newsCreatedBy: "Janick Lang",
        newsIntroText:
            "<p>Lange mussten die Gosler sich gedulden. Mehr als eineinhalb Jahre vergingen seit dem letzten Gosler-Wochenende. Nun war es jedoch endlich wieder soweit.</p>",
        newsMainText:
            "<p>Die feuchtfröhliche Hinfahrt über den Hirzel machte jedoch nicht etwa schwachen Mägen zu schaffen, sondern dem Car. Dieser entschied sich kurzerhand für ein verfrühtes Wochenende und ein Ersatz musste her. Die Gosler Truppe machte es am Strassenrand in der Abendsonne bequem und das aus Einsiedeln stammende Carunternehmen organisierte einen neuen fahrbaren Untersatz. In der Fuederegg angekommen wurden dann die hungrigen Mäuler mit köstlichem Schnippo im Restaurant versorgt. Bis in die frühen Morgenstunden wurde getanzt, gelacht, gejasst und das Zusammensein genossen.</p> <p>Nach einigen erholsamen Stunden Schlaf in der Unterkunft Rittersporn, galt es sich mit Frühstück in fester oder flüssiger Form zu stärken. Bei strahlender Sonne wurden die auf Hochglanz polierten Instrumente von den letzten Staubkörnern befreit. Endlich ertönten wieder Guggenmusikalische Klänge, auch zur Freude von vielen Wanderern, welche das unerwartete Platzkonzert genossen. Ein sichtlich zufriedener Tambi eröffnete dann das Sandwich Buffet. Die nächste Stärkung war angesagt, um am Nachmittag beim Gastspiel vor dem Restaurant mit brillanten Tönen glänzen zu können. Nach einem erfolgreichen Auftritt wurde der Spielplatz in Beschlag genommen und ein Apero genossen. Viele erhofften sich, den (Sonnen)-Brand von innen heraus löschen zu können und mussten eines Besseren belehrt werden. In einem anschliessenden Beerpong Turnier konnte die Treffsicherheit unter Beweis gestellt werden. Da das Wetter jedoch andere Pläne hatte, musste der an Spannung kaum zu überbietende Wettkampf abgebrochen werden. Gestärkt von köstlichen Älplermagronen ging dann ein gemütlicher Abend im Aufenthaltsraum über die Bühne. Einzig ein paar Tanzwütige wagten sich in das nasskalte Wetter hinaus.</p> <p>Das Programm am Sonntag gestaltete sich je nach Gemütslage. Einige liessen sich von der Aussicht in die Höhe locken. Andere wollten verpasste Duelle im Beerpong nachholen. Spätestens als sich der Geruch von grillierten Bratwürsten im Hoch Ybrig verbreitete, trudelten alle wieder in der Unterkunft ein und brachten diese wieder auf Vordermann. Nach einer Heimfahrt, auf welcher unser Chauffeur mit unzähligen Fakten und Geschichten über die an uns vorbeiziehende Landschaft glänzte, stiegen die Gosler erschöpft aber glücklich in Rothenburg aus dem Car und machten sich auf den Nachhauseweg.</p> <p>#HedsNoBränd #NornoAchtBillet #DräckImTank #NummeroUno #SuperÄrnst</p>",
        imageDescription: "",
        newsTags: "",
        galleryLink: ""));
    _news.add(News(
        id: 1.toString(),
        newsTitle:
            "Bericht zur 31. Generalversammlung der Guuggemusig Fläckegosler Roteborg",
        imageURL: "/whatsapp_image_2021-06-27_at_22_08_48_1-1.jpeg",
        cropImageURL:
            "https://flaeckegosler.ch/site/assets/files/2514/whatsapp_image_2021-06-27_at_22_08_48_1-1.-thumbnail.jpeg",
        timeCreatedUnix: 1625349600,
        timeCreatedFormatted: "Sonntag, 04.07.2021 00:00",
        newsCreatedBy: "Reto Bättig",
        newsIntroText:
            "<p>Am Samstag, 26. Mai 2021 fand die 31. ordentliche Generalversammlung der Guuggemusig Fläckegosler Roteborg statt.</p>",
        newsMainText:
            '<p>Um 14:00 Uhr durfte ich meine letzte Generalversammlung der Fläckegosler im Saal des Gasthaus Bahnhof zu Rothenburg eröffnen. Wie schön war es für mich und alle Mitgosler endlich wieder mal alle Leute zu treffen, interessante Gespräche abzuhalten und natürlich auch genügend (flüssige) Nahrung zu uns zu nehmen – wie haben wir das vermisst! Gerade für einen so geselligen Haufen wie wir es sind, war diese Zeit ein Stich in’s Herz.</p> <p>Auf Grund des speziellen Jahres entschied die Generalversammlung auf Antrag des Vorstandes, dass die angehenden Kandidaten in ein zweites Kandidatenjahr geschickt werden, damit sie einerseits uns Fläckegosler «richtig» begegnen können und andererseits wir Fläckegosler die Kandidaten richtig kennenlernen können.</p> <p>Nach den üblichen - aber für dieses Jahr doch erstaunlich detaillierten - Jahresberichten vom Tambi Oli Schürch, Sujetchef Diego Zimmermann und meiner Wenigkeit gingen wir direkt über zu den Finanzen, präsentiert von Alex Vogel. Dank grosszügigen Gönnerbeiträgen konnten wir den Verlust gut in Grenzen halten – dankeschön für eure Treue auch in diesem Jahr!</p> <p>Ich war heilfroh, dass ich in meinem letzten Amtsjahr bloss einen Austritt verkünden musste, dieser betrifft unser langjährigen Aktuar José Stählin, welcher sein Amt als Aktuar abgibt und sogleich aus dem Verein austritt. Danke José für deinen Einsatz und du weisst, dass Gosler die Türen nie schliessen! Für seinen Posten wurde Nick Leber von der Generalversammlung einstimmig gewählt. Da wir bloss einen Austritt zu beklagen haben, sind wir Fläckegosler natürlich bestens gerüstet für die nächste Fasnacht – so Corona will.</p> <p>Wie ihr schon aus den ersten Zeilen mitbekommen habt, habe auch ich mein Amt als Präsident der Guuggemusig Fläckegosler Roteborg abgegeben – leider blieb es mir verwehrt mein letztes Präsidialjahr zu zelebrieren. Nichtsdestotrotz schaue ich mit viel Freude und Stolz auf meine 4 Jahre Präsident dieses einzigartigen Vereines zurück – der Verein forderte mich extrem heraus aber gab auch so unglaublich viele schöne Momente zurück. Ich habe mich bereits letzten Sommer zu diesem Schritt entschieden, da mich der Beruf sehr beansprucht und der Verein wieder neue Impulse benötigt. In dem Sinne möchte ich allen Goslerfreunden DANKE sagen für eure Unterstützung, eure Feedbacks, die Teilnahme an unseren Anlässen und grundsätzlich die wunderbaren Begegnungen. Wie wichtig einem solche Begegnungen sind, wurde jeder/m in diesem Jahr vor Augen geführt. Ein besonderer Dank geht an alle Roteborger Fasnachtsvereine für die konstruktive und zielgerichtete Zusammenarbeit, diese wurde meinerseits stets sehr geschätzt und es war wunderbar zu sehen, wie wir hier zusammen mehr erreichen konnten.</p> <p>Der Vorstand hat der Generalversammlung Janick Lang als neuen Präsident vorgeschlagen und dieser wurde einstimmig und unter Applaus gewählt. Nach einer kleinen Präsentübergabe und seiner Amtseinführungsansprache durfte er auch bereits das Jahresprogramm für das neue Vereinsjahr präsentieren – wir Fläckegosler planen mit einem einzigen Virus: Dem Fasnachtsvirus. Janick – ich wünsche dir nur das Beste für deine Amtszeit und bin selbstverständlich stets zu deinen Diensten! Ich bin der vollen Überzeugung, dass du der würdige Nachfolger von mir bist für dieses ehrenhafte Amt!</p> <p>Die restlichen Mutationen in den Ämtern werden dann zeitnah auf der Homepage hochgeschalten.</p> <p>Nach dem offiziellen Teil der Generalversammlung durften wir einen Apéro im Restaurant Bahnhof geniessen bevor wir dann kulinarisch verwöhnt wurden von Pirmin mit Isabelle und Team – Dankeschön! Was nach dem Essen noch alles stattfand, möchte ich hier nicht im Detail erläutern, aber wir kamen definitiv alle (wohl) desinfiziert nach Hause! Bilder vom offiziellen Teil findet ihr <a href="https://flaeckegosler.ch/fotos/gv-2021/gv-2021/">hier</a>, die Bilder vom inoffiziellen Teil sind höchstens noch in der Erinnerung einiger Gosler</p> <p>#sengemereis #WGPartycrasher #imstägehuuslegge #Schlösselbeiweg #fläscheworf #appezellerbronne #tanzederno #schlofeofemSofa #falschischuehmetheignoh #pizzaautomat #falschezogverwötscht</p> <p>In dem Sinne möchte ich mich als Präsident von euch verabschieden, mich bedanken und natürlich freue mich wahnsinnig eine Reihe nach hinten zu kehren und die Fasnacht 2022 als normales Mitglied zu zelebrieren! Dankeschön ond en schöne Sommer,</p> <p>Reti (Ex-Präsident Fläckegosler Roteborg)</p>',
        imageDescription: "",
        newsTags: "",
        galleryLink: "https://flaeckegosler.ch/fotos/gv-2021/gv-2021/"));
    _news.add(News(
        id: 2.toString(),
        newsTitle: "Flättere-Samschtig",
        imageURL: "/samschtig-1.jpeg",
        cropImageURL:
            "https://flaeckegosler.ch/site/assets/files/2504/samschtig-1.-thumbnail.jpeg",
        timeCreatedUnix: 1613170800,
        timeCreatedFormatted: "Samstag, 13.02.2021 00:00",
        newsCreatedBy: "Chantal Fischer, Julia Lipp",
        newsIntroText:
            "<p>An unserem bereits letzten Fasnachtstag der Fasi 2021 hat der Vorstand eine Schnitzeljagd durch Rothenburg organisiert. Am Abend war dann leider schon der digitale Abschluss.</p>",
        newsMainText:
            "<p>Am Maschgerelauf sind wir Gosler*innen in unseren supertollen 5er Gruppen gestaffelt auf zwei verschiedenen Routen an die Schnitzeljagd angetreten. Mit mehr oder weniger schönen Verkleidungen haben wir trotz allem noch ein wenig Fasnacht und Kreativität nach Rothenburg gebracht.</p> <p>Bei einem Fotoshooting, corona-konformem Bierpong, Dart, legendären Theaterstücken und einem Schnäpsli-Ratespiel haben wir alle unser Können gezeigt und übelscht viel Spass gehabt. Die abartigen Minustemperaturen haben uns, wenn man nicht komplett blau war, riesig ins Schlottern gebracht.</p> <p>Dank einer bezeli mühsamen, seeeehr langsamen, aber lustigen Gruppe (die hie und da auch ein wenig geschummelt hat), wurde es dem Vorstand bestimmt nicht langweilig. Sie als Organisatoren haben uns ein lustiges Programm vorbereitet, das uns als Teilnehmende top organisiert rüber kam.</p> <p>Nach einem feinen Znacht in unseren supertollen 5er Gruppen, begann das (HOFFENTLICH FÜR IMMER) letzte Fasnachts-Zoommeeting. Wir durften über die beste Verkleidung vom Maschgerelauf abstimmen und haben uns die Videos von den legendären Theaterstücken angeschaut. Wegen den Tücken der Technik haben wir leider nicht so viel von den eingespielten Videos mitbekommen – ausser, dass Oli einen Knutschfleck von einem Karpfen hat und deswegen sein Date mit der netten jungen Dame vermiest wurde.</p> <p>Dann war es leider schon so weit: Das letzte Fasnachtsstündli hat geschlagen und der Vorstand beendete das offizielle diesjährige Fasnachtsprogramm.</p> <p>Auf eine bessere, rüüdige, gesellige, analoge, reale, soumässiggute und laute Fasnacht 2022!</p>",
        imageDescription:
            'Ein Selfie eines Mitgliedes der Gruppe "Tha(mpon) WG". (Foto: Patrick Roos)',
        newsTags: "",
        galleryLink: ""));
  }

/*
  fetchNewsList() async {
    var url = Uri.parse('https://flaeckegosler.ch/app/news-to-json/');
    final response = await http.get(
      url,
      headers: {
        "content-type": "application/json",
      },
    );
    if (response.statusCode == 200) {
      final List<News> fetchedProductList = [];
      final Map<String, dynamic> newsListData = json.decode(response.body);
      newsListData.forEach((String newsId, dynamic newsData) {
        final News news = News(
            id: newsId.toString(),
            newsTitle: newsData['newsTitle'],
            imageURL: newsData['imageURL'],
            cropImageURL: newsData['cropImageURL'],
            timeCreatedUnix: newsData['timeCreatedUnix'],
            timeCreatedFormatted: newsData['timeCreatedFormatted'],
            newsCreatedBy: newsData['newsCreatedBy'],
            newsIntroText: newsData['newsIntroText'],
            newsMainText: newsData['newsMainText'],
            imageDescription: newsData['imageDescription'],
            newsTags: newsData['newsTags'],
            galleryLink: newsData['galleryLink']);
        fetchedProductList.add(news);
      });
      _news = fetchedProductList;
    } else {
      throw Exception("Unable to get news");
    }
    ;
  }*/

}
