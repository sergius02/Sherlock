public abstract class Sherlock.Box : Gtk.Box {

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

    protected Gtk.Label label_json_output { get; set;}
    
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