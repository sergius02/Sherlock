public abstract class Sherlock.Box : Gtk.Box {

    protected Sherlock.Application application;

    protected Gtk.Label label_ip;
    protected Gtk.Label label_address;
    protected Gtk.Label label_timezone;
    protected Gtk.Label label_lat_long;
    protected Gtk.Label label_isp;
    protected Gtk.Label label_as;

    protected Gtk.Button button_ip;
    protected Gtk.Button button_address;
    protected Gtk.Button button_timezone;
    protected Gtk.Button button_latlong;
    protected Gtk.LinkButton button_openmap;
    protected Gtk.Button button_isp;
    protected Gtk.Button button_as;
    protected Gtk.Button button_refresh;

    protected Gtk.Label label_json_output;
    protected Gtk.Button button_json_output;

    protected Gtk.Button button_revealer;
    protected Gtk.Revealer revealer_json;

    protected void init_ui (string stack_prefix) {
        this.label_address = this.application.builder.get_object (stack_prefix + "_LabelAddress") as Gtk.Label;
        this.label_timezone = this.application.builder.get_object (stack_prefix + "_LabelTimezone") as Gtk.Label;
        this.label_lat_long = this.application.builder.get_object (stack_prefix + "_LabelLatLong") as Gtk.Label;
        this.label_isp = this.application.builder.get_object (stack_prefix + "_LabelISP") as Gtk.Label;
        this.label_as = this.application.builder.get_object (stack_prefix + "_LabelAS") as Gtk.Label;

        this.button_address = this.application.builder.get_object (stack_prefix + "_ButtonAddress") as Gtk.Button;
        this.button_timezone = this.application.builder.get_object (stack_prefix + "_ButtonTimezone") as Gtk.Button;
        this.button_latlong = this.application.builder.get_object (stack_prefix + "_ButtonLatLong") as Gtk.Button;
        this.button_openmap = this.application.builder.get_object (stack_prefix + "_LinkButtonOpenMap") as Gtk.LinkButton;
        this.button_isp = this.application.builder.get_object (stack_prefix + "_ButtonISP") as Gtk.Button;
        this.button_as = this.application.builder.get_object (stack_prefix + "_ButtonAS") as Gtk.Button;

        this.button_json_output = this.application.builder.get_object (stack_prefix + "_ButtonJSON") as Gtk.Button;
        this.label_json_output = this.application.builder.get_object (stack_prefix + "_LabelJsonOutput") as Gtk.Label;

        set_copy_button_action (this.button_address, label_address, "Address");
        set_copy_button_action (this.button_timezone, label_timezone, "Timezone");
        set_copy_button_action (this.button_latlong, label_lat_long, "Latitude and longitude");
        set_copy_button_action (this.button_isp, label_isp, "ISP");
        set_copy_button_action (this.button_as, label_as, "AS");
        set_copy_button_action (this.button_json_output, label_json_output, "JSON");
        
        this.button_revealer = this.application.builder.get_object (stack_prefix + "_ButtonRevealerJSON") as Gtk.Button;
        this.revealer_json = this.application.builder.get_object (stack_prefix + "_RevealerJSON") as Gtk.Revealer;

        this.button_revealer.clicked.connect (() => {
            if (!this.revealer_json.get_reveal_child ()) {
                this.revealer_json.set_reveal_child (true);
                this.button_revealer.set_label (_("Hide JSON response"));
            }
            else {
                this.revealer_json.set_reveal_child (false);
                this.button_revealer.set_label (_("Show JSON response"));
            }
        });
    }

    protected void set_copy_button_action (Gtk.Button button, Gtk.Label label, string notification_text) {
        button.clicked.connect (() => {
            this.application.clipboard.set_text (label.get_text (), -1);
            this.application.notification.set_body (_(notification_text + " copied to clipboard!"));
            this.application.send_notification ("com.github.sergius02.sherlock", application.notification);
        });
    }

    protected void fill_labels (string text) {
        var http_request_helper = new HTTPRequestHelper ();
        var response = http_request_helper.generate_http_request (text);

        if (text == "") {
            this.label_ip.set_text (response.query);
        }

        this.label_address.set_text (
            response.zip + " " +
            response.city + ", " +
            response.region_name + ", " +
            response.country
        );
        this.label_timezone.set_text (response.timezone);
        this.label_lat_long.set_text (response.lat + ", " + response.lon);
        this.label_isp.set_text (response.org + ", " + response.isp);
        this.label_as.set_text (response.as);

        this.label_json_output.set_text (http_request_helper.get_result ());

        this.button_openmap.uri = "https://www.openstreetmap.org/#map=15/" + response.lat + "/" + response.lon;
    }

}
