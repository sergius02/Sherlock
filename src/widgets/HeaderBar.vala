public class Sherlock.HeaderBar {

    private Gtk.Button linkbuttonGithub { get; set; }

    public HeaderBar (Sherlock.Application application) {
        this.linkbuttonGithub = application.builder.get_object ("headerbar_github") as Gtk.LinkButton;
    }
    
}
