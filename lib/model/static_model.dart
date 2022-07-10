class Importance {
  final int id;
  final String nom;

  Importance({
    required this.id,
    required this.nom,
  });
}

List<Importance> importanceList = [
  Importance(id: 0, nom: "obligatoire"),
  Importance(id: 1, nom: "necessaire"),
  Importance(id: 2, nom: "negligeable")
];
