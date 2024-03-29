class Article {
  // nom, image, description, prix, categorie
  String nom;
  String image;
  String description;
  int prix; // prix en centime
  String categorie;

  // Créer un constructeur
  Article(
      {required this.nom,
      required this.image,
      required this.description,
      required this.prix,
      required this.categorie});

  // Créer une méthode pour afficher le prix en euros
  getPrixEnEuros() => '${prix / 100} €';

  Map<String, dynamic> toMap() {
    return {
      'title': this.nom,
      'image': this.image,
      'description': this.description,
      'price': this.prix,
      'category': this.categorie,
    };
  }

  factory Article.fromMap(Map<String, dynamic> map) {
    return Article(
      nom: map['title'] as String,
      image: map['image'] as String,
      description: map['description'] as String,
      prix: ((map['price'] as num) * 100).floor(),
      categorie: map['category'] as String,
    );
  }
}

void main() {
  // Créer une list d'articles
  // print un article avec son nom et son prix
  final list = <Article>[
    Article(
        nom: 'Article 1',
        image: 'image1.jpg',
        description: 'Description 1',
        prix: 10,
        categorie: 'Categorie 1'),
    Article(
        nom: 'Article 2',
        image: 'image2.jpg',
        description: 'Description 2',
        prix: 20,
        categorie: 'Categorie 2')
  ];
  for (var element in list) {
    print(element.getPrixEnEuros());
  }
}
