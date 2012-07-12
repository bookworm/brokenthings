class Node {
  public weak Node prev;
  public Node next;
}

class Test {
  private Object o;

  public unowned Object get_unowned_ref() {
    this.o = new Object();
    return this.o;
  }
}

delete o;