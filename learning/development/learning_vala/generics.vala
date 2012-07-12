public class Wrapper<G> : GLib.Object {
  private G data;

  public void set_data(G data) {
    this.data = data;
  }

  public G get_data() {
    return this.data;
  }
}

var wrapper = new Wrapper<string>();
wrapper.set_data("test");
var data = wrapper.get_data();

var wrapper = new Wrapper<int>();
wrapper.set_data(222);