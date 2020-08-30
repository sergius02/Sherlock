public class Sherlock.SearchIPBox : Sherlock.Box {

    public SearchIPBox(Gtk.Builder builder) {
        this.image_address = builder.get_object("searchIP_ImageAddress") as Gtk.Image;
        this.image_timezone = builder.get_object("searchIP_ImageTimezone") as Gtk.Image;
        this.image_latlong = builder.get_object("searchIP_ImageLatLong") as Gtk.Image;
        this.image_isp = builder.get_object("searchIP_ImageISP") as Gtk.Image;
        this.image_as = builder.get_object("searchIP_ImageAS") as Gtk.Image;

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

}