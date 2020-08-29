public class Sherlock.SearchIPBox : Gtk.Box {
    
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

    public SearchIPBox(Gtk.Builder builder) {
        this.image_ip = builder.get_object("searchIP_ImageIP") as Gtk.Image;
        this.image_address = builder.get_object("searchIP_ImageAddress") as Gtk.Image;
        this.image_timezone = builder.get_object("searchIP_ImageTimezone") as Gtk.Image;
        this.image_latlong = builder.get_object("searchIP_ImageLatLong") as Gtk.Image;
        this.image_isp = builder.get_object("searchIP_ImageISP") as Gtk.Image;
        this.image_as = builder.get_object("searchIP_ImageAS") as Gtk.Image;

        this.label_ip = builder.get_object("searchIP_LabelIP") as Gtk.Label;
        this.label_address = builder.get_object("searchIP_LabelAddress") as Gtk.Label;
        this.label_timezone = builder.get_object("searchIP_LabelTimezone") as Gtk.Label;
        this.label_latlong = builder.get_object("searchIP_LabelLatLong") as Gtk.Label;
        this.label_isp = builder.get_object("searchIP_LabelISP") as Gtk.Label;
        this.label_as = builder.get_object("searchIP_LabelAS") as Gtk.Label;

        this.label_json_output = builder.get_object("searchIP_LabelJsonOutput") as Gtk.Label;

        var gridinfo = builder.get_object("searchIP_GridInfo") as Gtk.Grid;
        gridinfo.visible = false;
        var framejson = builder.get_object("searchIP_FrameJSON") as Gtk.Frame;
        framejson.visible = false;

        var button_searchip = builder.get_object("searchIP_ButtonSearchIP") as Gtk.Button;
        button_searchip.clicked.connect(() => {
            var entryip = builder.get_object("searchIP_EntryIP") as Gtk.Entry;
            gridinfo.visible = true;
            framejson.visible = true;
            fillLabels(entryip.get_text());
        });
    }

    public void fillLabels(string text) {
        var httpRequestHelper = new HTTPRequestHelper();
        var response = httpRequestHelper.searchIPInfo(text);

        this.label_address.set_text(response.zip + " " + response.city + ", " + response.regionName + ", " + response.country);
        this.label_timezone.set_text(response.timezone);
        this.label_latlong.set_text(response.lat + ", " + response.lon);
        this.label_isp.set_text(response.org + ", " + response.isp);
        this.label_as.set_text(response.as);

        var resultJSON = httpRequestHelper.get_result();
        this.label_json_output.set_text(resultJSON); 
    }

}