#!/usr/bin/env python

from rich_pixels import Pixels

from textual.app        import App, ComposeResult
from textual.containers import HorizontalScroll
from textual.widgets    import Header, Footer, Static

class MassiveTalent( App[ None ] ):

    def compose( self ) -> ComposeResult:
        yield Header()
        with HorizontalScroll() as ht:
            ht.can_focus = True
            yield Static(expand=True)
        yield Footer()

    def on_mount( self ) -> None:
        self.query_one( Static ).styles.width = int( ( self.app.console.height - 2 ) * 3.5 ) * 2
        self.query_one( Static ).update(
            Pixels.from_image_path( "mt.png", resize=(
                int( ( self.app.console.height - 2 ) * 3.5 ),
                self.app.console.height - 2
            ) )
        )


if __name__ == "__main__":
    MassiveTalent().run()
