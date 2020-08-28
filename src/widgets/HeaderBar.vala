public class Sherlock.HeaderBar {

    private Gtk.Button headerbar_github { get; set; }

    public HeaderBar(Gtk.Builder builder) {
        this.headerbar_github = builder.get_object("headerbar_github") as Gtk.LinkButton;
    }
    
}
