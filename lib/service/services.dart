int pourcentage(int objectif, int total) {
  int step = 0;
  step = (((total * 100) / objectif) * 0.1).round();

  return step;
}
