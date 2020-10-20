public class Sherlock.Application : Gtk.Application {

    public Gtk.Builder builder;

    public Notification notification;

    public Gtk.CssProvider css_provider;

    public Gtk.Clipboard clipboard;

    public Gtk.ApplicationWindow window;

    public static int main (string[] args) {
        var app = new Application ();
        return app.run (args);
    }

    public Application () {
        Object (
            application_id: "com.github.sergius02.sherlock",
            flags: ApplicationFlags.FLAGS_NONE
        );
    }

    protected override void activate () {
        this.builder = new Gtk.Builder.from_resource ("/com/github/sergius02/sherlock/ui/sherlock.glade");
        this.css_provider = new Gtk.CssProvider ();
        this.css_provider.load_from_resource ("/com/github/sergius02/sherlock/css/sherlock.css");
        Gtk.StyleContext.add_provider_for_screen (
            Gdk.Screen.get_default (), css_provider, Gtk.STYLE_PROVIDER_PRIORITY_USER);

        this.notification = new Notification (_("Sherlock"));

        builder.set_application (this);
        this.window = builder.get_object ("main_window") as Gtk.ApplicationWindow;
        this.clipboard = Gtk.Clipboard.get_for_display (this.window.get_display (), Gdk.SELECTION_CLIPBOARD);

        add_window (this.window);

        this.window.show_all ();

        new Sherlock.Window (this);
    }

}
