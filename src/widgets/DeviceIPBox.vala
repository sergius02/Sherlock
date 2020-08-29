public class Sherlock.DeviceIPBox : Gtk.Box {
    
    private Gtk.Label label_ip { get; set; }
    private Gtk.Label label_address { get; set; }
    private Gtk.Label label_timezone { get; set; }
    private Gtk.Label label_latlong { get; set; }
    private Gtk.Label label_isp { get; set; }
    private Gtk.Label label_as { get; set; }

    private Gtk.Image image_ip { get; set; }
    private Gtk.Image image_address { get; set; }
    private Gtk.Image image_timezone { get; set; }
    private Gtk.Image image_latlong { get; set; }
    private Gtk.Image image_isp { get; set; }
    private Gtk.Image image_as { get; set; }

    private Gtk.Label label_json_output { get; set;}

    public DeviceIPBox(Gtk.Builder builder) {
        this.image_ip = builder.get_object("deviceIP_ImageIP") as Gtk.Image;
        this.image_address = builder.get_object("deviceIP_ImageAddress") as Gtk.Image;
        this.image_timezone = builder.get_object("deviceIP_ImageTimezone") as Gtk.Image;
        this.image_latlong = builder.get_object("deviceIP_ImageLatLong") as Gtk.Image;
        this.image_isp = builder.get_object("deviceIP_ImageISP") as Gtk.Image;
        this.image_as = builder.get_object("deviceIP_ImageAS") as Gtk.Image;

        this.label_ip = builder.get_object("deviceIP_LabelIP") as Gtk.Label;
        this.label_address = builder.get_object("deviceIP_LabelAddress") as Gtk.Label;
        this.label_timezone = builder.get_object("deviceIP_LabelTimezone") as Gtk.Label;
        this.label_latlong = builder.get_object("deviceIP_LabelLatLong") as Gtk.Label;
        this.label_isp = builder.get_object("deviceIP_LabelISP") as Gtk.Label;
        this.label_as = builder.get_object("deviceIP_LabelAS") as Gtk.Label;

        this._label_json_output = builder.get_object("deviceIP_LabelJsonOutput") as Gtk.Label;

        fillLabels();
    }

    public void fillLabels() {
        var httpRequestHelper = new HTTPRequestHelper();
        var response = httpRequestHelper.getDeviceIP();

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