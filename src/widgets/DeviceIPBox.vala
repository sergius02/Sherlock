public class Sherlock.DeviceIPBox : Sherlock.Box {

    public DeviceIPBox (Sherlock.Application application) {
        this.application = application;
        
        initUI ("deviceIP");

        this.imageIP = application.builder.get_object ("deviceIP_ImageIP") as Gtk.Image;
        this.labelIP = application.builder.get_object ("deviceIP_LabelIP") as Gtk.Label;
        this.buttonIP = application.builder.get_object ("deviceIP_ButtonIP") as Gtk.Button;
        this.buttonRefresh = application.builder.get_object ("deviceIP_ButtonRefresh") as Gtk.Button;
        setCopyButtonAction(this.buttonIP, this.labelIP, "IP");

        this.buttonRefresh.clicked.connect (() => {
            fillLabels ("");
        });
        
        fillLabels ("");
    }
    
}