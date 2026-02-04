
final List<Map<String, dynamic>> kPlayers = [
  // --- LOCAL ID ---
  // US Clichy
    {'name': 'Sofiane B.', 'position': 'Milieu Défensif', 'club': 'US Clichy', 'age': 19, 'rating': 62, 'status': 'Libre', 'photo': 'https://i.pravatar.cc/150?img=1', 'logo': 'https://ui-avatars.com/api/?name=USC&background=EF4444&color=fff'},
    {'name': 'Mehdi K.', 'position': 'Ailier Gauche', 'club': 'US Clichy', 'age': 20, 'rating': 64, 'status': 'Libre', 'photo': 'https://i.pravatar.cc/150?img=2', 'logo': 'https://ui-avatars.com/api/?name=USC&background=EF4444&color=fff'},
  
  // Red Star FC (B)
    {'name': 'Mamadou D.', 'position': 'Défenseur Central', 'club': 'Red Star FC (B)', 'age': 18, 'rating': 65, 'status': 'Sous Contrat', 'photo': 'https://i.pravatar.cc/150?img=3', 'logo': 'https://ui-avatars.com/api/?name=RED&background=047857&color=fff'},
    {'name': 'Kylian M.', 'position': 'Buteur', 'club': 'Red Star FC (B)', 'age': 19, 'rating': 67, 'status': 'Sous Contrat', 'photo': 'https://i.pravatar.cc/150?img=4', 'logo': 'https://ui-avatars.com/api/?name=RED&background=047857&color=fff'},

  // Racing CFF
    {'name': 'Paul V.', 'position': 'Milieu Relayeur', 'club': 'Racing CFF', 'age': 21, 'rating': 66, 'status': 'Libre', 'photo': 'https://i.pravatar.cc/150?img=5', 'logo': 'https://ui-avatars.com/api/?name=RACING&background=3B82F6&color=fff'},
  
  // FCM Aubervilliers
    {'name': 'Ibrahim S.', 'position': 'Latéral Droit', 'club': 'FCM Aubervilliers', 'age': 22, 'rating': 63, 'status': 'Libre', 'photo': 'https://i.pravatar.cc/150?img=6', 'logo': 'https://ui-avatars.com/api/?name=FCM&background=F59E0B&color=fff'},


  // --- FC Versailles 78 ---
  {'name': 'Sébastien Rénot', 'position': 'Gardien', 'club': 'FC Versailles', 'age': 34, 'rating': 72, 'status': 'Sous Contrat', 'photo': 'https://i.pravatar.cc/150?img=11', 'logo': 'https://ui-avatars.com/api/?name=FCV&background=1D4ED8&color=fff'},
  {'name': 'Jérémi Santini', 'position': 'Défenseur', 'club': 'FC Versailles', 'age': 26, 'rating': 68, 'status': 'Sous Contrat', 'photo': 'https://i.pravatar.cc/150?img=12', 'logo': 'https://ui-avatars.com/api/?name=FCV&background=1D4ED8&color=fff'},
  {'name': 'Romain Basque', 'position': 'Défenseur', 'club': 'FC Versailles', 'age': 29, 'rating': 71, 'status': 'Sous Contrat', 'photo': 'https://i.pravatar.cc/150?img=13', 'logo': 'https://ui-avatars.com/api/?name=FCV&background=1D4ED8&color=fff'},
  {'name': 'Tom Renaud', 'position': 'Milieu', 'club': 'FC Versailles', 'age': 24, 'rating': 68, 'status': 'Sous Contrat', 'photo': 'https://i.pravatar.cc/150?img=14', 'logo': 'https://ui-avatars.com/api/?name=FCV&background=1D4ED8&color=fff'},
  {'name': 'Shelton Guillaume', 'position': 'Attaquant', 'club': 'FC Versailles', 'age': 27, 'rating': 70, 'status': 'Sous Contrat', 'photo': 'https://i.pravatar.cc/150?img=15', 'logo': 'https://ui-avatars.com/api/?name=FCV&background=1D4ED8&color=fff'},

  // --- FC Sochaux ---
  {'name': 'Mehdi Jeannin', 'position': 'Gardien', 'club': 'FC Sochaux', 'age': 33, 'rating': 73, 'status': 'Sous Contrat', 'photo': 'https://i.pravatar.cc/150?img=20', 'logo': 'https://ui-avatars.com/api/?name=FCSM&background=FBBF24&color=000'},
  {'name': 'Mathieu Peybernes', 'position': 'Défenseur', 'club': 'FC Sochaux', 'age': 34, 'rating': 74, 'status': 'Sous Contrat', 'photo': 'https://i.pravatar.cc/150?img=21', 'logo': 'https://ui-avatars.com/api/?name=FCSM&background=FBBF24&color=000'},
  {'name': 'Gaëtan Weissbeck', 'position': 'Milieu', 'club': 'FC Sochaux', 'age': 28, 'rating': 75, 'status': 'Sous Contrat', 'photo': 'https://i.pravatar.cc/150?img=22', 'logo': 'https://ui-avatars.com/api/?name=FCSM&background=FBBF24&color=000'},
  {'name': 'Moussa Doumbia', 'position': 'Attaquant', 'club': 'FC Sochaux', 'age': 30, 'rating': 73, 'status': 'Sous Contrat', 'photo': 'https://i.pravatar.cc/150?img=23', 'logo': 'https://ui-avatars.com/api/?name=FCSM&background=FBBF24&color=000'},

  // --- Dijon FCO ---
  {'name': 'Daniel Congré', 'position': 'Défenseur', 'club': 'Dijon FCO', 'age': 40, 'rating': 75, 'status': 'Sous Contrat', 'photo': 'https://i.pravatar.cc/150?img=30', 'logo': 'https://ui-avatars.com/api/?name=DFCO&background=DC2626&color=fff'},
  {'name': 'Bersant Celina', 'position': 'Milieu', 'club': 'Dijon FCO', 'age': 28, 'rating': 74, 'status': 'Sous Contrat', 'photo': 'https://i.pravatar.cc/150?img=31', 'logo': 'https://ui-avatars.com/api/?name=DFCO&background=DC2626&color=fff'},
  {'name': 'Moussa Konaté', 'position': 'Attaquant', 'club': 'Dijon FCO', 'age': 31, 'rating': 73, 'status': 'Sous Contrat', 'photo': 'https://i.pravatar.cc/150?img=32', 'logo': 'https://ui-avatars.com/api/?name=DFCO&background=DC2626&color=fff'},
  {'name': 'Júlio Tavares', 'position': 'Attaquant', 'club': 'Dijon FCO', 'age': 36, 'rating': 76, 'status': 'Sous Contrat', 'photo': 'https://i.pravatar.cc/150?img=33', 'logo': 'https://ui-avatars.com/api/?name=DFCO&background=DC2626&color=fff'},
];
