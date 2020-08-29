public class Sherlock.Window {

    private Gtk.Builder builder { set; get; }

    public Window (Gtk.Builder builder) {

        // The Headerbar
        new Sherlock.HeaderBar(builder);

        // Device IP page
        new Sherlock.DeviceIPBox(builder);

        // Search IP page
        new Sherlock.SearchIPBox(builder);
    }

    
    
}
