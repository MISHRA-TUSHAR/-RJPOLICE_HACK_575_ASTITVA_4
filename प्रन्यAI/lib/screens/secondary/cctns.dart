import 'package:flutter/material.dart';
import 'dart:math';

class CCTNSDatabaseScreen extends StatelessWidget {
  DateTime getRandomDate() {
    final random = Random();
    final start = DateTime(2020, 1, 1);
    final end = DateTime(2023, 12, 31);
    return start
        .add(Duration(days: random.nextInt(end.difference(start).inDays)));
  }

  String getRandomAddress() {
    final random = Random();
    List<String> streets = [
      'Main Street',
      'First Avenue',
      'Oak Street',
      'Maple Avenue'
    ];
    List<String> cities = ['City A', 'City B', 'City C', 'City D'];
    return '${random.nextInt(1000)} ${streets[random.nextInt(streets.length)]}, ${cities[random.nextInt(cities.length)]}';
  }

  String getRandomPhoneNumber() {
    final random = Random();
    return '+91 ${random.nextInt(900) + 100}-${random.nextInt(9000) + 1000}-${random.nextInt(9000) + 1000}';
  }

  @override
  Widget build(BuildContext context) {
    List<String> indianNames = [
      'Aarav',
      'Aanya',
      'Arjun',
      'Anaya',
      'Advait',
      'Avni',
      'Aryan',
      'Amara',
      'Advika',
      'Aaryan',
      'Aadhya',
      'Ayaan',
      'Anika',
      'Ahaan',
      'Aaradhya',
      'Vihaan',
      'Myra',
      'Reyansh',
      'Saisha',
      'Abeer',
      'Anvi',
      'Arnav',
      'Zara',
      'Arush',
      'Aisha',
      'Ishaan',
      'Riya',
      'Vivaan',
      'Ishita',
      'Kabir',
      'Nia',
      'Kiaan',
      'Zoya',
      'Aarush',
      'Avisha',
      'Aarush',
      'Anaya',
      'Aarav',
      'Aarna',
      'Reva',
      'Shaurya',
      'Ira',
      'Veer',
      'Anaya',
      'Kian',
      'Gia',
      'Kabir',
      'Ritara',
      'Arjun',
      'Arjun',
    ];

    List<String> rajasthanDistricts = [
      'Jaipur Urban (Jaipur)',
      'Jaipur Rural (Jaipur)',
      'Kekri (Ajmer)',
      'Sanchore (Jalore)',
      'Khairthal (Alwar)',
      'Anupgarh (Sriganganagar)',
      'Gangapur City (Sawai Madhopur)',
      'Neem ka thana (Sikar)',
      'Phalodi (Jodhpur)',
      'Dudu (Jaipur)',
      'Beawar (Ajmer)',
      'Didwana-Kuchaman (Nagaur)',
      'Salumber (Udaipur)',
      'Shahpura (Bhilwara)',
      'Jodhpur Urban (Jodhpur)',
      'Jodhpur Rural (Jodhpur)',
      'Balotra (Barmer)',
      'Deeg (Bharatpur)',
      'Jaipur Urban (Jaipur)',
      'Jaipur Rural (Jaipur)',
      'Kekri (Ajmer)',
      'Sanchore (Jalore)',
      'Khairthal (Alwar)',
      'Anupgarh (Sriganganagar)',
      'Gangapur City (Sawai Madhopur)',
      'Neem ka thana (Sikar)',
      'Phalodi (Jodhpur)',
      'Dudu (Jaipur)',
      'Beawar (Ajmer)',
      'Didwana-Kuchaman (Nagaur)',
      'Salumber (Udaipur)',
      'Shahpura (Bhilwara)',
      'Jodhpur Urban (Jodhpur)',
      'Jodhpur Rural (Jodhpur)',
      'Balotra (Barmer)',
      'Deeg (Bharatpur)',
      'Jaipur Urban (Jaipur)',
      'Jaipur Rural (Jaipur)',
      'Kekri (Ajmer)',
      'Sanchore (Jalore)',
      'Khairthal (Alwar)',
      'Anupgarh (Sriganganagar)',
      'Gangapur City (Sawai Madhopur)',
      'Neem ka thana (Sikar)',
      'Phalodi (Jodhpur)',
      'Dudu (Jaipur)',
      'Beawar (Ajmer)',
      'Didwana-Kuchaman (Nagaur)',
      'Salumber (Udaipur)',
      'Shahpura (Bhilwara)',
    ];

    List<String> applicableActs = [
      'Act A, Act B',
      'Act C, Act D',
      'Act E, Act F',
      'Act G, Act H',
      'Act I, Act J',
      'Act K, Act L',
      'Act M, Act N',
      'Act O, Act P',
      'Act Q, Act R',
      'Act S, Act T',
      'Act U, Act V',
      'Act W, Act X',
      'Act Y, Act Z',
      'Act AA, Act BB',
      'Act CC, Act DD',
      'Act EE, Act FF',
      'Act GG, Act HH',
      'Act II, Act JJ',
      'Act KK, Act LL',
      'Act MM, Act NN',
      'Act OO, Act PP',
      'Act QQ, Act RR',
      'Act SS, Act TT',
      'Act UU, Act VV',
      'Act WW, Act XX',
      'Act YY, Act ZZ',
      'Act AAA, Act BBB',
      'Act CCC, Act DDD',
      'Act EEE, Act FFF',
      'Act GGG, Act HHH',
      'Act III, Act JJJ',
      'Act KKK, Act LLL',
      'Act MMM, Act NNN',
      'Act OOO, Act PPP',
      'Act QQQ, Act RRR',
      'Act SSS, Act TTT',
      'Act UUU, Act VVV',
      'Act WWW, Act XXX',
      'Act YYY, Act ZZZ',
      'Act AAAA, Act BBBB',
      'Act CCCC, Act DDDD',
      'Act EEEE, Act FFFF',
      'Act GGGG, Act HHHH',
      'Act IIII, Act JJJJ',
      'Act KKKK, Act LLLL',
      'Act MMMM, Act NNNN',
      'Act OOOO, Act PPPP',
      'Act QQQQ, Act RRRR',
      'Act SSSS, Act TTTT',
      'Act UUUU, Act VVVV',
    ];

    List<String> policeStations =
        List.generate(rajasthanDistricts.length, (index) => getRandomAddress());
    List<DateTime> filingDates =
        List.generate(indianNames.length, (index) => getRandomDate());

    List<String> phoneNumbers =
        List.generate(indianNames.length, (index) => getRandomPhoneNumber());

    if (indianNames.length != rajasthanDistricts.length ||
        indianNames.length != applicableActs.length ||
        indianNames.length != filingDates.length ||
        indianNames.length != policeStations.length ||
        indianNames.length != phoneNumbers.length) {
      throw Exception("Lists should have the same length");
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('CCTNS Database'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(
                context: context,
                delegate: MySearchDelegate(
                  indianNames: indianNames,
                  rajasthanDistricts: rajasthanDistricts,
                  applicableActs: applicableActs,
                  policeStations: policeStations,
                  phoneNumbers: phoneNumbers,
                  filingDates: filingDates,
                ),
              );
            },
          ),
        ],
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                headingRowColor:
                    MaterialStateColor.resolveWith((states) => Colors.blue),
                columnSpacing: 16.0,
                columns: [
                  DataColumn(
                    label: Container(
                      width: 150,
                      child: Text('Name of Candidate',
                          style: TextStyle(color: Colors.white)),
                    ),
                  ),
                  DataColumn(
                    label: Container(
                      width: 150,
                      child: Text('Applicable Acts',
                          style: TextStyle(color: Colors.white)),
                    ),
                  ),
                  DataColumn(
                    label: Container(
                      width: 150,
                      child: Text('District',
                          style: TextStyle(color: Colors.white)),
                    ),
                  ),
                  DataColumn(
                    label: Container(
                      width: 150,
                      child: Text('Police Station',
                          style: TextStyle(color: Colors.white)),
                    ),
                  ),
                  DataColumn(
                    label: Container(
                      width: 150,
                      child: Text('Phone Number',
                          style: TextStyle(color: Colors.white)),
                    ),
                  ),
                  DataColumn(
                    label: Container(
                      width: 150,
                      child: Text('Date of Filing',
                          style: TextStyle(color: Colors.white)),
                    ),
                  ),
                ],
                rows: List.generate(rajasthanDistricts.length, (index) {
                  return DataRow(cells: [
                    DataCell(
                        Container(width: 150, child: Text(indianNames[index]))),
                    DataCell(Container(
                        width: 150, child: Text(applicableActs[index]))),
                    DataCell(Container(
                        width: 150, child: Text(rajasthanDistricts[index]))),
                    DataCell(Container(
                        width: 150, child: Text(policeStations[index]))),
                    DataCell(Container(
                        width: 150, child: Text(phoneNumbers[index]))),
                    DataCell(Container(
                        width: 150,
                        child: Text(
                            filingDates[index].toString().substring(0, 10)))),
                  ]);
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MySearchDelegate extends SearchDelegate<DataRow> {
  final List<String> indianNames;
  final List<String> rajasthanDistricts;
  final List<String> applicableActs;
  final List<String> policeStations;
  final List<String> phoneNumbers;
  final List<DateTime> filingDates;

  MySearchDelegate({
    required this.indianNames,
    required this.rajasthanDistricts,
    required this.applicableActs,
    required this.policeStations,
    required this.phoneNumbers,
    required this.filingDates,
  });

  @override
  Widget buildResults(BuildContext context) {
    final filteredRows = indianNames
        .where((name) => name.toLowerCase().contains(query.toLowerCase()))
        .map((name) {
      final index = indianNames.indexOf(name);
      return DataRow(
        cells: [
          DataCell(
            Container(
              width: 150,
              child: Text(
                name,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          DataCell(
            Container(width: 150, child: Text(applicableActs[index])),
          ),
          DataCell(
            Container(width: 150, child: Text(rajasthanDistricts[index])),
          ),
          DataCell(
            Container(width: 150, child: Text(policeStations[index])),
          ),
          DataCell(
            Container(width: 150, child: Text(phoneNumbers[index])),
          ),
          DataCell(
            Container(
              width: 150,
              child: Text(filingDates[index].toString().substring(0, 10)),
            ),
          ),
        ],
      );
    }).toList();

    return DataTable(
      columns: [
        DataColumn(label: Text('Name')),
        DataColumn(label: Text('Applicable Act')),
        DataColumn(label: Text('District')),
        DataColumn(label: Text('Police Station')),
        DataColumn(label: Text('Phone Number')),
        DataColumn(label: Text('Date of Filing')),
      ],
      rows: filteredRows,
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestions = indianNames
        .where((name) => name.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        final suggestion = suggestions[index];
        return ListTile(
          title: Text(suggestion),
          onTap: () {
            query = suggestion;
            showResults(context);
          },
        );
      },
    );
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, DataRow(cells: []));
      },
    );
  }
}
