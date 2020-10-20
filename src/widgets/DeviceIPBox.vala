public class Sherlock.DeviceIPBox : Sherlock.Box {

    public DeviceIPBox (Sherlock.Application application) {
        this.application = application;

        init_ui ("deviceIP");

        this.label_ip = application.builder.get_object ("deviceIP_LabelIP") as Gtk.Label;
        this.button_ip = application.builder.get_object ("deviceIP_ButtonIP") as Gtk.Button;
        this.button_refresh = application.builder.get_object ("deviceIP_ButtonRefresh") as Gtk.Button;
        set_copy_button_action (this.button_ip, this.label_ip, "IP");

        this.button_refresh.clicked.connect (() => {
            fill_labels ("");
        });

        fill_labels ("");
    }

}
