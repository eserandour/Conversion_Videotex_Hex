// Télécharger Minitel11 pour créer un fichier Vidéotex d'une image avec Processing :
// https://drive.google.com/file/d/0BxdNVN-CFfF5aTdUUU1uREsxZ3M/view

// Le programme qui suit provient de la source suivante :
// http://bizets.blogspot.fr/2015/01/minitel-arduino-kac.html
// Ont été modifiées les valeurs de sorties (hexadécimales à la place de décimales)

String chaine="";

void setup() {
  size(200, 200);
  background(180);
  loadTex();
}

void draw() {
}

void loadTex() {
  selectInput("Choisir le fichier Vidéotex à charger", "fichierOuvrir");
}

void fichierOuvrir(File selection) {
  if (selection == null) {
    println("Annulation ouvrir fichier");
  } else {
    println("User selected " + selection.getAbsolutePath());
    byte[] tab = loadBytes(selection.getAbsolutePath());
    chaine = "" + hex(tab[0]);
    for (int i = 1; i<tab.length; i++) {
      chaine = chaine + "," + hex(tab[i]) ;
    }
    println("Longueur de la trame : " + tab.length);
    println("A copier dans Arduino : ");
    println(chaine);
  }
}
