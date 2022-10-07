enum APIEndPoints {
  playstationGames('games'),
  playstationGameDetail('games/{gameId}');

  final String path;

  const APIEndPoints(this.path);
}
