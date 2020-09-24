public class Sherlock.SearchIPBox : Sherlock.Box {

    public SearchIPBox (Sherlock.Application application) {
        this.application = application;

        initUI ("searchIP");

        var gridinfo = application.builder.get_object ("searchIP_GridInfo") as Gtk.Grid;
        gridinfo.visible = false;
        this.button_buttonrevealer.visible = false;

        var button_searchip = application.builder.get_object ("searchIP_ButtonSearchIP") as Gtk.Button;
        button_searchip.clicked.connect( () => {
            var entryip = application.builder.get_object ("searchIP_EntryIP") as Gtk.Entry;
            gridinfo.visible = true;
            this.button_buttonrevealer.visible = true;
            fillLabels (entryip.get_text ());
        });
    }

}