public class Application : Gtk.Application {

    public Gtk.CssProvider cssProvider;

    public Application () {
        Object (
            application_id: "com.github.sergius02.sherlock",
            flags: ApplicationFlags.FLAGS_NONE
        );
    }

    protected override void activate () {
        var builder = new Gtk.Builder.from_resource ("/com/github/sergius02/sherlock/ui/sherlock.glade");
        this.cssProvider = new Gtk.CssProvider();
        this.cssProvider.load_from_resource ("/com/github/sergius02/sherlock/css/sherlock.css");
        Gtk.StyleContext.add_provider_for_screen (Gdk.Screen.get_default (), cssProvider, Gtk.STYLE_PROVIDER_PRIORITY_USER);

        builder.set_application (this);
        var window = builder.get_object ("main_window") as Gtk.ApplicationWindow;
        var clipboard = Gtk.Clipboard.get_for_display (window.get_display (), Gdk.SELECTION_CLIPBOARD);

        add_window (window);

        window.show_all ();

        new Sherlock.Window (builder, clipboard);
    }
}