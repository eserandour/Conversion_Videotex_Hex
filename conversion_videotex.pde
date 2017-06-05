// Télécharger Minitel11 pour créer un fichier Vidéotex d'une image avec Processing :
// https://drive.google.com/file/d/0BxdNVN-CFfF5aTdUUU1uREsxZ3M/view

// Le programme qui suit provient de la source suivante :
// http://bizets.blogspot.fr/2015/01/minitel-arduino-kac.html

String chaine="";

void setup() {
  size(200, 200);
  background(180);
  loadTex();
}

void draw() {
}

void loadTex() {
  selectInput("Choisir le fichier videoTex à charger", "fichierOuvrir");
}

void fichierOuvrir(File selection) {
  if (selection == null) {
    println("Annulation ouvrir fichier");
  } else {
    println("User selected " + selection.getAbsolutePath());
    byte[] tab = loadBytes(selection.getAbsolutePath());
    chaine = ""+ tab[0];
    for (int i = 1; i<tab.length; i++) {
      chaine = chaine + "," +tab[i] ;
    }
    println("longueur de la trame : " + tab.length);
    println("à copier dans Arduino : ");
    println(chaine);
  }
}
