import 'package:flutter/material.dart';

void main() {
  runApp(const StudentProfileApp());
}

class StudentProfileApp extends StatelessWidget {
  const StudentProfileApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Student Profile',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        fontFamily: 'Roboto',
      ),
      home: const ProfilePage(),
    );
  }
}

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  // this will test if you want to show academic
  bool _showAcademic = true;

  // called when the "View My Motto" button is pressed
  void _showMottoDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('My Motto'),
          content: const Text(
            '"You only live once"',
            style: TextStyle(fontStyle: FontStyle.italic, fontSize: 16),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // close the dialog
              },
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F4F8),
      appBar: AppBar(
        title: const Text('My Student Profile'),
        centerTitle: true,
        backgroundColor: Colors.indigo,
        elevation: 4,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // ---------- HEADER SECTION ----------
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.indigo, Colors.indigoAccent],
                ),
              ),
              child: Column(
                children: [
                  // Profile picture
                  CircleAvatar(
                    radius: 55,
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                      radius: 50,
                      // NOTE: replace with Image.asset('assets/profile.jpg')
                      // once I add my own picture in the assets folder
                      backgroundImage: const AssetImage('assets/profile.jpg'),
                      onBackgroundImageError: (_, __) {},
                      child: const Icon(Icons.person, size: 50, color: Colors.indigo),
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'John Winloyd S. Dagon',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    '"Loyd"',
                    style: TextStyle(fontSize: 15, color: Colors.white70),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // ---------- PERSONAL INFORMATION CARD ----------
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.fromLTRB(16, 8, 16, 4),
                        child: Row(
                          children: [
                            Icon(Icons.badge, color: Colors.indigo),
                            SizedBox(width: 8),
                            Text(
                              'Personal Information',
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Divider(thickness: 1),
                      const ListTile(
                        leading: Icon(Icons.cake, color: Colors.indigo),
                        title: Text('Age'),
                        subtitle: Text('20 years old'),
                      ),
                      const ListTile(
                        leading: Icon(Icons.calendar_month, color: Colors.indigo),
                        title: Text('Birthday'),
                        subtitle: Text('November 06, 2005'),
                      ),
                      const ListTile(
                        leading: Icon(Icons.home, color: Colors.indigo),
                        title: Text('Address'),
                        subtitle: Text('Brgy. Marinig, Cabuyao Laguna'),
                      ),
                      const ListTile(
                        leading: Icon(Icons.sports_esports, color: Colors.indigo),
                        title: Text('Hobby'),
                        subtitle: Text('Playing mobile games and Reading Manga'),
                      ),
                      const ListTile(
                        leading: Icon(Icons.school, color: Colors.indigo),
                        title: Text('Course / Program'),
                        subtitle: Text('BS Information Technology'),
                      ),
                      // Row used here to place Year Level and Section side by side
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Year Level',
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.grey)),
                                Text('3rd Year',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600)),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Section',
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.grey)),
                                Text('3IT-B',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600)),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 8),
                    ],
                  ),
                ),
              ),
            ),

            const SizedBox(height: 16),

            // ---------- BUTTON ROW (interactive part) ----------
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  onPressed: _showMottoDialog,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.indigo,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 12),
                  ),
                  icon: const Icon(Icons.format_quote),
                  label: const Text('View My Motto'),
                ),
                const SizedBox(width: 12),
                TextButton.icon(
                  onPressed: () {
                    // toggle the visibility of academic info section
                    setState(() {
                      _showAcademic = !_showAcademic;
                    });
                  },
                  icon: Icon(
                    _showAcademic ? Icons.visibility_off : Icons.visibility,
                    color: Colors.indigo,
                  ),
                  label: Text(
                    _showAcademic ? 'Hide Academic Info' : 'Show Academic Info',
                    style: const TextStyle(color: Colors.indigo),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 16),

            // ---------- ACADEMIC INFORMATION CARD (togglable) ----------
            // This whole section only appears if _showAcademic is true.
            if (_showAcademic)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Card(
                  elevation: 3,
                  color: Colors.indigo.shade50,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Row(
                          children: [
                            Icon(Icons.menu_book, color: Colors.indigo),
                            SizedBox(width: 8),
                            Text(
                              'Academic Information',
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        _AcademicRow(
                          icon: Icons.star,
                          label: 'Favorite Subject',
                          value: 'Database',
                        ),
                        SizedBox(height: 8),
                        _AcademicRow(
                          icon: Icons.code,
                          label: 'Database Language',
                          value: 'Mysql',
                        ),
                        SizedBox(height: 8),
                        _AcademicRow(
                          icon: Icons.build,
                          label: 'Technical Skill',
                          value: 'Data Analytics and Data Mining',
                        ),
                      ],
                    ),
                  ),
                ),
              ),

            const SizedBox(height: 24),

            // Footer note
            const Padding(
              padding: EdgeInsets.only(bottom: 20),
              child: Text(
                'ITP107 - Midterm Laboratory 2',
                style: TextStyle(color: Colors.grey, fontSize: 12),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Small reusable widget I made so I don't have to repeat the same
// Row + Icon + Text code for every academic info item.
class _AcademicRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _AcademicRow({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 20, color: Colors.indigo),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: const TextStyle(fontSize: 12, color: Colors.grey),
              ),
              Text(
                value,
                style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
      ],
    );
  }
}