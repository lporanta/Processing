PImage kuva;
PImage kuva2;
PImage kuva3;
PImage kuva4;
PImage kuva5;
PImage kuva6;
PImage kuva7;
PImage kuva8;
PImage kuva9;
String url = "https://yle.fi/uutiset/tuoreimmat";
XML xml;
String[] s;
String[] splitKokoSivu;
String kokoSivu;
String kuvaUrl;
String kuvaUrl2;

void setup() {
  size(960, 540);
  s = loadStrings(url);
  for (String row : s) {
    kokoSivu+=row;
  }

  kokoSivu = kokoSivu.substring(kokoSivu.indexOf("Näytä kuvat"), kokoSivu.indexOf("IS_PICTURE_SUPPORTED"));

  kuvaUrl = "https:" + kokoSivu.substring(kokoSivu.indexOf("data-src=")+9, kokoSivu.indexOf(".jpg")+4);
  kokoSivu = kokoSivu.substring(kokoSivu.indexOf("jpg"), kokoSivu.length());
  kuva = loadImage(kuvaUrl, "jpg");
  
}
// kuvaUrl = kokoSivu.substring(kokoSivu.indexOf(hakusana)+hakusana.length+8, indexOf


void draw() {
  background(0);
  image(kuva, 0, 0);

}
