class Tree
{
  // -------------------------------------------
  class Node
  {
    ArrayList<Node> children;
    String command;
    
    Node(String command_){
      children = new ArrayList<Node>();
      command = command_;
    }
    
    void addchild(Node child){
      children.add(child);   
    }
    
    void changechild(Node child){
      children.set(children.size() - 1, child);
    }
    
    void changeAnychild(Node child,int index){
      children.set(index, child);
    }
    
    ArrayList<Node> getchildren(){
      return children;
    }
    
    void drawNode(int x,int y){
      if(command.equals("if")){
        fill(255,0,0);
      }
      else if(command.equals("for")){
        fill(0,255,0);
      }
      else if(command.equals("normal")){
        fill(0,0,255);
      }
      else if(command.equals("end")){
        fill(0,0,0);
      }
      else{
        fill(100,100,100);
      }
      circle(x, y, 50);
      fill(255);
    }
  }
  // -------------------------------------------
  Node root;
  
  Tree(String command){
    if(command.equals("if")){
      root = construcIftree();
    }
    else if(command.equals("for")){
      root = construcFortree();
    }
    else{
      root = construcNormaltree();
    }
    
  }
  
  Node construcIftree(){
    Node node = new Node("if");
    Node truechild = new Node("true");
    Node falsechild = new Node("false");
    Node nextchild = construcNormaltree();
    node.addchild(truechild);
    node.addchild(falsechild);
    node.addchild(nextchild);
    return node;
  }
  
  Node construcFortree(){
    Node node = new Node("for");
    Node forchild = construcNormaltree();
    node.addchild(forchild);
    return node;
  }
  
  Node construcNormaltree(){
    Node node = new Node("normal");
    Node normalchild = new Node("end");
    node.addchild(normalchild);
    return node;
  }
  
  void changeChild(Node child){
    root.changechild(child);
  }
  
  void changeFirstChild(Node child){
    root.changeAnychild(child,0);
  }
  void changeSecoundChild(Node child){
    root.changeAnychild(child,1);
  }
  
  Node getTree(){
    return root;
  }
  
  void draw(int w, int h,Node node){
    node.drawNode(w/2,h/10);
    ArrayList<Node> children = node.getchildren();
    for(int i=0; i<children.size(); i++){
      line(w/2,h/10,((w/children.size())*(i+1))/2,(h+1000)/10);
      draw((w/children.size())*(i+1),h+1000,children.get(i));
    }
  }
}