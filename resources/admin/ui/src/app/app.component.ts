import { Component } from '@angular/core';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent {
  Toggle: Boolean = true
  PlayerCoords: number[] | string = "";
  PlayerRotation: number[] | string = "";

  Entity: number[] | string = "";
  EntityModel: number[] | string = "";
  EntityCoords: number[] | string = "";
  EntityRotation: number[] | string = "";
  EntityNetworkID: number[] | string = "";

  TogglePanel(value: boolean) {
    this.Toggle = value;
  }
  
}