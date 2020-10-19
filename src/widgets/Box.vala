public abstract class Sherlock.Box : Gtk.Box {

    protected Sherlock.Application application;

    protected Gtk.Label labelIP;
    protected Gtk.Label labelAddress;
    protected Gtk.Label labelTimezone;
    protected Gtk.Label labelLatlong;
    protected Gtk.Label labelISP;
    protected Gtk.Label labelAS;

    protected Gtk.Image imageIP;
    protected Gtk.Image imageAddress;
    protected Gtk.Image imageTimezone;
    protected Gtk.Image imageLatlong;
    protected Gtk.Image imageISP;
    protected Gtk.Image imageAS;

    protected Gtk.Button buttonIP;
    protected Gtk.Button buttonAddress;
    protected Gtk.Button buttonTimezone;
    protected Gtk.Button buttonLatlong;
    protected Gtk.Button buttonISP;
    protected Gtk.Button buttonAS;
    protected Gtk.Button buttonRefresh;

    protected Gtk.Label labelJSONOutput;
    protected Gtk.Button buttonJSONOutput;

    protected Gtk.Button buttonRevealer;
    protected Gtk.Revealer revealerJSON;
    
    protected void initUI (string stackPrefix) {
        this.imageAddress = this.application.builder.get_object (stackPrefix + "_ImageAddress") as Gtk.Image;
        this.imageTimezone = this.application.builder.get_object (stackPrefix + "_ImageTimezone") as Gtk.Image;
        this.imageLatlong = this.application.builder.get_object (stackPrefix + "_ImageLatLong") as Gtk.Image;
        this.imageISP = this.application.builder.get_object (stackPrefix + "_ImageISP") as Gtk.Image;
        this.imageAS = this.application.builder.get_object (stackPrefix + "_ImageAS") as Gtk.Image;

        this.labelAddress = this.application.builder.get_object (stackPrefix + "_LabelAddress") as Gtk.Label;
        this.labelTimezone = this.application.builder.get_object (stackPrefix + "_LabelTimezone") as Gtk.Label;
        this.labelLatlong = this.application.builder.get_object (stackPrefix + "_LabelLatLong") as Gtk.Label;
        this.labelISP = this.application.builder.get_object (stackPrefix + "_LabelISP") as Gtk.Label;
        this.labelAS = this.application.builder.get_object (stackPrefix + "_LabelAS") as Gtk.Label;

        this.buttonAddress = this.application.builder.get_object (stackPrefix + "_ButtonAddress") as Gtk.Button;
        this.buttonTimezone = this.application.builder.get_object (stackPrefix + "_ButtonTimezone") as Gtk.Button;
        this.buttonLatlong = this.application.builder.get_object (stackPrefix + "_ButtonLatLong") as Gtk.Button;
        this.buttonISP = this.application.builder.get_object (stackPrefix + "_ButtonISP") as Gtk.Button;
        this.buttonAS = this.application.builder.get_object (stackPrefix + "_ButtonAS") as Gtk.Button;

        this.buttonJSONOutput = this.application.builder.get_object (stackPrefix + "_ButtonJSON") as Gtk.Button;
        this.labelJSONOutput = this.application.builder.get_object (stackPrefix + "_LabelJsonOutput") as Gtk.Label;

        setCopyButtonAction (this.buttonAddress, labelAddress, "Address");
        setCopyButtonAction (this.buttonTimezone, labelTimezone, "Timezone");
        setCopyButtonAction (this.buttonLatlong, labelLatlong, "Latitude and longitude");
        setCopyButtonAction (this.buttonISP, labelISP, "ISP");
        setCopyButtonAction (this.buttonAS, labelAS, "AS");
        setCopyButtonAction (this.buttonJSONOutput, labelJSONOutput, "JSON");

        this.buttonRevealer = this.application.builder.get_object (stackPrefix + "_ButtonRevealerJSON") as Gtk.Button;
        this.revealerJSON = this.application.builder.get_object (stackPrefix + "_RevealerJSON") as Gtk.Revealer;

        this.buttonRevealer.clicked.connect( () => {
            if (!this.revealerJSON.get_reveal_child()) {
                this.revealerJSON.set_reveal_child(true);
                this.buttonRevealer.set_label(_("Hide JSON response"));
            }
            else {
                this.revealerJSON.set_reveal_child(false);
                this.buttonRevealer.set_label(_("Show JSON response"));
            }
        });
    }

    protected void setCopyButtonAction (Gtk.Button button, Gtk.Label label, string notificationText) {
        button.clicked.connect( () => {
            this.application.clipboard.set_text (label.get_text (), -1);
            this.application.notification.set_body (_(notificationText + " copied to clipboard!"));
            this.application.send_notification ("com.github.sergius02.sherlock", application.notification);
        });
    }

    protected void fillLabels (string text) {
        var httpRequestHelper = new HTTPRequestHelper ();
        var response = httpRequestHelper.generateHTTPRequest (text);

        if (text == "") {
            this.labelIP.set_text (response.query);
        }
        
        this.labelAddress.set_text (response.zip + " " + response.city + ", " + response.regionName + ", " + response.country);
        this.labelTimezone.set_text (response.timezone);
        this.labelLatlong.set_text (response.lat + ", " + response.lon);
        this.labelISP.set_text (response.org + ", " + response.isp);
        this.labelAS.set_text (response.as);

        var resultJSON = httpRequestHelper.get_result ();
        this.labelJSONOutput.set_text (resultJSON);
    }

}