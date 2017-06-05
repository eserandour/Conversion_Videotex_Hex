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
