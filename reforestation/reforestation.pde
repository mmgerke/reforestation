/* Maura Gerke
 * LMC 2700 Project 2
 * 10/8/17
 *
 * Reforestation!
 * Click to plant a seed in the ground and watch the trees grow!
 * After you plant 8 trees, the forest has recovered and
 * the ground will grow grass.
 *
 * I wanted to create the illusion of planting and growing
 * something as a type of permanent drawing. You can create different
 * patterns based on where you place the trees.
 */
 
ArrayList<Tree> trees = new ArrayList<Tree>();
int backgroundTime = 0;
 
 
 void setup()
 {
   size(500, 500);
   fill(66, 114, 58);
 }
 
 void draw()
 {
   // determine dirt or grass ground
     setBackgroundColor();
  
   // draw seed at mouse location
   drawSeed(mouseX, mouseY);
   
   // draw established trees
   for (Tree t : trees) {
     drawTree(t);
   }
   
 }
 
 // instantiantes a tree object at the mouse location
 void plantSeed() {
   Tree newTree = new Tree(mouseX, mouseY);
   trees.add(newTree);

 }
 
 void drawTree(Tree t) {
   // h is height of the tree at any moment
   float h = t.age/2;
   if (t.age < 300) {
     stroke(56, 46, 28);
     strokeWeight(t.age / 30);
     line(t.xpos, t.ypos, t.xpos, t.ypos - h);
     drawBranches(t.xpos, t.ypos, h);
     t.age = t.age + 1;
     // stop growing the trunk of the tree, just get taller
   } else if (t.age < 450){
     stroke(56, 46, 28);
     strokeWeight(9);
     line(t.xpos, t.ypos, t.xpos, t.ypos - h);
     drawBranches(t.xpos, t.ypos, h);
     t.age = t.age + 1;
     // stop growing tree and just show full tree
   } else {
     stroke(56, 46, 28);
     strokeWeight(9);
     line(t.xpos, t.ypos, t.xpos, t.ypos - h);
     drawBranches(t.xpos, t.ypos, h);
   }
 }
 
 // adds branches to the trunk of the tree
 void drawBranches(float x, float y, float h) {
   strokeWeight(2);
   float numBranches = h / 3;
   int i = 0;
   while (i <= numBranches) {
     stroke(34, 63, 26);
     line(x + (80 - i), (y - 3 * i), x - (80 - i), (y - 3 * i));
     i = i + 1;
   }   
 }
 
 void setBackgroundColor() {
   if (trees.size() < 8) {
     background(104, 90, 61);
   } else {
     background(77, 117, 78);
   }
 }
 
 void drawSeed(int x, int y)
 {
   fill(130, 100, 66);
   stroke(104, 80, 53);
   strokeWeight(1);
   ellipse(x, y, 18, 10);
 }
 
 void mouseReleased()
 {
   plantSeed();
 }
 
// obj represents a pine tree with a location,
// trunk, branches, and age
class Tree {
   float xpos, ypos, age;
   Tree(float x, float y) {
     xpos = x;
     ypos = y;
     age = 0;
   }
 }
