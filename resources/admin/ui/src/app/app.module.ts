
import { NgModule } from "@angular/core";
import { BrowserModule } from "@angular/platform-browser";
import { ClarityModule } from "@clr/angular";
import { AppComponent } from "./app.component";

@NgModule({
  declarations: [
    AppComponent
  ],
  imports: [
    BrowserModule, ClarityModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule {}