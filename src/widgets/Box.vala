public abstract class Sherlock.Box : Gtk.Box {

    protected Gtk.Builder builder { get; set; }
    protected Gtk.Clipboard clipboard { get; set; }

    protected Gtk.Label label_ip { get; set; }
    protected Gtk.Label label_address { get; set; }
    protected Gtk.Label label_timezone { get; set; }
    protected Gtk.Label label_latlong { get; set; }
    protected Gtk.Label label_isp { get; set; }
    protected Gtk.Label label_as { get; set; }

    protected Gtk.Image image_ip { get; set; }
    protected Gtk.Image image_address { get; set; }
    protected Gtk.Image image_timezone { get; set; }
    protected Gtk.Image image_latlong { get; set; }
    protected Gtk.Image image_isp { get; set; }
    protected Gtk.Image image_as { get; set; }

    protected Gtk.Button button_ip { get; set; }
    protected Gtk.Button button_address { get; set; }
    protected Gtk.Button button_timezone { get; set; }
    protected Gtk.Button button_latlong { get; set; }
    protected Gtk.Button button_isp { get; set; }
    protected Gtk.Button button_as { get; set; }

    protected Gtk.Label label_json_output { get; set;}
    protected Gtk.Button button_json_output { get; set; }

    protected Gtk.Button button_buttonrevealer { get; set; }
    
    protected void initUI(string stackPrefix) {
        this.image_address = builder.get_object(stackPrefix + "_ImageAddress") as Gtk.Image;
        this.image_timezone = builder.get_object(stackPrefix + "_ImageTimezone") as Gtk.Image;
        this.image_latlong = builder.get_object(stackPrefix + "_ImageLatLong") as Gtk.Image;
        this.image_isp = builder.get_object(stackPrefix + "_ImageISP") as Gtk.Image;
        this.image_as = builder.get_object(stackPrefix + "_ImageAS") as Gtk.Image;

        this.label_address = builder.get_object(stackPrefix + "_LabelAddress") as Gtk.Label;
        this.label_timezone = builder.get_object(stackPrefix + "_LabelTimezone") as Gtk.Label;
        this.label_latlong = builder.get_object(stackPrefix + "_LabelLatLong") as Gtk.Label;
        this.label_isp = builder.get_object(stackPrefix + "_LabelISP") as Gtk.Label;
        this.label_as = builder.get_object(stackPrefix + "_LabelAS") as Gtk.Label;

        this.button_address = builder.get_object(stackPrefix + "_ButtonAddress") as Gtk.Button;
        this.button_timezone = builder.get_object(stackPrefix + "_ButtonTimezone") as Gtk.Button;
        this.button_latlong = builder.get_object(stackPrefix + "_ButtonLatLong") as Gtk.Button;
        this.button_isp = builder.get_object(stackPrefix + "_ButtonISP") as Gtk.Button;
        this.button_as = builder.get_object(stackPrefix + "_ButtonAS") as Gtk.Button;

        button_address.clicked.connect(() => {
            clipboard.set_text(label_address.get_text(), -1);
        });

        button_timezone.clicked.connect(() => {
            clipboard.set_text(label_timezone.get_text(), -1);
        });

        button_latlong.clicked.connect(() => {
            clipboard.set_text(label_latlong.get_text(), -1);
        });

        button_isp.clicked.connect(() => {
            clipboard.set_text(label_isp.get_text(), -1);
        });

        button_as.clicked.connect(() => {
            clipboard.set_text(label_as.get_text(), -1);
        });

        this.button_buttonrevealer = builder.get_object(stackPrefix + "_ButtonRevealerJSON") as Gtk.Button;
        var revealer_json = builder.get_object(stackPrefix + "_RevealerJSON") as Gtk.Revealer;

        button_buttonrevealer.clicked.connect(() => {
            if (!revealer_json.get_reveal_child()){
                revealer_json.set_reveal_child(true);
                button_buttonrevealer.set_label(_("Hide JSON response"));
            }
            else {
                revealer_json.set_reveal_child(false);
                button_buttonrevealer.set_label(_("Show JSON response"));
            }
        });

        this.button_json_output = builder.get_object(stackPrefix + "_ButtonJSON") as Gtk.Button;
        this.label_json_output = builder.get_object(stackPrefix + "_LabelJsonOutput") as Gtk.Label;
        button_json_output.clicked.connect(() => {
            clipboard.set_text(label_json_output.get_text(), -1);
        });

    }

    protected void fillLabels(string text) {
        var httpRequestHelper = new HTTPRequestHelper();
        var response = httpRequestHelper.generateHTTPRequest(text);

        if (text == "")
            this.label_ip.set_text(response.query);
        
        this.label_address.set_text(response.zip + " " + response.city + ", " + response.regionName + ", " + response.country);
        this.label_timezone.set_text(response.timezone);
        this.label_latlong.set_text(response.lat + ", " + response.lon);
        this.label_isp.set_text(response.org + ", " + response.isp);
        this.label_as.set_text(response.as);

        var resultJSON = httpRequestHelper.get_result();
        this.label_json_output.set_text(resultJSON);
    }

}