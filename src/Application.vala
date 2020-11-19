public class Sherlock.Application : Gtk.Application {

    public static string APP_VERSION = "1.2.0";

    public Gtk.Builder builder;

    public Notification notification;

    public Gtk.CssProvider css_provider;

    public Gtk.Clipboard clipboard;

    public Gtk.ApplicationWindow window;

    public static int main (string[] args) {
        var app = new Application (args);
        return app.run (args);
    }

    public Application (string[] args) {
        Object (
            application_id: "com.github.sergius02.sherlock",
            flags: ApplicationFlags.HANDLES_COMMAND_LINE
        );
    }

    public override int command_line (ApplicationCommandLine command_line) {
        if (command_line.get_arguments ().length == 1){ 
            // One arguments = only the command ./com.github.sergius02.sherlock
            activate ();
            return 0;
        } else {
            this.hold ();
            int res = _command_line (command_line);
            this.release ();
            return res;
        }
    }

    private int _command_line (ApplicationCommandLine command_line) {
        bool version = false;
        string ip = "";
        bool current = false;

        OptionEntry[] options = new OptionEntry[3];
        options[0] = {"version", 'v', 0, OptionArg.NONE, ref version, "Version number", null};
        options[1] = {"ip", 'i', 0, OptionArg.STRING, ref ip, "IP to search", null};
        options[2] = {"current", 'c', 0, OptionArg.NONE, ref current, "Use current device IP", null};
        // We have to make an extra copy of the array, since .parse assumes
		// that it can remove strings from the array without freeing them.
		string[] args = command_line.get_arguments ();
		string*[] _args = new string[args.length];
		for (int i = 0; i < args.length; i++) {
			_args[i] = args[i];
        }
        
		try {
			var opt_context = new OptionContext ("");
			opt_context.set_help_enabled (true);
			opt_context.add_main_entries (options, null);
			unowned string[] tmp = _args;
			opt_context.parse (ref tmp);
		} catch (OptionError e) {
			command_line.print ("error: %s\n", e.message);
			command_line.print ("Run '%s --help' to see a full list of available command line options.\n", args[0]);
			return 0;
		}

		if (version) {
			command_line.print ("Sherlock %s\n", APP_VERSION);
			return 0;
        }
        if (ip != "" || current) {
            HTTPRequestHelper helper = new HTTPRequestHelper ();
            helper.generate_http_request (ip);
            string result = helper.get_result ();
            print ("%s\n", result);
        }

        return 0;
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
