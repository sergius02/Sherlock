public class Sherlock.SearchIPBox : Sherlock.Box {

    private Gtk.Grid gridInfo;

    private Gtk.Button buttonSearchIP;

    private Gtk.Entry entryIP;

    public SearchIPBox (Sherlock.Application application) {
        this.application = application;

        initUI ("searchIP");

        this.gridInfo = application.builder.get_object ("searchIP_GridInfo") as Gtk.Grid;
        gridInfo.visible = false;
        this.buttonRevealer.visible = false;

        this.buttonSearchIP = application.builder.get_object ("searchIP_ButtonSearchIP") as Gtk.Button;
        buttonSearchIP.clicked.connect( () => {
            this.entryIP = application.builder.get_object ("searchIP_EntryIP") as Gtk.Entry;
            this.gridInfo.visible = true;
            this.buttonRevealer.visible = true;
            fillLabels (this.entryIP.get_text ());
        });
    }

}