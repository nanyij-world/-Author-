
int border =  100;
int incit = 100;
int incedent = 50; 
int acharWidSum, mcharWidSum;
int yinc = 30;
float sizeinc = 0;
float colchange = 0;
int x1,y1,x2,y2;
float col1,col2,col3;
PFont start,authors,my;
PVector pos;
PVector mouse;

String Author = "As prescient as Lyman was about one direction that digitalism or politics might still take-in league with Derrida-he overlooked an equally powerful reverse direction. So did Benjamin and George Orwell. It seems clear as the century unwinds that the prophets of technocratic control, frightened by Hitler, by Stalin, by 1984, overlooked the capacity of an educated elite (infused with the anarchic vitality of contemporary fine and popular cultures) to resist control naturally, without conscious intent. Our prophets further overlooked the sheer profit awaiting those inventors and entrepreneurs able to create sensitive, intuitive computer programs, among them HyperCard and QuickTime; videoconferencing software (just hitting the market as I write this) like Sun's ShowMe and the primitive but freewheeling CUSeeMe developed by Cornell University; and the complex of browsers able to instantly access the World Wide Web (such as Mosaic and Netscape). Each of these programs in one way or another unlocks for the individual user a pluralist world of visual imagery, transmitted on demand and by personal choice. These events empower imagination rather than reason, as new tools placed in the hands of people with open minds always have. No hard-headed determinist would have predicted, in the fifteenth century, the evolution of the printed word into concrete poetry or James Joyce's Ulysses. Marshall McLuhan himself did not detect the coming of CNN, C-Span, Ernie Kovacs, David Letterman, what we now call interactive video, or indeed the World Wide Web itself. But I do not doubt the potential for a ferocious backlash, already in evidence at this writing as the U.S. Congress considers whether and how to purge the Internet of “Indecent” messages. Derrida’s warning must be heeded: the cultural police are with us again, refined down to subtle harmonies. Our task is to protect above all the higher, more complex reals of speech and action. In this quest we ought to be aided by certain natural tendencies overlooked by Lyman and his colleagues. The instant access enjoyed by the Stanford researchers decades ago can be seen as a decentralizing movement, too. It leads some of us to argue that all information is potentially and morally free, that is, beyond government control or individual copyright. More than a decade after Lyman, libraries increasingly offer not and stolid, imperious texts but fields of knowledge on a terminal with which the user can interact, revising and extending the central text. Potentially, the reader is now, as Lyman said in another context, the author.                                                          --Davis"; 
int la = Author.length();
AuthorLetter[] a;
    
String Mine = "The digital age gives people vast space for imagination and numerous tools to realize these imaginations. Escaping rules of nature, people can create and receive surprising results. Through digital means like photoshop or augmented reality, people are able to enhance reality and fuse wider variety of objects and effects together. The art works in this age are thus more diverse and from collective authors.                                       --Nanyi";
int lm = Mine.length();
MineLetter[] m;

void setup(){
  fullScreen();
  m = new MineLetter[lm];
  a = new AuthorLetter[la]; //an array of AuthorLetter of length la. 
  x1 = border +50;
  y1 = border;
  x2 = border +50;
  y2 = height - 300;
  acharWidSum=border+50;
  mcharWidSum=border+50;
  pos = new PVector(width/2,height/2);
  
  for (int i = 0; i < la; i++) {
     a[i] = new AuthorLetter(x1, y1, Author.charAt(i));  
     x1 += textWidth(Author.charAt(i))+5; 
     acharWidSum += textWidth(Author.charAt(i));
     if (acharWidSum >= width/2-incit/2 && Author.charAt(i) == ' '){ 
        y1 += yinc;
        x1 = border;
        acharWidSum = border;
       }  
     }
     
   for (int i =0; i <lm;i++){
    m[i]=new MineLetter(pos,Mine.charAt(i),x2,y2);
    x2 += textWidth(Mine.charAt(i))+5; 
    mcharWidSum += textWidth(Mine.charAt(i));
    if (mcharWidSum >= width/2-incit/2 && Mine.charAt(i) == ' '){ 
        y2 += yinc;
        x2 = border;
        mcharWidSum = border;
     }
   }
   
  start = createFont("Courier",26);
  authors = createFont("Avenir-Book",10);
  my = createFont("Monaco", 10);
  
 }
   


void draw(){
  mouse = new PVector (mouseX,mouseY);
  background(255);
  for (int j =0; j<lm;j++){
    if (mousePressed){
        pushMatrix();
        textFont(my);
        textSize(12+sizeinc);
        fill (220,50,50);
        m[j].home();
        m[j].displayP();
        popMatrix();
    }else{
        m[j].update();
        pushMatrix();
        fill(220,50,50);
        m[j].displayR();
        popMatrix();
    }
  }
  
  for (int i = 0; i < la; i++) {
    if (abs((a[i].y()- mouseY)) <= 2 && abs((a[i].x())-mouseX)<=2){
       sizeinc += 1;
       colchange += 10;
       //if (sizeinc >= 15){
       //  sizeinc += -1;
       //}
    }
    
    if (key == TAB){
        pushMatrix();
        textFont(authors);
        textSize(12+sizeinc);
        fill(col1+colchange,col2,col3);
        a[i].display();
        popMatrix();
        
      if (mousePressed) {
          a[i].home();
        }else {
          textSize(12);
          a[i].back();
          
         }
    }else{
      fill(0);
      noStroke();
      rect(0,0,width,height);
      fill(255);
      pushMatrix();
      fill(255);
      textFont(start);
      text("The Work Of Art In The Age Of Digital Reproduction", width/2-400, height/2-25);
      fill(220,50,50);
      textSize(20);
      text("Press tab to start", width/2-100, height/2+25);
      text("Press any key to exit", width/2-120, height/2+55);
      popMatrix();
      col1 = random(100,200);
      col2 = random(100,255);
      col3 = random(100,255);
      sizeinc=0;
      colchange=0;
      
     }
      
        
  }
}      
