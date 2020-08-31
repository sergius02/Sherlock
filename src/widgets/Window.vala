public class Sherlock.Window {

    private Gtk.Builder builder { set; get; }

    public Window (Gtk.Builder builder, Gtk.Clipboard clipboard) {

        // The Headerbar
        new Sherlock.HeaderBar(builder);

        // Device IP page
        new Sherlock.DeviceIPBox(builder, clipboard);

        // Search IP page
        new Sherlock.SearchIPBox(builder, clipboard);
    }

    
    
}
