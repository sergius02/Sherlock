public class Sherlock.DeviceIPBox : Sherlock.Box {

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

        this.label_json_output = builder.get_object("deviceIP_LabelJsonOutput") as Gtk.Label;

        fillLabels("");
    }

}