PFont font, font2;

int size = 5;
boolean freepark = true;
int freeparkNum = 12;
int numcards = 1000;          // set higher as the total number of cards. 1000 is fine...
String title = "Custom Bingo";
String freeparkText = "X";
String gen = "Set03";        // Name the set. This is to mke sure that there are no identical cards in one game.

boolean save = false;


int min = 1;         // numbers starting from
int max = 45;        // numbers up to...
int tilesize = 75;   // size of one tile 
int textsize = 25;   // textsize in the tiles (numbers)
int titletextsize = 70;  //textsize of the title
int gap = 5;              // gap between the cards. set to 1 or 2 for easy cutting...

int pages = 10;
int cardsPerRow = 2;
int cardsPerCol = 3;

ArrayList<Card> Cards = new ArrayList<Card>();
Card myCard;
void setup(){
  for(int i = 0; i < numcards; i++){
     Cards.add(new Card(size, min, max, true));
  }
  // put the font files into the same folder as the .pde and adjust the name and size
  font = createFont("GloriousFree-dBR6.ttf", 200);
  font2 = createFont("FtAnimaRegular-z453.otf", 128);
  textFont(font);
  
  size(758,1362); // adjust to make them fit on one page. 
}

void draw(){
  fill(255);
  int k = 0;
 
  for(int x = 0; x < pages; x++){
  //cols
  for(int i = 0; i < cardsPerRow; i++){
     //rows
      for(int j = 0; j < cardsPerCol; j++){
           drawCard(Cards.get(k),i*tilesize*size+i*gap+1,j*tilesize*(size+1)+j*gap+1);
           k++;
    }
  }
  if(save){
    save(title + "_"+gen+"_" + String.format("%02d", x) +".png");
  }
  }
  noLoop();
}


void drawCard(Card C, int x, int y){
  // Title
  textFont(font);
  fill(128);
  rect(x,y, size*tilesize, tilesize);
  fill(255);
  textAlign(CENTER);
  textSize(titletextsize);
  int titleAdjuster = 25;    //adjust y position of the title
  text(title, x+(size*tilesize/2), y+textsize+titleAdjuster);    
  textFont(font2);
  int k = 0;
  //cols
  for(int i = 0; i < size; i++){
     //rows
      for(int j = 0; j < size; j++){
         fill(255);
         rect(x+j*tilesize,y+i*tilesize+tilesize,tilesize,tilesize);
         fill(0);
         textAlign(CENTER);
         textSize(textsize);
         if(k == freeparkNum){
           textFont(font);
           textSize(titletextsize);
           int freeAdjuster = 5;  //adjust y position of the free text
           text(freeparkText, x+j*tilesize+tilesize/2, y+i*tilesize+tilesize/2+textsize/2+tilesize+freeAdjuster);
           textFont(font2);
           if(gen != ""){
             textSize(7);
             int genAdjuster = 20;  //adjust y position of the gen text
             text(gen, x+j*tilesize+tilesize/2, y+i*tilesize+tilesize/2+textsize/2+tilesize+genAdjuster);
           }
           
         }
         else
         {
           
           text(C.numbers[k], x+j*tilesize+tilesize/2, y+i*tilesize+tilesize/2+textsize/2+tilesize); 
         }
         k++;
      }
  }
}
