public class Sherlock.HeaderBar {

    private Gtk.Button headerbar_github { get; set; }

    public HeaderBar (Sherlock.Application application) {
        this.headerbar_github = application.builder.get_object ("headerbar_github") as Gtk.LinkButton;
    }
    
}
