import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="search-filter"
export default class extends Controller {
  static values = {
    cats: Array,
  };

  static targets = [
    "cat",
    "fluff",
    "angry",
    "distance",
    "price",
    "red",
    "black",
    "white",
    "mixed",
  ];

  connect() {
    // console.log("Filter 2 from stimulus");
    // console.log(this.catsValue);
  }

  apply(e) {
    e.preventDefault();

    const colours = []
    const fluff = this.fluffTarget.value
    const angry = this.angryTarget.value
    const distance = this.distanceTarget.value
    const price = this.priceTarget.value

    // console.log(this.fluffTarget.value)
    // console.log(this.angryTarget.value)
    // console.log(this.priceTarget.value)
    // console.log(this.distanceTarget.value)

    const checkboxes = [this.redTarget, this.blackTarget, this.whiteTarget, this.mixedTarget];

    //console.log(this.redTarget.checked)
    checkboxes.forEach((checkbox) => {
      if (checkbox.checked == true){
        //  console.log(checkbox.checked)
        colours.push(checkbox.value)
      }else{
        // console.log("no")
      }
    });
    // console.log(colours)

    const inputs = { fluffiness: fluff, angriness_level: angry, distance: distance, price: price, colors: colours }
    // console.log(inputs)

    // console.log(this.catsValue)
    let kitties = [];

    this.catsValue.forEach((cat) => {
      // console.log(cat.fluffiness)
      // console.log(this.fluffTarget.value)
      if (cat.fluffiness >= this.fluffTarget.value){

        if (cat.angriness_level >= this.angryTarget.value){
          kitties.push(cat)
          // console.log(kitties)

        }


      }
    }
    )

    // this.resultTarget.value = JSON.stringify(inputs)
  }
}
