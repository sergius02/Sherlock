public class Sherlock.DeviceIPBox : Sherlock.Box {

    public DeviceIPBox(Gtk.Builder builder, Gtk.Clipboard clipboard) {
        this.builder = builder;
        this.clipboard = clipboard;

        initUI("deviceIP");

        this.image_ip = builder.get_object("deviceIP_ImageIP") as Gtk.Image;
        this.label_ip = builder.get_object("deviceIP_LabelIP") as Gtk.Label;
        this.button_ip = builder.get_object("deviceIP_ButtonIP") as Gtk.Button;
        button_ip.clicked.connect(() => {
            clipboard.set_text(label_ip.get_text(), -1);
        });
        

        fillLabels("");
    }

}