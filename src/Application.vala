public class Application : Gtk.Application {

    public Application () {
        Object (
            application_id: "com.github.sergius02.sherlock",
            flags: ApplicationFlags.FLAGS_NONE
        );
    }

    protected override void activate () {
        var builder = new Gtk.Builder.from_resource ("/com/github/sergius02/sherlock/ui/sherlock.glade");

        builder.set_application (this);
        var window = builder.get_object("main_window") as Gtk.ApplicationWindow;

        add_window(window);

        window.show_all ();

        new Sherlock.Window(builder);
    }
}