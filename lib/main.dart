import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'data/players.dart';

void main() {
  runApp(const FootInApp());
}

class FootInApp extends StatelessWidget {
  const FootInApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FootIN',
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        // NOUVEAU: Bleu Marine Profond
        scaffoldBackgroundColor: const Color(0xFF0F172A),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF00E5FF), // Cyan
          brightness: Brightness.dark,
          primary: const Color(0xFF00E5FF),
          secondary: const Color(0xFF00E676), // Vert Néon
          background: const Color(0xFF0F172A),
          surface: const Color(0xFF1E293B),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent, // Transparent pour le gradient si besoin
          elevation: 0,
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Color(0xFF0F172A), // Match Scaffold
          selectedItemColor: Color(0xFF00E5FF), // Cyan
          unselectedItemColor: Colors.blueGrey,
          type: BottomNavigationBarType.fixed,
        ),
        cardTheme: CardThemeData(
          color: const Color(0xFF1E293B), // Bleu Navy plus clair
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: BorderSide(color: Colors.white.withOpacity(0.05), width: 1),
          ),
        ),
      ),
      home: const MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const HomeScreen(),
    const Center(child: Text('Scout (Recherche)', style: TextStyle(color: Colors.white))),
    const Center(child: Text('Mon Espace', style: TextStyle(color: Colors.white))),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          border: Border(top: BorderSide(color: Color(0xFF1E293B), width: 1)),
        ),
        child: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.flash_on),
              label: 'Talents',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Scout',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              label: 'Profil',
            ),
          ],
        ),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Import des données réelles
    final List<Map<String, dynamic>> players = kPlayers;

    return Scaffold(
      appBar: AppBar(
        // LOGO IMAGE
        title: Image.asset(
          'assets/logo.png',
          height: 32, 
          fit: BoxFit.contain,
          errorBuilder: (context, error, stackTrace) {
            // Fallback si l'image ne charge pas
            return const Text("FOOT IN", style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 2));
          },
        ),
        centerTitle: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none, color: Color(0xFF00E5FF)),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.filter_list, color: Color(0xFF00E5FF)),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Banner Gradient Optionnel
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  const Color(0xFF00E676).withOpacity(0.1),
                  const Color(0xFF00E5FF).withOpacity(0.0),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Text(
              'RECOMMANDÉS POUR VOUS',
              style: TextStyle(
                color: const Color(0xFF00E5FF),
                fontWeight: FontWeight.bold,
                fontSize: 12,
                letterSpacing: 1.5,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: players.length,
              itemBuilder: (context, index) {
                final player = players[index];
                return PlayerCard(
                  player: player,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PlayerDetailScreen(player: player),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class PlayerCard extends StatelessWidget {
  final Map<String, dynamic> player;
  final VoidCallback onTap;

  const PlayerCard({
    super.key,
    required this.player,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final bool isLibre = player['status'] == 'Libre';
    final Color statusColor = isLibre ? const Color(0xFF00E676) : const Color(0xFFFF1744); // Vert Néon vs Rouge Vif

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: const Color(0xFF1E293B), // Card BG
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Colors.white.withOpacity(0.05),
        ),
        // Glow Effect Subtil
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF000000).withOpacity(0.2),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                // Avatar (Photo)
                Container(
                  width: 64,
                  height: 64,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    // Bordure Cyan
                    border: Border.all(color: const Color(0xFF00E5FF).withOpacity(0.3), width: 2),
                    image: DecorationImage(
                      image: NetworkImage(player['photo']),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                // Infos
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                Flexible(
                                  child: Text(
                                    player['name'],
                                    style: const TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontFamily: 'Roboto',
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                // Point de statut
                                Container(
                                  width: 8,
                                  height: 8,
                                  decoration: BoxDecoration(
                                    color: statusColor,
                                    shape: BoxShape.circle,
                                    boxShadow: [
                                      BoxShadow(
                                        color: statusColor.withOpacity(0.6),
                                        blurRadius: 6,
                                        spreadRadius: 1,
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // Badge Âge - Style Pillule
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                            decoration: BoxDecoration(
                              color: const Color(0xFF0F172A), // Darker Navy
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              "${player['age']} ans",
                              style: const TextStyle(
                                color: Color(0xFF94A3B8), // Blue Grey
                                fontSize: 11,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text(
                        player['position'].toUpperCase(),
                        style: const TextStyle(
                          color: Color(0xFF00E5FF), // Cyan Accents
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0.5,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          // Club Logo
                          ClipRRect(
                            borderRadius: BorderRadius.circular(4),
                            child: Image.network(
                              player['logo'],
                              width: 18,
                              height: 18,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            player['club'],
                            style: const TextStyle(
                              color: Color(0xFF94A3B8), // Blue Grey
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                // Chevron
                const Icon(Icons.chevron_right, color: Color(0xFF334155)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class PlayerDetailScreen extends StatelessWidget {
  final Map<String, dynamic> player;

  const PlayerDetailScreen({super.key, required this.player});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F172A),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.share, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header Image avec Gradient Overlay
            SizedBox(
              height: 400,
              width: double.infinity,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.network(
                    player['photo'],
                    fit: BoxFit.cover,
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent, 
                          Color(0xFF0F172A)
                        ],
                        stops: [0.5, 0.95],
                      ),
                    ),
                  ),
                  // Content Overlay
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(3),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: LinearGradient(
                              colors: [Color(0xFF00E676), Color(0xFF00E5FF)],
                            ),
                          ),
                          child: CircleAvatar(
                            radius: 50,
                            backgroundImage: NetworkImage(player['photo']),
                          ),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          player['name'],
                          style: const TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            letterSpacing: -0.5,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.network(player['logo'], width: 24, height: 24),
                            const SizedBox(width: 8),
                            Text(
                              "${player['club']} • ${player['position']}",
                              style: const TextStyle(
                                color: Color(0xFF94A3B8),
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 30),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            
            // Content
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Stats Section Grid
                  const Text(
                    "SAISON ACTUELLE",
                    style: TextStyle(
                      color: Color(0xFF00E5FF),
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.2,
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(child: _buildStatCard("MATCHS", "24")),
                      const SizedBox(width: 12),
                      Expanded(child: _buildStatCard("BUTS", "8")),
                      const SizedBox(width: 12),
                      Expanded(child: _buildStatCard("MINUTES", "1840")),
                    ],
                  ),

                  const SizedBox(height: 32),
                  
                  // Video Section
                  const Text(
                    "HIGHLIGHTS VIDÉO",
                    style: TextStyle(
                      color: Color(0xFF00E5FF),
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.2,
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    height: 200,
                    decoration: BoxDecoration(
                      color: const Color(0xFF1E293B),
                      borderRadius: BorderRadius.circular(16),
                      image: const DecorationImage(
                        image: NetworkImage("https://images.unsplash.com/photo-1574629810360-7efbbe195018?q=80&w=2993&auto=format&fit=crop"), // Placeholder Field
                        fit: BoxFit.cover,
                        opacity: 0.3,
                      ),
                    ),
                    child: Center(
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: const Color(0xFF00E5FF).withOpacity(0.2),
                          shape: BoxShape.circle,
                          border: Border.all(color: const Color(0xFF00E5FF)),
                        ),
                        child: const Icon(Icons.play_arrow, size: 40, color: Colors.white),
                      ),
                    ),
                  ),

                  const SizedBox(height: 40),

                  // Call to Action Gradient Button
                  Container(
                    height: 56,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      gradient: const LinearGradient(
                        colors: [Color(0xFF00E676), Color(0xFF00E5FF)],
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFF00E5FF).withOpacity(0.4),
                          blurRadius: 12,
                          offset: const Offset(0, 4),
                        )
                      ],
                    ),
                    child: ElevatedButton(
                      onPressed: () {}, 
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text(
                        "CONTACTER LE JOUEUR",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF0F172A), // Dark Text on Bright Button
                          letterSpacing: 0.5,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatCard(String label, String value) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        color: const Color(0xFF1E293B),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white.withOpacity(0.05)),
      ),
      child: Column(
        children: [
          Text(
            value,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: const TextStyle(
              fontSize: 10,
              color: Color(0xFF64748B), // Slate
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
