import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:api/api.dart'; // Make sure this import matches your API client

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Famous Sites Explorer',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple, // Vibrant primary color
        visualDensity: VisualDensity.adaptivePlatformDensity,
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.deepPurple, // Customized button color
          textTheme: ButtonTextTheme.primary,
        ),
      ),
      home: SitesScreen(),
    );
  }
}

class SitesScreen extends StatefulWidget {
  @override
  _SitesScreenState createState() => _SitesScreenState();
}

class _SitesScreenState extends State<SitesScreen> {
  List<String> _countries = [];
  List<dynamic> _sites = [];
  final ApiClient _apiClient = ApiClient();

  @override
  void initState() {
    super.initState();
    _fetchCountries();
  }

  Future<void> _fetchCountries() async {
    try {
      final countries = await _apiClient.fetchCountries();
      setState(() {
        _countries = countries;
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Failed to load countries: $e")));
    }
  }

  Future<void> _fetchFamousSites(String country) async {
    try {
      final sites = await _apiClient.fetchFamousSites(country);
      setState(() {
        _sites = sites;
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Failed to load sites: $e")));
    }
  }

  Future<void> _launchURL(String siteName) async {
    final url = Uri.encodeFull('https://www.google.com/search?q=$siteName');
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SvgPicture.asset(
              'assets/images/logo.svg',
              width: 60,
              height: 60,
            ),
            SizedBox(width: 10),
            Text('Famous Sites Explorer', style: TextStyle(fontSize: 20)),
          ],
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Wrap(
                spacing: 8.0,
                runSpacing: 4.0,
                children: _countries.map((country) => ElevatedButton(
                  onPressed: () => _fetchFamousSites(country),
                  child: Text(country),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColor, // Button color
                    foregroundColor: Colors.white, // Text color
                  ),
                )).toList(),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: _sites.length,
              itemBuilder: (context, index) {
                final site = _sites[index];
                return GestureDetector(
                  onTap: () => _launchURL(site['site_name'] ?? 'Unknown Site'),
                  child: Card(
                    elevation: 5,
                    margin: EdgeInsets.all(8),
                    child: Row(
                      children: <Widget>[
                        SizedBox(
                          width: 100,
                          height: 100,
                          child: FadeInImage.assetNetwork(
                            placeholder: 'assets/images/logo.svg',
                            image: site['image_url'] ?? 'https://via.placeholder.com/100',
                            fit: BoxFit.cover,
                          ),
                        ),
                        Expanded(
                          child: ListTile(
                            title: Text(site['site_name'] ?? 'Unknown Name'),
                            subtitle: Text(site['description'] ?? 'No description available.'),
                            isThreeLine: true,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
