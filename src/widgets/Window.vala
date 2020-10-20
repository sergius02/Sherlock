public class Sherlock.Window {

    public Window (Sherlock.Application application) {

        // The Headerbar
        new Sherlock.HeaderBar (application);

        // Device IP page
        new Sherlock.DeviceIPBox (application);

        // Search IP page
        new Sherlock.SearchIPBox (application);
    }

}
