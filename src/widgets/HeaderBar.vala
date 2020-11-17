public class Sherlock.HeaderBar {

    private Gtk.Button linkbutton_github;

    public HeaderBar (Sherlock.Application application) {
        this.linkbutton_github = application.builder.get_object ("headerbar_github") as Gtk.LinkButton;
    }

}
